//
//  NetworkModels.swift
//  Water polo infogames
//
//  Created by Ramazan Abdulaev on 27.11.2022.
//

import Foundation

enum RequestMethod: String {
    case get = "get"
    case post = "post"
}

enum Versions: String {
    case v1 = "/v1"
    case v4 = "/v4"
    case mobileV4 = "/mobile/v4"
    case apiV1 = "/api/v1"
}

struct RequiredParameter {
    let id: String
    let parameter: Parameters
    
    enum Parameters: String {
        case teamId = "team"
        case eventId = "event"
        case uniqueTournamentId = "unique-tournament"
        case seasonId = "season"
        case playerId = "player"
        case categoryId = "category_id"
    }
    
    var path: String {
        return "/\(parameter.rawValue)/\(id)"
    }

}

enum KindData: String {
    case uniqueTournaments = "/unique-tournaments"
    case events = "/events"
    case teams = "/teams"
    case players = "/players"
    case image = "/image"
    case logo = "/logo"
    case search = "/search"
    case multi = "/multi"
    case seasons = "/seasons"
}
