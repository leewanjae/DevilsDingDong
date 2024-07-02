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
    let player: [Player]?
}

struct Player: Hashable, Codable {
    let id: Int
    let position: String
    let name: String
    let image: String
}

//extension MatchInfo {
//    static let match = MatchInfo(id: 39, matchType: "Premier League", round: "39R", date: "24년 06월 25일 (화)", time: "04:00", stadium: "Old Trafford", enemy: "첼시", home: false, finished: false, highlight: "www.naver.com", score: "", manUtdGoal: [], enemyGoal: [], player: Player.playerDB)
//}
//
//extension Player{
//    static let playerDB: [Player] = [
//        Player(id: 38, position: "FW", name: "가르나초", image: ""),
//        Player(id: 38, position: "MF", name: "페르난데스", image: ""),
//        Player(id: 38, position: "MF", name: "마이누", image: ""),
//        Player(id: 38, position: "MF", name: "카제미루", image: ""),
//        Player(id: 38, position: "MF", name: "맥토미니", image: ""),
//        Player(id: 38, position: "MF", name: "디알로", image: ""),
//        Player(id: 38, position: "MF", name: "암라바트", image: ""),
//        Player(id: 38, position: "DF", name: "달롯", image: ""),
//        Player(id: 38, position: "DF", name: "마르티네즈", image: ""),
//        Player(id: 38, position: "DF", name: "완 비사카", image: ""),
//        Player(id: 38, position: "GK", name: "오나나", image: ""),
//    ]
//}
