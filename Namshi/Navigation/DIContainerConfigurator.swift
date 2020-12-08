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
        container.autoregister(HomeViewModel.self, initializer: HomeViewModel.init)
        container.autoregister(CatalogViewModel.self, initializer: CatalogViewModel.init)
        container.autoregister(ClothingViewModel.self, initializer: ClothingViewModel.init)
        container.autoregister(TypesOfClothesViewModel.self, initializer: TypesOfClothesViewModel.init)
        container.autoregister(ClothesDetailedViewModel.self, initializer: ClothesDetailedViewModel.init)
        container.autoregister(GallaryViewModel.self, initializer: GallaryViewModel.init)
        container.autoregister(MaskFittingViewModel.self, initializer: MaskFittingViewModel.init)
    }
}
