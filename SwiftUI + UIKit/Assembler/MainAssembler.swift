//
//  MainAssembler.swift
//  City Guide
//
//  Created by Omega on 26.07.2022.
//

import Foundation
import Swinject

public enum MainAssembler {

    private static let assembler = Assembler([
        ApiServicesAssembly()
    ])

    public static func start() {
        Config.resolver = assembler.resolver
    }
}
