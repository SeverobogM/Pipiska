//
//  EventsModel.swift
//  Water polo infogames
//
//  Created by Ramazan Abdulaev on 27.11.2022.
//

import Foundation

struct Events: Codable {
    let tournaments: [TournamentEvent] // only 0 item
}

struct TournamentEvent: Codable {
    let events: [Event]
}

struct Event: Codable {
    let status: Status
    let winnerCode: Int?
    let homeTeam, awayTeam: Team
    let homeScore, awayScore: Score
    let id: Int
    let startTimestamp: Int
}

struct Score: Codable {
    let current, display: Int?
}

struct Status: Codable {
    let code: Int
    let type: String
}
