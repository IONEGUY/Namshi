//
//  ClothesDetailedViewModel.swift
//  Namshi
//
//  Created by MacBook on 12/7/20.
//

import Foundation

class ClothesDetailedViewModel: NavigatedToAware {
    var name: String = .empty
    var subName: String = .empty
    var priceString: String = .empty
    var about: String = .empty
    var bottomSectionName: String = .empty
    var clothingType: ClothingType = .none
    var popularSection = [
        ClothesListItem(imageName: "mask-2",
                        clothesName: "PROTECTOR COSMIC",
                        clothesSubName: "Antibacterial face mask",
                        priceString: "48.00 BHD"),
        ClothesListItem(imageName: "mask-3",
                        clothesName: "PROTECTOR JOY",
                        clothesSubName: "Antibacterial face mask",
                        priceString: "47.30 AED")]
    var colorsSection: [(imageName: String, colorName: String)] = [
        (imageName: "dress-2", colorName: "BLACK"),
        (imageName: "dress-3", colorName: "GRAY")
    ]
    
    func navigatedTo(_ params: [String : Any]) {
        guard let clothingType = params["ClothingType"] as? ClothingType else { return }
        self.clothingType = clothingType
        
        switch clothingType {
        case .clothing:
            name = "ELLA"
            subName = "Pleated Top Drawstring Midi Dress"
            priceString = "38.18 BHD"
            about = "Comfortable fabric with pin-tuck details."
            bottomSectionName = "Colors"
        case .faceMask:
            name = "Protector wix"
            subName = "Antibacterial face mask"
            priceString = "44.38 BHD"
            about = "Non-medical grade face mask; This product is not a substitute for social distancing guidelines"
            bottomSectionName = "Popular"
        default:
            break
        }
    }
    
    func navigateToGallary() {
        Router.show(GallaryViewController.self)
    }
    
    func navigateToMaskFitting() {
        Router.show(MaskFittingViewController.self)
    }
}
