//  
//  MainScreenViewController.swift
//  SwiftUI + UIKit
//
//  Created by Omega on 15.06.2022.
//

import UIKit
import SwiftUI

final class MainScreenViewController: UIViewController {
    var presenter: MainScreenPresenterInput!
    
    private var viewModel: CityViewModel?
    
    @IBOutlet weak var cityTableView: UITableView!
    
    var currentCity: City = City.kazan
    var selectedCity: City?
    
    var city: City {
        selectedCity ?? currentCity
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCityTableView()
    }
    
    @IBSegueAction func toCityInfoView(_ coder: NSCoder) -> UIViewController? {
        viewModel = CityViewModel.init(currectCity: city)
        let controller = UIHostingController(coder: coder, rootView: CityInfoView(viewModel: viewModel!))
        return controller
    }
    
    func configureCityTableView() {
        cityTableView.layer.cornerRadius = 8
        cityTableView.delegate = self
        cityTableView.dataSource = self
        cityTableView.or_registerCellNib(forClass: CityTableViewCell.self)
    }
}

extension MainScreenViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCity = City.allCases[indexPath.row]
        viewModel?.update(newCity: city)
    }
}

extension MainScreenViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        City.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(for: indexPath, ofType: CityTableViewCell.self)
        cell.setup(city: City.allCases[indexPath.row])
        return cell
    }
}

extension MainScreenViewController: MainScreenViewInput {

}
