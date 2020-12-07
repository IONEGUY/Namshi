//
//  CatalogViewController.swift
//  Namshi
//
//  Created by MacBook on 11/30/20.
//

import UIKit

class CatalogViewController: SearchBarViewController, MVVMViewController {
    typealias ViewModelType = CatalogViewModel
    
    var viewModel: CatalogViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
