//
//  MainScreenViewController.swift
//  SwiftUI + UIKit
//
//  Created by Omega on 15.06.2022.
//

import ORCommonUI_Swift
import SwiftUI
import UIKit

final class MainScreenViewController: BaseViewController {
    var presenter: MainScreenPresenterInput!

    private var viewModel: CityViewModel?

    @IBOutlet weak var loginButton: ORButton!
    @IBOutlet weak var userInfoView: UIView!
    @IBOutlet var cityTableView: UITableView!
    @IBOutlet weak var exitButton: UIButton!
    @IBOutlet weak var userInfoLabel: UILabel!

    var currentCity: City = .kazan
    var selectedCity: City?

    var city: City {
        selectedCity ?? currentCity
    }

    var isLoggedIn: Bool {
        !presenter.email.isEmpty
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupHeaderView()
        presenter.viewDidLoad()
        configureCityTableView()
        prepareNavigationBar()

        addNotificationObserver(name: .dataConfigured) { [weak self] _ in
            self?.cityTableView.reloadData()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        presenter.viewWillAppear()
    }

    @IBAction func onLoginButtonTouched() {
        presenter.onLoginTouched()
    }

    @IBAction func onExitTouched(_: Any) {
        presenter.onExitTouched()
    }

    func setupHeaderView() {
        makeUserView()
        if isLoggedIn {
            userInfoLabel.text = presenter.email
        }
    }

    func prepareDefaultSelection() {
        let indexPath = NSIndexPath(row: 0, section: 0)
        cityTableView.selectRow(at: indexPath as IndexPath, animated: false, scrollPosition: .none)
    }

    @IBSegueAction func toCityInfoView(_ coder: NSCoder) -> UIViewController? {
        viewModel = .init(currectCity: city)
        let controller = UIHostingController(
            coder: coder,
            rootView: CityInfoView(viewModel: viewModel!)
        )
        return controller
    }

    func configureCityTableView() {
        cityTableView.layer.cornerRadius = 8
        cityTableView.delegate = self
        cityTableView.dataSource = self
        cityTableView.or_registerCellNib(forClass: CityTableViewCell.self)
        prepareDefaultSelection()
    }
}

extension MainScreenViewController: UITableViewDelegate {
    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        50
    }

    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCity = City.allCases[indexPath.row]
        viewModel?.update(newCity: city)
        presenter.cityChanged()
    }
}

extension MainScreenViewController: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        City.allCases.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(for: indexPath, ofType: CityTableViewCell.self)
        let backgroundView = UIView()
        backgroundView.backgroundColor = .gray
        cell.selectedBackgroundView = backgroundView
        cell.setup(city: City.allCases[indexPath.row])
        return cell
    }
}

extension MainScreenViewController: MainScreenViewInput {

    func makeUserView() {
        loginButton.isHidden = isLoggedIn
        exitButton.isHidden = !isLoggedIn
        userInfoView.isHidden = !isLoggedIn
    }
}
