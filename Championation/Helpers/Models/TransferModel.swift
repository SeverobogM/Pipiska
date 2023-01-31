// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Transfers: Codable {
    let transfers: [Transfer]
}

// MARK: - Transfer
struct Transfer: Codable {
    let player: PlayerTransfer
    let transferFrom, transferTo: TransferFromClass?
    let fromTeamName, toTeamName: String
    let type: Int
    let transferFee: Int?
//    let transferFeeDescription: TransferFeeDescription
    let id, transferDateTimestamp: Int
    let transferFeeRaw: TransferFeeRaw?
}

// MARK: - Player
struct PlayerTransfer: Codable {
    let name, slug: String
    let shortName: String?
    let userCount, id: Int
}

enum TransferFeeDescription: String, Codable {
    case empty = "-"
    case free = "Free"
}

// MARK: - TransferFeeRaw
struct TransferFeeRaw: Codable {
    let value: Int
}

// MARK: - TransferFromClass
struct TransferFromClass: Codable {
    let name, slug, shortName: String
    let sport: SportTransfer
    let userCount, type, id: Int
}

// MARK: - Sport
struct SportTransfer: Codable {
    let name: String
    let slug: String
    let id: Int
}

