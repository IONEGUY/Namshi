//
//  DIContainerConfigurator.swift
//  SmartEducation
//
//  Created by MacBook on 11/2/20.
//

import Foundation
import Swinject
import SwinjectAutoregistration

class DIContainerConfigurator {
    static var container = Container()

    static func initiate() {
        registerViewModels()
    }

    private static func registerViewModels() {
//        container.autoregister(FieldsOfScienceViewModel.self, initializer: FieldsOfScienceViewModel.init)
    }
}
