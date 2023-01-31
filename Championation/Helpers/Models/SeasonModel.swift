//
//  SeasonModel.swift
//  Water polo infogames
//
//  Created by Ramazan Abdulaev on 27.11.2022.
//

import Foundation

struct Seasons: Codable {
    let data: [Season]
}

struct Season: Codable {
    let name: String
    let year: String
    let id: Int
}
