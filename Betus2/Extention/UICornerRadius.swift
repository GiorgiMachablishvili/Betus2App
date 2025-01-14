//
//  UICornerRadius.swift
//  Betus2
//
//  Created by Gio's Mac on 24.12.24.
//

import UIKit

extension UIView {
    func makeRoundCorners(_ radius: CGFloat) {
        self.layer.cornerRadius = radius  * Constraint.xCoeff
        self.layer.masksToBounds = true
    }
}
