//
//  TypesOfClothesViewController.swift
//  Namshi
//
//  Created by MacBook on 12/7/20.
//

import UIKit
import SnapKit

class TypesOfClothesViewController: BaseViewController, MVVMViewController {
    typealias ViewModelType = TypesOfClothesViewModel
      
    private let clothesListContainer: ClothesListContainer = {
        let clothesListContainer = ClothesListContainer()
        return clothesListContainer
    }()
    
    deinit {
        print("\(String(describing: self)) released")
    }
    
    var viewModel: TypesOfClothesViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = viewModel?.title
        view.backgroundColor = .white
        setupRightBarButtonItem()
        
        clothesListContainer.items = viewModel?.clothingItems ?? []
        clothesListContainer.itemSelected = viewModel?.clothesSelected
        
        view.addSubview(clothesListContainer)
        setupConstraints()
        
        clothesListContainer.initView()
        
        view.setNeedsUpdateConstraints()
    }
    
    private func setupConstraints() {
        clothesListContainer.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.left.right.equalToSuperview().inset(20)
        }
    }
}
