//
//  ClothesPhotosView.swift
//  Namshi
//
//  Created by MacBook on 12/8/20.
//

import UIKit

class ClothesPhotosView: UIScrollView {
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 6
        return stackView
    }()
    
    private let defaultImageBackgroundColor = UIColor(hex: 0xEBEAEC)
    
    private let simplePhoto: UIImageView = {
        let imageView = UIImageView()
        imageView.applyRoundedStyle(cornerRadius: 5)
        return imageView
    }()
    
    private let fitClothesView: FitClothesView = {
        let view = FitClothesView()
        view.applyRoundedStyle(cornerRadius: 5)
        return view
    }()
    
    private let scaledImageWrapped: UIView = {
        let view = UIView()
        view.applyRoundedStyle(cornerRadius: 5)
        return view
    }()
    
    private let scaledImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .center
        return imageView
    }()
    
    var fitClotherButtonPressed: (() -> ())?
    
    private var contentCentered = false
    
    func setupView(_ imageName: String) {
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        
        addSubview(stackView)
        stackView.addArrangedSubview(simplePhoto)
        stackView.addArrangedSubview(fitClothesView)
        stackView.addArrangedSubview(scaledImageWrapped)
        scaledImageWrapped.addSubview(scaledImage)
        
        simplePhoto.image = UIImage(named: imageName)
        simplePhoto.backgroundColor = defaultImageBackgroundColor
        scaledImage.image = UIImage(named: imageName)
        scaledImageWrapped.clipsToBounds = true
        scaledImageWrapped.backgroundColor = defaultImageBackgroundColor
        fitClothesView.fitClotherButtonPressed = fitClotherButtonPressed
        fitClothesView.backgroundColor = defaultImageBackgroundColor
        fitClothesView.setupView(imageName)
        
        setupConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if contentCentered { return }
        contentCentered = true
        
        let centerOffsetX = (contentSize.width - frame.size.width) / 2
        let centerOffsetY = (contentSize.height - frame.size.height) / 2
        let centerPoint = CGPoint(x: centerOffsetX, y: centerOffsetY)
        setContentOffset(centerPoint, animated: false)
    }
    
    private func setupConstraints() {
        stackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.height.equalTo(300)
        }
        simplePhoto.snp.makeConstraints { (make) in
            make.width.equalTo(230)
        }
        fitClothesView.snp.makeConstraints { (make) in
            make.width.equalTo(230)
        }
        scaledImageWrapped.snp.makeConstraints { (make) in
            make.width.equalTo(230)
            make.height.equalToSuperview()
        }
        scaledImage.snp.makeConstraints { (make) in
            make.left.top.equalToSuperview()
            make.width.height.equalToSuperview()
        }
    }
}
