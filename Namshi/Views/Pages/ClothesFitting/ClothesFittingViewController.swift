//
//  GallaryViewController.swift
//  Namshi
//
//  Created by MacBook on 12/9/20.
//

import UIKit

class ClothesFittingViewController: UIViewController, MVVMViewController, UIGestureRecognizerDelegate {
    typealias ViewModelType = ClothesFittingViewModel

    private let rootContainer: UIView = {
        let view = UIView()
        view.applyRoundedStyle(cornerRadius: 10)
        view.clipsToBounds = true
        return view
    }()

    private let image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()

    private let addToCartButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = UIColor(hex: 0x40A064)
        button.applyRoundedStyle(cornerRadius: 10)
        button.tintColor = .white
        button.setImage(UIImage(named: "cart")?.withRenderingMode(.alwaysTemplate), for: .normal)
        return button
    }()

    private let expandButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "expand"), for: .normal)
        button.backgroundColor = .clear
        return button
    }()

    private let fittingImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "dress_transparent"))
        image.contentMode = .scaleAspectFill
        return image
    }()

    var viewModel: ClothesFittingViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        image.image = viewModel?.image
        view.backgroundColor = .white

        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        let pinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(handleScale))
        let rotationGestureRecognizer = UIRotationGestureRecognizer(target: self, action: #selector(handleRotation))
        panGestureRecognizer.delegate = self
        pinchGestureRecognizer.delegate = self
        rotationGestureRecognizer.delegate = self
        rootContainer.addGestureRecognizer(panGestureRecognizer)
        rootContainer.addGestureRecognizer(pinchGestureRecognizer)
        rootContainer.addGestureRecognizer(rotationGestureRecognizer)
        addSubviews()

        setupLeftBarButtonItem()

        setupConstraints()
        view.setNeedsUpdateConstraints()
    }

    @objc private func handlePan(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        fittingImage.center = CGPoint(x: fittingImage.center.x + translation.x,
                                      y: fittingImage.center.y + translation.y)
        gesture.setTranslation(.zero, in: view)
    }
    
    @objc private func handleScale(_ gesture: UIPinchGestureRecognizer) {
        fittingImage.transform = fittingImage.transform.scaledBy(x: gesture.scale, y: gesture.scale)
        gesture.scale = 1
    }
    
    @objc private func handleRotation(_ gesture: UIRotationGestureRecognizer) {
        fittingImage.transform = fittingImage.transform.rotated(by: gesture.rotation)
        gesture.rotation = 0
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith
                           otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
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
        rootContainer.addSubview(image)
        rootContainer.addSubview(expandButton)
        rootContainer.addSubview(addToCartButton)
        rootContainer.addSubview(fittingImage)
    }
    
    
    deinit {
        print("\(String(describing: self)) released")
    }

    private func setupConstraints() {
        let barHeight = navigationController?.navigationBar.bounds.size.height ?? 0
        rootContainer.snp.makeConstraints { (make) in
            make.left.bottom.right.equalToSuperview().inset(16)
            make.top.equalToSuperview().offset(barHeight)
        }
        image.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        expandButton.snp.makeConstraints { (make) in
            make.width.height.equalTo(40)
            make.left.bottom.equalToSuperview()
        }
        addToCartButton.snp.makeConstraints { (make) in
            make.bottom.right.equalToSuperview()
            make.width.equalTo(80)
            make.height.equalTo(40)
        }
        fittingImage.snp.makeConstraints { (make) in
            make.width.equalTo(200)
            make.height.equalTo(400)
            make.center.equalToSuperview()
        }
    }
}
