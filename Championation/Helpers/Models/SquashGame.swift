//
//  SquashGame.swift
//  Squash
//
//  Created by Ramazan Abdulaev on 13.01.2023.
//

import Foundation

struct SquashGames: Codable {
    let gamesLive: [SquashGame]
    
    enum CodingKeys: String, CodingKey {
     case gamesLive = "games_live"
    }
}

struct SquashGame: Codable {
    let gameId: String
    let time: String
    let timeStatus: String
    let league: SquashData
    let home: SquashData
    let away: SquashData
    let score: String?
    
    enum CodingKeys: String, CodingKey {
        case gameId = "game_id"
        case time
        case timeStatus = "time_status"
        case league, home, away, score
    }
}

struct SquashData: Codable {
    let name, id: String

    enum CodingKeys: String, CodingKey {
        case name, id
    }
}

struct SquashGamesEnd: Codable {
    let gamesEnd: [SquashGame]
    
    enum CodingKeys: String, CodingKey {
     case gamesEnd = "games_end"
    }
}
