//
//  ClothesDetailedViewController.swift
//  Namshi
//
//  Created by MacBook on 12/7/20.
//

import UIKit
import Closures

class ClothesDetailedViewController: UIViewController, MVVMViewController {
    typealias ViewModelType = ClothesDetailedViewModel
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private let clothesPhotosView: ClothesPhotosView = {
        let clothesPhotosView = ClothesPhotosView()
        return clothesPhotosView
    }()
    
    private let info: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    private let bottomSectionWrapper: UIView = {
        let view = UIView()
        return view
    }()
    
    private let bottomButtons: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.spacing = 16
        return stack
    }()
    
    private let selectSizeButton: UIButton = {
        let button = UIButton()
        button.semanticContentAttribute = .forceRightToLeft
        button.setTitle("select size", for: .normal)
        button.applyRoundedStyle(cornerRadius: 10)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.setTitleColor(UIColor(hex: 0x9BACC5), for: .normal)
        button.backgroundColor = UIColor(hex: 0xEAEFF7)
        button.setImage(UIImage(named: "arrow_down"), for: .normal)
        button.imageEdgeInsets.left = 15
        return button
    }()
    
    private let addToBagButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(hex: 0x40A064)
        button.applyRoundedStyle(cornerRadius: 10)
        button.setTitle("Add to bag", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return button
    }()
    
    private var clothesListContainer: UIView = {
        let clothesListContainer = UIView()
        return clothesListContainer
    }()
    
    var viewModel: ClothesDetailedViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let viewModel = self.viewModel else { return }
        
        view.backgroundColor = .white
        
        addSubviews()
        clothesPhotosView.fitClotherButtonPressed = fitClotherButtonPressed
        setupInfoLabel(viewModel)
        setupClothesListContainer(viewModel)
        setupRightBarButtonItem()
        setupLeftBarButtonItem()
        
        setupConstraints()
        view.setNeedsUpdateConstraints()
    }
    
    private func setupRightBarButtonItem() {
        let rightBarButtonItem = UIBarButtonItem()
        rightBarButtonItem.image = UIImage(named: "like_rounded")?
            .withRenderingMode(.alwaysOriginal)
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }

    private func setupLeftBarButtonItem() {
        let leftBarButtonItem = UIBarButtonItem()
        leftBarButtonItem.image = UIImage(named: "back_button_rounded")?
            .withRenderingMode(.alwaysOriginal)
        leftBarButtonItem.onTap { Router.pop() }
        navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
    @objc private func backButtonPressed() {
        Router.pop()
    }
    
    private func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(clothesPhotosView)
        scrollView.addSubview(info)
        scrollView.addSubview(clothesListContainer)
        scrollView.addSubview(bottomButtons)
        bottomButtons.addArrangedSubview(selectSizeButton)
        bottomButtons.addArrangedSubview(addToBagButton)
    }
    
    private func setupClothesListContainer(_ viewModel: ClothesDetailedViewModel) {
        if viewModel.clothingType == .faceMask {
            clothesPhotosView.setupView("mask-1")
            
            let clothesList = ClothesListContainer()
            clothesListContainer.addSubview(clothesList)
            clothesList.snp.makeConstraints { (make) in
                make.edges.equalToSuperview()
            }
            clothesList.items = viewModel.popularSection
            clothesList.initView()
        } else {
            clothesPhotosView.setupView("dress-1")
            
            let clothesColors = createClothesColorsView(viewModel.colorsSection)
            clothesListContainer.addSubview(clothesColors)
            clothesColors.snp.makeConstraints { (make) in
                make.edges.equalToSuperview()
            }
        }
    }
    
    private func fitClotherButtonPressed() {
        if viewModel?.clothingType == .clothing {
            showPopup()
            return
        }
        
        viewModel?.navigateToMaskFitting()
    }
    
    private func showPopup() {
        let cover = UIView()
        cover.layer.backgroundColor = UIColor(hexWithAlpha: 0x00000033).cgColor
        view.addSubview(cover)
        cover.addTapGesture { _ in
            cover.removeFromSuperview()
        }
        
        let popup = ChoosePhotoPopup()
        cover.addSubview(popup)
        popup.doItButtonTapped = viewModel?.navigateToGallary
        popup.setupView()
        
        cover.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupInfoLabel(_ viewModel: ClothesDetailedViewModel) {
        let infoAttributedText = NSMutableAttributedString(string: "\(viewModel.name)\n", attributes: [
             NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18),
             NSAttributedString.Key.foregroundColor: UIColor.black])
        
        infoAttributedText.append(NSMutableAttributedString(string: "\(viewModel.subName)\n", attributes: [
             NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 12),
             NSAttributedString.Key.foregroundColor: UIColor(hex: 0x9BACC5)]))
        
        infoAttributedText.append(NSMutableAttributedString(string: "\(viewModel.priceString)\n\n", attributes: [
             NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16),
             NSAttributedString.Key.foregroundColor: UIColor(hex: 0x40A064)]))
        
        infoAttributedText.append(NSMutableAttributedString(string: "About\n", attributes: [
             NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18),
             NSAttributedString.Key.foregroundColor: UIColor.black]))
        
        infoAttributedText.append(NSMutableAttributedString(string: "\(viewModel.about)\n\n", attributes: [
             NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 12),
             NSAttributedString.Key.foregroundColor: UIColor(hex: 0x9BACC5)]))
        
        infoAttributedText.append(NSMutableAttributedString(string: viewModel.bottomSectionName, attributes: [
             NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16),
             NSAttributedString.Key.foregroundColor: UIColor.black]))
        
        info.attributedText = infoAttributedText
    }
    
    private func createClothesColorsView(
        _ clothesColors: [(imageName: String, colorName: String)]) -> UIStackView {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 5
        clothesColors.forEach {
            let view = ClothesColorView()
            stack.addArrangedSubview(view)
            view.setupUI(clothesColorItem: $0)
        }
        return stack
    }
    
    private func setupConstraints() {
        let barHeight = navigationController?.navigationBar.bounds.size.height ?? 0
        scrollView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalToSuperview().inset(15)
            make.top.equalToSuperview().offset(-barHeight)
        }
        clothesPhotosView.snp.makeConstraints { (make) in
            make.left.top.width.equalToSuperview()
            make.height.equalTo(300)
        }
        info.snp.makeConstraints { (make) in
            make.left.width.equalToSuperview()
            make.top.equalTo(clothesPhotosView.snp.bottom).offset(17)
        }
        clothesListContainer.snp.makeConstraints { (make) in
            make.left.width.equalToSuperview()
            make.top.equalTo(info.snp.bottom).offset(17)
            make.height.equalTo(350)
        }
        selectSizeButton.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(0.35)
        }
        bottomButtons.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.width.equalToSuperview()
            make.top.equalTo(clothesListContainer.snp.bottom).offset(30)
            make.height.equalTo(44)
            make.bottom.equalTo(scrollView.snp.bottom)
        }
    }
}
