//
//  ClothesListItem.swift
//  Namshi
//
//  Created by MacBook on 12/3/20.
//

import UIKit

class ClothesListItemCell: UICollectionViewCell, Initializable {
    private var image: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private var clothesName: UILabel = {
        let clothesName = UILabel()
        clothesName.textColor = .black
        clothesName.font = UIFont.boldSystemFont(ofSize: 17)
        clothesName.textAlignment = .left
        return clothesName
    }()
    
    private var clothesSubName: UILabel = {
        let clothesSubName = UILabel()
        clothesSubName.textColor = UIColor(hex: 0x9BACC5)
        clothesSubName.font = UIFont.boldSystemFont(ofSize: 10)
        clothesSubName.textAlignment = .left
        return clothesSubName
    }()
    
    private var priceString: UILabel = {
        let priceString = UILabel()
        priceString.textAlignment = .left
        priceString.textColor = UIColor(hex: 0x40A064)
        priceString.font = UIFont.boldSystemFont(ofSize: 20)
        return priceString
    }()
    
    private var likeButton: UIButton = {
        let button = UIButton()
        button.imageEdgeInsets = UIEdgeInsets(top: 6, left: 5, bottom: 6, right: 5)
        button.setImage(UIImage(named: "wishlist"), for: .normal)
        button.backgroundColor = .white
        button.applyRoundedStyle(cornerRadius: 12)
        return button
    }()
    
    func initialize(data: Any?) {
        guard let clothesListItem = data as? ClothesListItem else { return }
        image.image = UIImage(named: clothesListItem.imageName)
        clothesName.text = clothesListItem.clothesName
        clothesSubName.text = clothesListItem.clothesSubName
        priceString.text = clothesListItem.priceString
        
        addSubview(image)
        addSubview(clothesName)
        addSubview(clothesSubName)
        addSubview(priceString)
        addSubview(likeButton)
        
        setupConstraints()
        
        setNeedsUpdateConstraints()
    }
    
    private func setupConstraints() {
        image.snp.makeConstraints { (make) in
            make.top.left.width.equalToSuperview()
            make.height.equalTo(image.snp.width).multipliedBy(1.45)
        }
        clothesName.snp.makeConstraints { (make) in
            make.left.width.equalToSuperview()
            make.height.equalTo(20)
            make.top.equalTo(image.snp.bottom).offset(10)
        }
        clothesSubName.snp.makeConstraints { (make) in
            make.left.width.equalToSuperview()
            make.height.equalTo(10)
            make.top.equalTo(clothesName.snp.bottom).offset(10)
        }
        priceString.snp.makeConstraints { (make) in
            make.left.width.equalToSuperview()
            make.height.equalTo(25)
            make.top.equalTo(clothesSubName.snp.bottom).offset(5)
        }
        likeButton.snp.makeConstraints { (make) in
            make.width.height.equalTo(24)
            make.top.right.equalToSuperview().inset(4)
        }
    }
}
