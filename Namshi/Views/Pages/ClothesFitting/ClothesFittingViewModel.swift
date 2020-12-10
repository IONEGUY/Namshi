//
//  GallaryViewModel.swift
//  Namshi
//
//  Created by MacBook on 12/9/20.
//

import Foundation
import UIKit

class ClothesFittingViewModel: NavigatedToAware {
    var image: UIImage?
    
    func navigatedTo(_ params: [String : Any]) {
        image = params["Image"] as? UIImage
    }    
}
