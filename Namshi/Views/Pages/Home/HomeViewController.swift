//
//  HomeViewController.swift
//  Namshi
//
//  Created by MacBook on 11/30/20.
//

import UIKit
import SnapKit

class HomeViewController: SearchBarViewController, MVVMViewController {
    typealias ViewModelType = HomeViewModel
        
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private var premium = UIView()
    
    private var autumn = UIView()
    
    private let scrollingElements: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "scrolling_elements")
        return imageView
    }()
    
    private let popularLabel: UILabel = {
        let label = UILabel()
        label.text = .homePage_Popular
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textAlignment = .left
        return label
    }()
    
    private let clothesListContainer: ClothesListContainer = {
        let clothesListContainer = ClothesListContainer()
        clothesListContainer.items = [
            ClothesListItem(imageName: "popular-1",
                            clothesName: "KHIZANA",
                            clothesSubName: "Embellished Self Tie Cape Abaya",
                            priceString: "194 AED"),
            ClothesListItem(imageName: "popular-2",
                            clothesName: "KHIZANA",
                            clothesSubName: "One Side Sequin Self Tie Abaya",
                            priceString: "38.18 BHD")
        ]
        return clothesListContainer
    }()
    
    var viewModel: HomeViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        premium = createSeasoneClothesItem("premium", "PREMIUM,-10%,discounts on all models")
        autumn = createSeasoneClothesItem("autumn", "AUTUMN,,new collection")
        
        view.addSubview(scrollView)
        scrollView.addSubview(premium)
        scrollView.addSubview(autumn)
        scrollView.addSubview(scrollingElements)
        scrollView.addSubview(popularLabel)
        scrollView.addSubview(clothesListContainer)
        
        setupConstraints()
        
        clothesListContainer.initView()
        
        view.setNeedsUpdateConstraints()
        view.layoutIfNeeded()
    }
    
    private func createSeasoneClothesItem(_ imageName: String, _ description: String) -> UIView {
        let descriptionArray = description.components(separatedBy: ",")
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImageView()
        image.image = UIImage(named: imageName)
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        let attrString = NSMutableAttributedString(string: "\n\(descriptionArray[0])\n", attributes: [
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 32),
            NSAttributedString.Key.foregroundColor : UIColor.white])
        attrString.append(NSMutableAttributedString(string: "\(descriptionArray[1])\n", attributes: [
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 22),
            NSAttributedString.Key.foregroundColor : UIColor.white]))
        attrString.append(NSMutableAttributedString(string: descriptionArray[2], attributes: [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16),
            NSAttributedString.Key.foregroundColor : UIColor.white]))
        label.attributedText = attrString
        view.addSubview(image)
        view.addSubview(label)
        image.fillSuperview()
        label.fillSuperview()
        return view
    }

    private func setupConstraints() {
        scrollView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalToSuperview().inset(15)
            make.top.equalToSuperview().offset(150)
        }
        premium.snp.makeConstraints { (make) in
            make.left.top.width.equalToSuperview()
            make.height.equalTo(premium.snp.width).multipliedBy(0.6)
        }
        autumn.snp.makeConstraints { (make) in
            make.top.equalTo(premium.snp.bottom)
            make.left.width.equalToSuperview()
            make.height.equalTo(premium.snp.width).multipliedBy(0.6)
        }
        scrollingElements.snp.makeConstraints { (make) in
            make.top.equalTo(autumn.snp.bottom)
            make.width.equalTo(90)
            make.height.equalTo(20)
            make.centerX.equalToSuperview()
        }
        popularLabel.snp.makeConstraints { (make) in
            make.top.equalTo(scrollingElements.snp.bottom)
            make.left.equalToSuperview().inset(10)
            make.width.equalToSuperview()
        }
        clothesListContainer.snp.makeConstraints { (make) in
            make.left.width.equalToSuperview().inset(10)
            make.top.equalTo(popularLabel.snp.bottom).offset(15)
            make.height.equalTo(350)
            make.bottom.equalToSuperview()
        }
    }
}
