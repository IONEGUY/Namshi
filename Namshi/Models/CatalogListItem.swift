//
//  CatalogListItem.swift
//  Namshi
//
//  Created by MacBook on 12/4/20.
//

import Foundation
import UIKit

struct CatalogListItem {
    var color: UIColor
    var imageName: String
    var categoryName: String
    var tapHandler: ((String) -> ())?
}
