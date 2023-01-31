//
//  UICollectionView+Ext.swift
//  Hockey Top Teams
//
//  Created by Ramazan Abdulaev on 14.11.2022.
//

import UIKit

extension UICollectionView {
    
    func roundCorners(_ corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }

}

