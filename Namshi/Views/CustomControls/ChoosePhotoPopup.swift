//
//  ChoosePhotoPopup.swift
//  Namshi
//
//  Created by MacBook on 12/8/20.
//

import UIKit

class ChoosePhotoPopup: UIView {
    private let image: UIImageView = {
        let image = UIImageView(image: UIImage(named: "woman_outline"))
        return image
    }()
    
    private let text: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        label.text = "Choose a photo from the gallery like this"
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.applyRoundedStyle(cornerRadius: 10)
        button.setTitle("Do it!", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(hex: 0x40A064)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        return button
    }()
    
    var doItButtonTapped: (() -> ())?
    
    func setupView() {
        backgroundColor = .white
        applyRoundedStyle(cornerRadius: 8)
        
        button.onTap { [weak self] in self?.doItButtonTapped?() }
        
        addSubview(image)
        addSubview(text)
        addSubview(button)
        
        setupConstraints()
        setNeedsUpdateConstraints()
    }
    
    private func setupConstraints() {
        snp.makeConstraints { (make) in
            make.width.equalTo(230)
            make.height.equalTo(300)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(120)
        }
        image.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(15)
            make.height.equalTo(185)
        }
        text.snp.makeConstraints { (make) in
            make.top.equalTo(image.snp.bottom).offset(10)
            make.left.right.equalToSuperview().inset(36)
        }
        button.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.equalTo(80)
            make.height.equalTo(30)
            make.top.equalTo(text.snp.bottom).offset(14)
            make.bottom.equalToSuperview().inset(15)
        }
    }
}
