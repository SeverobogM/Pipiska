//
//  LeaguesUrls.swift
//  Total control Football
//
//  Created by Ramazan Abdulaev on 31.10.2022.
//

import Foundation

struct Tournaments: Codable {
    let data: [Tournament]
}

struct Tournament: Codable {
    let name: String
    let slug: String
    let category: Category?
    let id: Int
}
