//
//  CatalogListItemCell.swift
//  Namshi
//
//  Created by MacBook on 12/4/20.
//

import UIKit

class CatalogListItemCell: UITableViewCell, Initializable {
    private var icon: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private var categoryName: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    
    private var container: UIView = {
        let view = UIView()
        return view
    }()
        
    func initialize(data: Any?) {
        guard let catalogListItem = data as? CatalogListItem else { return }
        icon.image = UIImage(named: catalogListItem.imageName)
        categoryName.text = catalogListItem.categoryName
        container.backgroundColor = catalogListItem.color
 
        selectionStyle = .none
        container.applyRoundedStyle(cornerRadius: 8)
        container.addShadow()
        
        addSubview(container)
        container.addSubview(icon)
        container.addSubview(categoryName)
        
        setupConstraints()
        setNeedsUpdateConstraints()
    }
    
    private func setupConstraints() {
        container.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalToSuperview().inset(10)
        }
        icon.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.top.bottom.equalToSuperview()
            make.width.equalTo(100)
        }
        categoryName.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }
}
