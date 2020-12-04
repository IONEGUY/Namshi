//
//  UIViewExtensions.swift
//  SmartEducation
//
//  Created by MacBook on 11/10/20.
//

import Foundation
import UIKit

extension UIView {
    @discardableResult
    func applyRoundedStyle(borderColor: UIColor = .clear,
                           cornerRadius: CGFloat? = nil,
                           borderWidth: CGFloat? = nil) -> Self {
        clipsToBounds = true
        layer.borderColor = borderColor.cgColor
        layer.cornerRadius = cornerRadius ?? frame.height / 2
        layer.borderWidth = borderWidth ?? 3
        return self
    }
    
    func addShadow(shadowColor: CGColor? = nil,
                   shadowOffset: CGSize? = nil,
                   shadowOpacity: Float? = nil,
                   shadowRadius: CGFloat? = nil) {
        clipsToBounds = false
        layer.shadowColor = shadowColor ?? backgroundColor?.cgColor
        layer.shadowOffset = shadowOffset ?? .zero
        layer.shadowOpacity = shadowOpacity ?? 1
        layer.shadowRadius = shadowRadius ?? layer.cornerRadius
    }

    func fillSuperview() {
        guard let superview = self.superview else { return }
        translatesAutoresizingMaskIntoConstraints = superview.translatesAutoresizingMaskIntoConstraints
        if translatesAutoresizingMaskIntoConstraints {
            autoresizingMask = [.flexibleWidth, .flexibleHeight]
            frame = superview.bounds
        } else {
            topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
            bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
            leftAnchor.constraint(equalTo: superview.leftAnchor).isActive = true
            rightAnchor.constraint(equalTo: superview.rightAnchor).isActive = true
        }
    }
}
