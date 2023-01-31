//
//  MenuModels.swift
//  Ninja Football
//
//  Created by Ramazan Abdulaev on 17.11.2022.
//

import Foundation

enum MenuOptions: CaseIterable {
    case leagues
    case rules
    case news
    case notes
    case favorites
    case shop
    case bet
    case myBet
    case calendar
    case feedback
}

extension MenuOptions {
    var title: String {
        
        switch self {
        case .leagues:
            return LocalizationSystem.sharedInstance.getLanguage() == "en" ? "Leagues" : "Лиги"
        case .news:
            return LocalizationSystem.sharedInstance.getLanguage() == "en" ? "News" : "Новости"
        case .notes:
            return LocalizationSystem.sharedInstance.getLanguage() == "en" ? "Notes" : "Заметки"
        case .favorites:
            return LocalizationSystem.sharedInstance.getLanguage() == "en" ? "Favorites" : "Избранное"
        case .shop:
            return LocalizationSystem.sharedInstance.getLanguage() == "en" ? "Shop" : "Магазин"
        case .bet:
            return LocalizationSystem.sharedInstance.getLanguage() == "en" ? "Bet" : "Ставки"
        case .myBet:
            return LocalizationSystem.sharedInstance.getLanguage() == "en" ? "My Bet" : "Мои Ставки"
        case .calendar:
            return LocalizationSystem.sharedInstance.getLanguage() == "en" ? "Calendar" : "Календарь"
        case .feedback:
            return LocalizationSystem.sharedInstance.getLanguage() == "en" ? "Feedback" : "Отзыв"
        case .rules:
            return LocalizationSystem.sharedInstance.getLanguage() == "en" ? "Details" : "Детали"
            
        }
        
    }
}
