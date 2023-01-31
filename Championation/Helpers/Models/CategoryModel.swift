//
//  CategoryModel.swift
//  Water polo infogames
//
//  Created by Ramazan Abdulaev on 27.11.2022.
//

import Foundation

struct Category: Codable {
    let name: String
    let slug: String?
    let sport: Sport?
    let id: Int
    let flag: String?
}
