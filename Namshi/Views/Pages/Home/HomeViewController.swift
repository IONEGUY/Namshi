//
//  HomeViewController.swift
//  Namshi
//
//  Created by MacBook on 11/30/20.
//

import UIKit

class HomeViewController: UIViewController, MVVMViewController {
    typealias ViewModelType = HomeViewModel
    
    var viewModel: HomeViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
