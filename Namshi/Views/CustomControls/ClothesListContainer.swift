//
//  ClothesList.swift
//  Namshi
//
//  Created by MacBook on 12/3/20.
//

import UIKit
import Closures

class ClothesListContainer: UIView {
    var items: [ClothesListItem] = []
    var collection: UICollectionView?
    
    func initView() {
        collection = UICollectionView(frame: .zero,
                                      collectionViewLayout: UICollectionViewFlowLayout())
        collection?.backgroundColor = .clear
        collection?.isScrollEnabled = false
        collection?.register(ClothesListItemCell.self,
                 forCellWithReuseIdentifier: ClothesListItemCell.typeName)
        
        addSubview(collection ?? UIView())
        collection?.translatesAutoresizingMaskIntoConstraints = false
        collection?.fillSuperview()
        
        collection?
            .numberOfItemsInSection { [weak self] _ in
                return self?.items.count ?? 0
            }
            .cellForItemAt { [weak self] indexPath in
                let cell = self?.collection?.dequeueReusableCell(
                    withReuseIdentifier: ClothesListItemCell.typeName, for: indexPath)
                let fieldOfScience = self?.items[indexPath.row]
                (cell as? ClothesListItemCell)?.initialize(data: fieldOfScience)
                return cell ?? UICollectionViewCell()
            }
            .sizeForItemAt(handler: { [weak self] indexPath in
                guard let collection = self?.collection else { return .zero }
                return CGSize(width: collection.frame.width / 2 - 5,
                              height: 350)
            })
            .reloadData()
    }
}
