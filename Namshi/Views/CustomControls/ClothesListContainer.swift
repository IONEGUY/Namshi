//
//  ClothesList.swift
//  Namshi
//
//  Created by MacBook on 12/3/20.
//

import UIKit
import Closures

class ClothesListContainer: UICollectionView {
    var items: [ClothesListItem] = []
    var itemSelected: ((ClothesListItem?) -> ())?

    init() {
        super.init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initView() {
        backgroundColor = .clear
        showsVerticalScrollIndicator = false
        register(ClothesListItemCell.self,
                 forCellWithReuseIdentifier: ClothesListItemCell.typeName)

        numberOfItemsInSection { [weak self] _ in
            return self?.items.count ?? 0
        }
        .cellForItemAt { [weak self] indexPath in
            let cell = self?.dequeueReusableCell(
                withReuseIdentifier: ClothesListItemCell.typeName, for: indexPath)
            let fieldOfScience = self?.items[indexPath.row]
            (cell as? ClothesListItemCell)?.initialize(data: fieldOfScience)
            return cell ?? UICollectionViewCell()
        }
        .sizeForItemAt { [weak self] indexPath in
            guard let self = self else { return .zero }
            return CGSize(width: self.frame.width / 2 - 5,
                          height: 350)
        }
        .didSelectItemAt { [weak self] indexPath in
            let item = self?.items[indexPath.row]
            self?.itemSelected?(item)
        }
        .reloadData()
    }
}
