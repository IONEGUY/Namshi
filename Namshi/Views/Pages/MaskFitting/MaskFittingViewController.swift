//
//  MaskFittingViewController.swift
//  Namshi
//
//  Created by MacBook on 12/9/20.
//

import UIKit

class MaskFittingViewController: UIViewController, MVVMViewController {
    typealias ViewModelType = MaskFittingViewModel
    
    var viewModel: MaskFittingViewModel?

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
