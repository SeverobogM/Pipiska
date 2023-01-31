//
//  UILabel+Ext.swift
//  Total control Football
//
//  Created by Ramazan Abdulaev on 27.10.2022.
//

import UIKit

extension UILabel {
    convenience init(
        text: String?,
        font: UIFont = UIFont.systemFont(ofSize: 16),
        color: UIColor = .white,
        aligment: NSTextAlignment = .center,
        numberOfLines: Int = 1,
        borderColor: UIColor? = nil,
        cornerRadius: CGFloat? = nil
    ) {
        self.init()
        self.text = text
        self.textColor = color
        self.font = font
        self.textAlignment = aligment
        self.numberOfLines = numberOfLines
        self.borderColor = color
        self.borderWidth = borderColor != nil ? 1: 0
        self.layer.cornerRadius = cornerRadius ?? 1
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UILabel {
    func setTextOrHide(_ text: String?) {
        self.text = text
        isHidden = text == nil || text == ""
    }
}

extension UILabel {
    
    convenience init(
        text: String?,
        font: UIFont,
        color: UIColor = .white,
        aligment: NSTextAlignment = .center
    ) {
        self.init()
        self.text = text
        self.textColor = color
        self.font = font
        self.textAlignment = aligment
        self.numberOfLines = 1
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func getTodayDate() -> Date {
        let now = Calendar.current.dateComponents(in: .current, from: Date())
        let today = DateComponents(year: now.year, month: now.month, day: now.day)
        let dateToday = Calendar.current.date(from: today)!
        return dateToday
    }
    
    func getTomorrowDate() -> Date {
        let now = Calendar.current.dateComponents(in: .current, from: Date())
        let tomorrow = DateComponents(year: now.year, month: now.month, day: now.day! + 1)
        let dateTomorrow = Calendar.current.date(from: tomorrow)!
        return dateTomorrow
    }
    
}
