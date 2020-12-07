//
//  SeasonedClothesCollectionViewCell.swift
//  Namshi
//
//  Created by MacBook on 12/2/20.
//

import UIKit

class SeasonClothesCollectionViewCell: UICollectionViewCell, Initializable {
    var image: UIImageView = {
        let image = UIImageView()
        image.applyRoundedStyle()
        return image
    }()
    
    func initialize(data: Any?) {
        addSubview(image)
        image.fillSuperview()
        guard let imageName = data as? String else { return }
        image.image = UIImage(named: imageName)
        fillSuperview()
    }
}
