//
//  ClothingViewModel.swift
//  Namshi
//
//  Created by MacBook on 12/4/20.
//

import Foundation

class ClothingViewModel: NavigatedToAware {
    var title: String = .empty
    var clothingItems: [(imageName: String, clothesName: String)] = []
    
    func navigatedTo(_ params: [String : Any]) {
        guard let clothingType = params["ClothingType"] as? ClothingType else { return }
        
        switch clothingType {
        case .clothing:
            title = "Clothing"
            clothingItems = [(imageName: "dress", clothesName: "Dress")]
        case .faceMask:
            title = "Accessories"
            clothingItems = [(imageName: "mask", clothesName: "Face mask")]
        case .none:
            break
        }
    }
    
    func clothingItemSelected(clothingItemName: String?) {
        Router.show(TypesOfClothesViewController.self, params: [
            "ClothingType": clothingItemName == "dress"
                ? ClothingType.clothing
                : ClothingType.faceMask])
    }
}
