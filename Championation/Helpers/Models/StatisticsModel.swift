//
//  StatisticModel.swift
//  Total control Football
//
//  Created by Ramazan Abdulaev on 31.10.2022.
//


import Foundation

// MARK: - Welcome
struct Statistics: Codable {
    let statistics: [Statistic]
}

// MARK: - Statistic
struct Statistic: Codable {
    let period: String
    let groups: [Group]
}

// MARK: - Group
struct Group: Codable {
    let groupName: String
    let statisticsItems: [StatisticsItem]
}

// MARK: - StatisticsItem
struct StatisticsItem: Codable {
    let name, home, away: String
    let compareCode: Int
}
