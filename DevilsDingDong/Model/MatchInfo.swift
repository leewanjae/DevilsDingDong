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
    
    func toDictionary() -> [String: Any] {
        return [
            "id": id,
            "matchType": matchType,
            "round": round,
            "date": date,
            "time": time,
            "stadium": stadium,
            "enemy": enemy,
            "home": home,
            "finished": finished,
            "highlight": highlight ?? "",
            "score": score ?? "",
            "manUtdGoal": manUtdGoal ?? [],
            "enemyGoal": enemyGoal ?? []
        ]
    }
}

extension MatchInfo {
    init?(dictionary: [String: Any]) {
        guard
            let id = dictionary["id"] as? Int,
            let matchType = dictionary["matchType"] as? String,
            let round = dictionary["round"] as? String,
            let date = dictionary["date"] as? String,
            let time = dictionary["time"] as? String,
            let stadium = dictionary["stadium"] as? String,
            let enemy = dictionary["enemy"] as? String,
            let home = dictionary["home"] as? Bool,
            let finished = dictionary["finished"] as? Bool,
            let highlight = dictionary["highlight"] as? String,
            let score = dictionary["score"] as? String,
            let manUtdGoal = dictionary["manUtdGoal"] as? [String],
            let enemyGoal = dictionary["enemyGoal"] as? [String]
        else {
            return nil
        }
        
        self.id = id
        self.matchType = matchType
        self.round = round
        self.date = date
        self.time = time
        self.stadium = stadium
        self.enemy = enemy
        self.home = home
        self.finished = finished
        self.highlight = highlight
        self.score = score
        self.manUtdGoal = manUtdGoal
        self.enemyGoal = enemyGoal
    }
}
