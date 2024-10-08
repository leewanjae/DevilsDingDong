//
//  MatchInfo.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 5/11/24.
//

import Foundation

struct MatchInfo: Codable {
    let id: Int
    let matchType: String
    let round: String
    let date: String
    let time: String
    let stadium: String
    let enemy: String
    let home: Bool
    var finished: Bool
    let highlight: String?
    let score: String?
    let manUtdGoal: [String]?
    let enemyGoal: [String]?
    var player: [Player]?
    var enemyPlayer: [Player]?
}

struct Player: Hashable, Codable {
    let id = UUID()
    let position: String
    let name: String
}
