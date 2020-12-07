//
//  ClothesList.swift
//  Namshi
//
//  Created by MacBook on 12/3/20.
//

import UIKit

class ClothesListContainer: UIView {
    var items: [ClothesListItem] = []
    
    func initView() {
        backgroundColor = .green
        register(ClothesListItemCell.self,
                 forCellWithReuseIdentifier: ClothesListItemCell.typeName)
    }
    
    override var numberOfSections: Int {
        return 1
    }
    
    override func numberOfItems(inSection section: Int) -> Int {
        return items.count
    }
    
    override func cellForItem(at indexPath: IndexPath) -> UICollectionViewCell? {
        let cell = dequeueReusableCell(
            withReuseIdentifier: ClothesListItemCell.typeName, for: indexPath)
        let fieldOfScience = items[indexPath.row]
        (cell as? ClothesListItemCell)?.initialize(data: fieldOfScience)
        return cell
    }
}
