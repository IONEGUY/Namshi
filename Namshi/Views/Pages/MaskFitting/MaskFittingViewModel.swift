//
//  MaskFittingViewModel.swift
//  Namshi
//
//  Created by MacBook on 12/9/20.
//

import Foundation

class MaskFittingViewModel {
    var currentMask: String = "mask-2"
    var masks: [String] = ["mask-1", "mask-3"]
    
    func maskChanged(_ mask: String) {
        masks.removeAll(where: { $0 == mask })
        masks.append(currentMask)
        currentMask = mask
    }
}
