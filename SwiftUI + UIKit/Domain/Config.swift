//
//  Config.swift
//  City Guide
//
//  Created by Omega on 26.07.2022.
//

import Foundation
import Swinject

public enum Config {
    public static var resolver: Resolver!
}

public func resolve<Service>() -> Service {
    Config.resolver.resolve(Service.self)!
}

public func resolve<Service>(type: Service.Type) -> Service {
    Config.resolver.resolve(type)!
}

public func resolve<Service, Arg>(argument: Arg) -> Service {
    Config.resolver.resolve(Service.self, argument: argument)!
}
