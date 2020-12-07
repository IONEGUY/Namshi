//
//  SearchBarViewController.swift
//  Namshi
//
//  Created by MacBook on 12/1/20.
//

import UIKit

class SearchBarViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchBar()
    }
    
    func setupSearchBar() {
        let searchBar = UISearchBar()
        if let textField = searchBar.value(forKey: "searchField") as? UITextField {
            textField.backgroundColor = .searchBar_textField_backgroundColor
        }
        
        searchBar.scopeButtonTitles = [.scopeBar_Women, .scopeBar_Men, .scopeBar_Kids]
        tabBarController?.navigationItem.titleView = searchBar
    }
}
