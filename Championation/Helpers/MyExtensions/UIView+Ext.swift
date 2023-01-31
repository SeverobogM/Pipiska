//
//  UIView+Ext.swift
//  Ninja Football
//
//  Created by Ramazan Abdulaev on 16.11.2022.
//

import UIKit

extension UIView {
    
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder?.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }

    var parentNavigationController: UINavigationController? {
        let currentViewController = parentViewController
        if let navigationController = currentViewController as? UINavigationController {
            return navigationController
        }
        return currentViewController?.navigationController
    }
}

// MARK: - Work with layer
extension UIView {
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    var borderColor: UIColor? {
        get {
            let color = UIColor(cgColor: layer.borderColor!)
            return color
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOffset = CGSize(width: 0, height: 2)
            layer.shadowOpacity = shadowOpacity
            layer.shadowRadius = newValue
        }
    }
    
    var shadowColor: UIColor? {
        get {
            return UIColor(cgColor: layer.shadowColor!)
        }
        set {
            layer.shadowColor = newValue?.cgColor
            layer.shadowOffset = CGSize(width: 0, height: 2)
            layer.shadowOpacity = shadowOpacity
            layer.shadowRadius = shadowRadius
        }
    }
    
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowColor = shadowColor?.cgColor
            layer.shadowOffset = newValue
            layer.shadowOpacity = shadowOpacity
            layer.shadowRadius = shadowRadius
        }
    }
    
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowColor = shadowColor?.cgColor
            layer.shadowOffset = shadowOffset
            layer.shadowOpacity = newValue
            layer.shadowRadius = shadowRadius
        }
    }
    
    var enableMaskBound: Bool {
        get {
            return layer.masksToBounds
        }
        set {
            layer.masksToBounds = newValue
        }
    }
}
