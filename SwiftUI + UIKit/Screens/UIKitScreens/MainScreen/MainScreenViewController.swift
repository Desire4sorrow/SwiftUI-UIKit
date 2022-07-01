//
//  MainScreenViewController.swift
//  SwiftUI + UIKit
//
//  Created by Omega on 15.06.2022.
//

import SwiftUI
import UIKit

final class MainScreenViewController: UIViewController {
    var presenter: MainScreenPresenterInput!

    private var viewModel: CityViewModel?

    @IBOutlet var cityTableView: UITableView!

    var currentCity: City = .kazan
    var selectedCity: City?

    var city: City {
        selectedCity ?? currentCity
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureCityTableView()
        prepareNavigationBar()
    }

    func prepareDefaultSelection() {
        let indexPath = NSIndexPath(row: 0, section: 0)
        cityTableView.selectRow(at: indexPath as IndexPath, animated: false, scrollPosition: .none)
    }

    func prepareNavigationBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
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

extension MainScreenViewController: MainScreenViewInput {}
