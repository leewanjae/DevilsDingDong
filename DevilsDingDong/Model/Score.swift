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
    let gf: Int
    let ga: Int
    let gd: Int
}

extension Score {
    static let scoreDB = [
        Score(rank: 1, team:"맨시티", round: "1", point: 0, win: 0, draw: 0, loss: 0, gf: 0, ga: 0, gd: 0),
        Score(rank: 1, team:"아스널", round: "1", point: 0, win: 0, draw: 0, loss: 0, gf: 0, ga: 0, gd: 0),
        Score(rank: 1, team:"리버풀", round: "1", point: 0, win: 0, draw: 0, loss: 0, gf: 0, ga: 0, gd: 0),
        Score(rank: 1, team:"애스턴빌라", round: "1", point: 0, win: 0, draw: 0, loss: 0, gf: 0, ga: 0, gd: 0),
        Score(rank: 1, team:"토트넘", round: "1", point: 0, win: 0, draw: 0, loss: 0, gf: 0, ga: 0, gd: 0),
        Score(rank: 1, team:"첼시", round: "1", point: 0, win: 0, draw: 0, loss: 0, gf: 0, ga: 0, gd: 0),
        Score(rank: 1, team:"뉴캐슬", round: "1", point: 0, win: 0, draw: 0, loss: 0, gf: 0, ga: 0, gd: 0),
        Score(rank: 1, team:"맨유", round: "1", point: 0, win: 0, draw: 0, loss: 0, gf: 0, ga: 0, gd: 0),
        Score(rank: 1, team:"웨스트햄", round: "1", point: 0, win: 0, draw: 0, loss: 0, gf: 0, ga: 0, gd: 0),
        Score(rank: 1, team:"팰리스", round: "1", point: 0, win: 0, draw: 0, loss: 0, gf: 0, ga: 0, gd: 0),
        Score(rank: 1, team:"브라이턴", round: "1", point: 0, win: 0, draw: 0, loss: 0, gf: 0, ga: 0, gd: 0),
        Score(rank: 1, team:"본머스", round: "1", point: 0, win: 0, draw: 0, loss: 0, gf: 0, ga: 0, gd: 0),
        Score(rank: 1, team:"풀럼", round: "1", point: 0, win: 0, draw: 0, loss: 0, gf: 0, ga: 0, gd: 0),
        Score(rank: 1, team:"울버햄튼", round: "1", point: 0, win: 0, draw: 0, loss: 0, gf: 0, ga: 0, gd: 0),
        Score(rank: 1, team:"에버턴", round: "1", point: 0, win: 0, draw: 0, loss: 0, gf: 0, ga: 0, gd: 0),
        Score(rank: 1, team:"브렌트퍼드", round: "1", point: 0, win: 0, draw: 0, loss: 0, gf: 0, ga: 0, gd: 0),
        Score(rank: 1, team:"노팅엄", round: "1", point: 0, win: 0, draw: 0, loss: 0, gf: 0, ga: 0, gd: 0),
        Score(rank: 1, team:"입스위치", round: "1", point: 0, win: 0, draw: 0, loss: 0, gf: 0, ga: 0, gd: 0),
        Score(rank: 1, team:"레스터", round: "1", point: 0, win: 0, draw: 0, loss: 0, gf: 0, ga: 0, gd: 0),
        Score(rank: 1, team:"사우샘프턴", round: "1", point: 0, win: 0, draw: 0, loss: 0, gf: 0, ga: 0, gd: 0),
    ]
}

//        let scoreList = ScoreList(scores: Score.score)
//        let firebaseStoreManager = FirebaseStoreManager()
//        firebaseStoreManager.addFirestore(collection: "24-25_Score", document: "score", data: scoreList)
