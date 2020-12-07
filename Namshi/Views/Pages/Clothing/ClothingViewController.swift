//
//  ClothingViewController.swift
//  Namshi
//
//  Created by MacBook on 12/4/20.
//

import UIKit

class ClothingViewController: BaseViewController, MVVMViewController {
    var viewModel: ClothingViewModel?
        
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: UITableViewCell.typeName)
        return tableView
    }()
    
    typealias ViewModelType = ClothingViewModel

    override func viewDidLoad() {
        super.viewDidLoad()

        title = viewModel?.title
        view.backgroundColor = .white
        
        setupRightBarButtonItem()
        setupTableView()
        setupConstraints()
        
        view.setNeedsUpdateConstraints()
    }
    
    private func setupRightBarButtonItem() {
        let rightBarButtonItem = UIBarButtonItem()
        rightBarButtonItem.image = UIImage(named: "search")?
            .withRenderingMode(.alwaysOriginal)
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.register(ClothingListItemTableViewCell.self,
                           forCellReuseIdentifier: ClothingListItemTableViewCell.typeName)
        tableView
            .heightForRowAt { _ in 60 }
            .numberOfRows { [weak self] _ in
                return self?.viewModel?.clothingItems.count ?? 0
            }
            .cellForRow { [weak self] indexPath in
                let cell = self?.tableView.dequeueReusableCell(withIdentifier:
                    ClothingListItemTableViewCell.typeName)
                let clothingItem = self?.viewModel?.clothingItems[indexPath.row]
                (cell as? ClothingListItemTableViewCell)?.initialize(data: clothingItem)
                return cell ?? UITableViewCell()
            }
    }
    
    private func setupConstraints() {
        let defaulfOffset: CGFloat = 60
        let barHeight = navigationController?.navigationBar.bounds.size.height ?? 0
        tableView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalToSuperview().inset(16)
            make.top.equalToSuperview()
        }
    }
}
