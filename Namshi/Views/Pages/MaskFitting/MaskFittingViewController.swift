//
//  MaskFittingViewController.swift
//  Namshi
//
//  Created by MacBook on 12/9/20.
//

import UIKit

class MaskFittingViewController: UIViewController, MVVMViewController {
    typealias ViewModelType = MaskFittingViewModel
    
    private let rootContainer: UIView = {
        let view = UIView()
        view.applyRoundedStyle(cornerRadius: 10)
        view.clipsToBounds = true
        view.backgroundColor = .green
        return view
    }()
    
    private let masksContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 40
        stackView.backgroundColor = .clear
        return stackView
    }()

    private let maskFittingView: MaskFittingView = {
        let maskFittingView = MaskFittingView()
        return maskFittingView
    }()

    private let addToCartButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = UIColor(hex: 0x40A064)
        button.applyRoundedStyle(cornerRadius: 10)
        button.tintColor = .white
        button.setImage(UIImage(named: "cart")?.withRenderingMode(.alwaysTemplate), for: .normal)
        return button
    }()
    
    var viewModel: MaskFittingViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        setupMasksContainer()
        setupLeftBarButtonItem()
        addSubviews()
        setupConstraints()
        
        maskFittingView.setup(viewModel?.currentMask ?? .empty)
        
        view.setNeedsUpdateConstraints()
    }
    
    private func setupMasksContainer() {
        masksContainer.subviews.forEach { $0.removeFromSuperview() }
        viewModel?.otherMasks.forEach { mask in
            let button = UIButton()
            button.backgroundColor = .white
            button.setImage(UIImage(named: mask), for: .normal)
            button.onTap { [weak self] in
                self?.maskFittingView.updateMask(mask)
                self?.viewModel?.maskChanged(mask)
                self?.setupMasksContainer()
            }
            button.applyRoundedStyle(cornerRadius: 10)
            masksContainer.addArrangedSubview(button)
            button.snp.makeConstraints { (make) in
                make.width.equalTo(130)
            }
        }
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
        view.addSubview(rootContainer)
        rootContainer.addSubview(maskFittingView)
        rootContainer.addSubview(addToCartButton)
        rootContainer.addSubview(masksContainer)
    }
    
    private func setupConstraints() {
        let barHeight = navigationController?.navigationBar.bounds.size.height ?? 0
        rootContainer.snp.makeConstraints { (make) in
            make.left.bottom.right.equalToSuperview().inset(16)
            make.top.equalToSuperview().offset(barHeight)
        }
        addToCartButton.snp.makeConstraints { (make) in
            make.bottom.right.equalToSuperview()
            make.width.equalTo(80)
            make.height.equalTo(40)
        }
        masksContainer.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.height.equalTo(120)
            make.bottom.equalTo(addToCartButton.snp.top).offset(-30)
        }
        maskFittingView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}
