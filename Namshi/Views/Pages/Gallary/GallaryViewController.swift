//
//  GallaryViewController.swift
//  Namshi
//
//  Created by MacBook on 12/9/20.
//

import UIKit

class GallaryViewController: UIViewController, MVVMViewController {
    typealias ViewModelType = GallaryViewModel
    
    var viewModel: GallaryViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addSubviews()
        setupConstraints()
        view.setNeedsUpdateConstraints()
    }
    
    private func addSubviews() {
        
    }
    
    private func setupConstraints() {
        
    }
}
