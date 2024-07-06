//
//  Score.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 7/5/24.
//

import Foundation

struct ScoreList: Codable {
    let scores: [Score]
}

struct Score: Codable {
    let rank: Int
    let team: String
    let round: String
    let point: Int
    let win: Int
    let draw: Int
    let loss: Int
    let gd: Int
}
