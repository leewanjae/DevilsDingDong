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
    let enemyPlayer: [Player]?
}

struct Player: Hashable, Codable {
    let id: Int
    let position: String
    let name: String
}

extension MatchInfo {
    static let match = MatchInfo(id: 39, matchType: "Premier League", round: "39R", date: "24년 06월 25일 (화)", time: "04:00", stadium: "Old Trafford", enemy: "첼시", home: false, finished: false, highlight: "www.naver.com", score: "", manUtdGoal: [], enemyGoal: [], player: Player.playerDB, enemyPlayer: Player.enemyPlayerDB)
}
//
extension Player{
    static let playerDB: [Player] = [
        Player(id: 38, position: "FW", name: "가르나초"),
        Player(id: 38, position: "MF", name: "페르난데스"),
        Player(id: 38, position: "MF", name: "마이누"),
        Player(id: 38, position: "MF", name: "카제미루"),
        Player(id: 38, position: "MF", name: "맥토미니"),
        Player(id: 38, position: "MF", name: "디알로"),
        Player(id: 38, position: "MF", name: "암라바트"),
        Player(id: 38, position: "DF", name: "달롯"),
        Player(id: 38, position: "DF", name: "마르티네즈"),
        Player(id: 38, position: "DF", name: "완 비사카"),
        Player(id: 38, position: "GK", name: "오나나"),
    ]
    
    static let enemyPlayerDB: [Player] = [
            Player(id: 38, position: "FW", name: "웰벡"),
            Player(id: 38, position: "MF", name: "주앙 페드루"),
            Player(id: 38, position: "MF", name: "랄라나"),
            Player(id: 38, position: "MF", name: "아딩그라"),
            Player(id: 38, position: "MF", name: "모데르"),
            Player(id: 38, position: "MF", name: "발레바"),
            Player(id: 38, position: "DF", name: "그로스"),
            Player(id: 38, position: "DF", name: "웹스터"),
            Player(id: 38, position: "DF", name: "이고르 줄리우"),
            Player(id: 38, position: "DF", name: "바르코"),
            Player(id: 38, position: "GK", name: "스틸"),
        ]
}
