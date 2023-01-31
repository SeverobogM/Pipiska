//
//  TeamsModel.swift
//  Water polo infogames
//
//  Created by Ramazan Abdulaev on 27.11.2022.
//

import Foundation

struct Teams: Codable {
    let teams: [Team]
}

struct Team: Codable {
    let name: String
    let slug: String?
    let shortName: String?
    let category: Category?
    let nameCode: String?
    let id: Int
    let country: Country?
}
