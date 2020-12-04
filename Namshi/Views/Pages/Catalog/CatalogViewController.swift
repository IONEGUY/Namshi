//
//  CatalogViewController.swift
//  Namshi
//
//  Created by MacBook on 11/30/20.
//

import UIKit
import Closures

class CatalogViewController: SearchBarViewController, MVVMViewController {
    typealias ViewModelType = CatalogViewModel
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    private var categories: [CatalogListItem] = [
        CatalogListItem(color: UIColor(hex: 0xB2C5B9),
                        imageName: "woman",
                        categoryName: "Clothing",
                        tapHandler: nil),
        CatalogListItem(color: UIColor(hex: 0xF3DDCF),
                        imageName: "bag",
                        categoryName: "Accessories",
                        tapHandler: nil)
    ]
    
    var viewModel: CatalogViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        setupTableView()
        setupConstraints()
        view.setNeedsUpdateConstraints()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.clipsToBounds = false
        tableView.register(CatalogListItemCell.self,
                           forCellReuseIdentifier: CatalogListItemCell.typeName)
        tableView.numberOfRows { [weak self] _ in
            return self?.categories.count ?? 0
        }
        .cellForRow { [weak self] indexPath in
            let cell = self?.tableView.dequeueReusableCell(withIdentifier: CatalogListItemCell.typeName)
            let category = self?.categories[indexPath.row]
            (cell as? CatalogListItemCell)?.initialize(data: category)
            return cell ?? UITableViewCell()
        }
        .heightForRowAt { _ in 80 }
        .didSelectRowAt { [weak self] indexPath in
            let category = self?.categories[indexPath.row]
            category?.tapHandler?(category?.categoryName ?? .empty)
        }
        .reloadData()
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(150)
            make.left.bottom.right.equalToSuperview().inset(16)
        }
    }
}
