//
//  CatalogViewModel.swift
//  Namshi
//
//  Created by MacBook on 11/30/20.
//

import Foundation
import UIKit

class CatalogViewModel {
    var categories: [CatalogListItem] = []
    
    init() {
        categories = [
            CatalogListItem(color: UIColor(hex: 0xB2C5B9),
                            imageName: "woman",
                            categoryName: "Clothing",
                            tapHandler: { [weak self] in
                                self?.navigateToClothingViewController(.clothing) }),
            CatalogListItem(color: UIColor(hex: 0xF3DDCF),
                            imageName: "bag",
                            categoryName: "Accessories",
                            tapHandler: { [weak self] in
                                self?.navigateToClothingViewController(.faceMask) })
        ]
    }
    
    private func navigateToClothingViewController(_ clothingType: ClothingType) {
        Router.show(ClothingViewController.self, params: ["ClothingType" : clothingType])
    }
}
