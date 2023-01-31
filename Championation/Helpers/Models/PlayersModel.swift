//
//  PlayersModel.swift
//  Water polo infogames
//
//  Created by Ramazan Abdulaev on 27.11.2022.
//

import Foundation

struct Players: Codable {
    let players: [Player]
}

// MARK: - Player
struct Player: Codable {
    let player: PlayerData
}

// MARK: - PlayerData
struct PlayerData: Codable {
    let shortName: String?
    let position: String?
    let height: Int?
    let shirtNumber: Int?
    let dateOfBirthTimestamp: Int?
    let id: Int
}
