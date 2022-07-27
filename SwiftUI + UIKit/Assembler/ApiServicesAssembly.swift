//
//  ApiServicesAssembly.swift
//  City Guide
//
//  Created by Omega on 26.07.2022.
//


import Foundation
import Swinject
import SwinjectAutoregistration

final class ApiServicesAssembly: Assembly {

    public func assemble(container: Container) {
        container.autoregister(CitiesApiService.self, initializer: CityApiService.init)
    }
}
