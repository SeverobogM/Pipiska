//
//  UIColor.swift
//  Total control Football
//
//  Created by Ramazan Abdulaev on 27.10.2022.
//

import UIKit

extension UIColor {
    static let dark = UIColor(hex: 0x1b1f27)
    static let darkBlue = UIColor(hex: 0x203e56)
    static let darkGreen = UIColor(hex: 0x027957)
    static let lightBlue = UIColor(hex: 0x45749c)
    static let lightGreen = UIColor(hex: 0x8DC33F)
    static let borderBlueColor = UIColor(hex: 0x881C3)
    
    static let translucentBlue = UIColor(hex: 0x1B71D2, alpha: 0.3)
    static let translucentRed = UIColor(hex: 0xFF3F3F, alpha: 0.3)
    static let translucentGreen = UIColor(hex: 0x8DFF33, alpha: 0.3)
    static let translucentGray = UIColor(hex: 0xB2B2B2, alpha: 0.3)
    
    
    static let blueWithout = UIColor(hex: 0x0A162F, alpha: 0.1)
    
    convenience init(hex: Int, alpha: CGFloat = 1) {
        let red = (hex >> 16) & 0xFF
        let green = (hex >> 8) & 0xFF
        let blue = hex & 0xFF

        self.init(
            red: .init(red) / 255,
            green: .init(green) / 255,
            blue: .init(blue) / 255,
            alpha: alpha
        )
    }
}
