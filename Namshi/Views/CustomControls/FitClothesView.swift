//
//  FitClothesView.swift
//  Namshi
//
//  Created by MacBook on 12/8/20.
//

import UIKit
import SnapKit

class FitClothesView: UIView {
    private let image: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    private let letsFitButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "camera"), for: .normal)
        button.setTitle("Lets fit!", for: .normal)
        button.imageEdgeInsets.right = 10
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.backgroundColor = UIColor(hex: 0x40A064)
        button.applyRoundedStyle(cornerRadius: 10)
        return button
    }()
    
    var fitClotherButtonPressed: (() -> ())?

    func setupView(_ imageName: String) {
        addSubview(image)
        addSubview(letsFitButton)
        
        addCorners()
        
        letsFitButton.onTap { [weak self] in self?.fitClotherButtonPressed?() }
        image.image = UIImage(named: imageName)
        
        setupConstraints()
        setNeedsUpdateConstraints()
    }

    private func addCorners() {
        Corner.allCases.forEach { corner in
            let imageView = UIImageView(image: UIImage(named: "corner"))
            addSubview(imageView)
            var cornerMaker: ((ConstraintMaker) -> (ConstraintMakerExtendable))?
            switch corner {
            case .leftTop:
                cornerMaker = { make in make.top.left }
            case .rightTop:
                imageView.transform = imageView.transform.rotated(by: .pi / 2)
                cornerMaker = { make in make.right.top }
            case .leftBottom:
                imageView.transform = imageView.transform.rotated(by: .pi * 3/2)
                cornerMaker = { make in make.left.bottom }
            case .rigthBottom:
                imageView.transform = imageView.transform.rotated(by: .pi)
                cornerMaker = { make in make.right.bottom }
            }
            imageView.snp.makeConstraints { (make) in
                make.height.width.equalTo(12)
                cornerMaker?(make).equalToSuperview().inset(5)
            }
        }
    }
    
    private func setupConstraints() {
        image.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        letsFitButton.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.height.equalTo(30)
            make.bottom.equalToSuperview().inset(16)
            make.centerX.equalToSuperview()
        }
    }
}
