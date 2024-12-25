//
//  FindViewController.swift
//  Betus2
//
//  Created by Gio's Mac on 25.12.24.
//

import UIKit

extension UIView {
    func findViewController() -> UIViewController? {
        var nextResponder: UIResponder? = self
        while let responder = nextResponder {
            if let viewController = responder as? UIViewController {
                return viewController
            }
            nextResponder = responder.next
        }
        return nil
    }
}
