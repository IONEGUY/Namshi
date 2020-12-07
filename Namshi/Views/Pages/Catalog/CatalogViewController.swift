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
            return self?.viewModel?.categories.count ?? 0
        }
        .cellForRow { [weak self] indexPath in
            let cell = self?.tableView.dequeueReusableCell(withIdentifier: CatalogListItemCell.typeName)
            let category = self?.viewModel?.categories[indexPath.row]
            (cell as? CatalogListItemCell)?.initialize(data: category)
            return cell ?? UITableViewCell()
        }
        .heightForRowAt { _ in 80 }
        .didSelectRowAt { [weak self] indexPath in
            self?.viewModel?.categories[indexPath.row].tapHandler?()
        }
        .reloadData()
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.bottom.right.equalToSuperview().inset(16)
        }
    }
}
