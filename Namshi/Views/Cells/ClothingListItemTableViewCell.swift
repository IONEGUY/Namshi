//
//  ClothingListItemCellTableViewCell.swift
//  Namshi
//
//  Created by MacBook on 12/5/20.
//

import UIKit

class ClothingListItemTableViewCell: UITableViewCell, Initializable {
    private let icon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .center
        return imageView
    }()
    
    private let iconContainer: UIView = {
        let view = UIView()
        view.applyRoundedStyle(cornerRadius: 30)
        view.backgroundColor = UIColor(hex: 0xEAEFF7)
        return view
    }()
    
    private let clothesName: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()
    
    func initialize(data: Any?) {
        guard let data = data as? (imageName: String, clothesName: String) else { return }
        
        icon.image = UIImage(named: data.imageName)
        clothesName.text = data.clothesName
        selectionStyle = .none
        
        contentView.addSubview(iconContainer)
        iconContainer.addSubview(icon)
        contentView.addSubview(clothesName)
        
        setupConstraints()
        setNeedsUpdateConstraints()
    }
    
    private func setupConstraints() {
        contentView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(15)
            make.left.bottom.right.equalToSuperview()
        }
        iconContainer.snp.makeConstraints { (make) in
            make.width.height.equalTo(60)
            make.left.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        icon.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        clothesName.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(iconContainer.snp.right).offset(15)
        }
    }
}
