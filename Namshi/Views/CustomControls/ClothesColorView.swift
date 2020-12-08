//
//  ClothesColorView.swift
//  Namshi
//
//  Created by MacBook on 12/8/20.
//

import UIKit

class ClothesColorView: UIView {
    private let image: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    private let text: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    func setupUI(clothesColorItem: (imageName: String, colorName: String)) {
        addSubview(image)
        addSubview(text)
        
        image.image = UIImage(named: clothesColorItem.imageName)
        text.text = clothesColorItem.colorName
        
        setupConstraints()
        setNeedsUpdateConstraints()
    }
    
    private func setupConstraints() {
        image.snp.makeConstraints { (make) in
            make.top.left.width.equalToSuperview()
            make.height.equalTo(image.snp.width).multipliedBy(1.45)
        }
        text.snp.makeConstraints { (make) in
            make.left.width.equalToSuperview()
            make.height.equalTo(20)
            make.top.equalTo(image.snp.bottom).offset(10)
        }
    }
}
