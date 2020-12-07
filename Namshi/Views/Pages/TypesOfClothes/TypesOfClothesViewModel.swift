//
//  TypesOfClothesViewModel.swift
//  Namshi
//
//  Created by MacBook on 12/7/20.
//

import Foundation

class TypesOfClothesViewModel: NavigatedToAware {
    var title: String = .empty
    var clothingItems: [ClothesListItem] = []

    func navigatedTo(_ params: [String : Any]) {
        guard let clothingType = params["ClothingType"] as? ClothingType else { return }
        
        switch clothingType {
        case .clothing:
            title = "Dress"
            clothingItems = [
                ClothesListItem(imageName: "dress-1",
                                clothesName: "ELLA",
                                clothesSubName: "Pleated Top Drawstring Midi Dress",
                                priceString: "38.18 AED"),
                ClothesListItem(imageName: "dress-2",
                                clothesName: "ELLA",
                                clothesSubName: "Pleated Top Drawstring Midi Dress",
                                priceString: "22.38 BHD"),
                ClothesListItem(imageName: "dress-3",
                                clothesName: "ELLA",
                                clothesSubName: "Pleated Top Drawstring Midi Dress",
                                priceString: "34.38 AED")]
        case .faceMask:
            title = "Face mask"
            clothingItems = [
                ClothesListItem(imageName: "mask-1",
                                clothesName: "PROTECTOR WIX",
                                clothesSubName: "Antibacterial face mask",
                                priceString: "44.38 AED"),
                ClothesListItem(imageName: "mask-2",
                                clothesName: "PROTECTOR COSMIC",
                                clothesSubName: "Antibacterial face mask",
                                priceString: "48.00 BHD"),
                ClothesListItem(imageName: "mask-3",
                                clothesName: "PROTECTOR JOY",
                                clothesSubName: "Antibacterial face mask",
                                priceString: "47.30 AED")
            ]
        }
    }
}
