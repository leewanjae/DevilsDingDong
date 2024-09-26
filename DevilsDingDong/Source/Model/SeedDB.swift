//
//  SeedDB.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 7/6/24.
//

import Foundation

// MARK: - 한 시즌 전체 경기 데이터 틀

//extension MatchInfo {
//    static let match = [
//        MatchInfo(id: 241, matchType: "Premier League"
//, round: "1", date: "24년 08월 17일 (토)", time: "04:00", stadium: "Old Trafford", enemy: "풀럼", home: true, finished: false, highlight: "", score: "", manUtdGoal: [], enemyGoal: [], player: [], enemyPlayer: []),
//        MatchInfo(id: 242, matchType: "Premier League"
//, round: "2", date: "24년 08월 24일 (토)", time: "23:00", stadium: "American Express Community Stadium"
//, enemy: "브라이턴", home: false, finished: false, highlight: "", score: "", manUtdGoal: [], enemyGoal: [], player: [], enemyPlayer: []),
//        MatchInfo(id: 243, matchType: "Premier League"
//, round: "3", date: "24년 08월 31일 (토)", time: "23:00", stadium: "Old Trafford", enemy: "리버풀", home: true, finished: false, highlight: "", score: "", manUtdGoal: [], enemyGoal: [], player: [], enemyPlayer: []),
//        MatchInfo(id: 244, matchType: "Premier League"
//, round: "4", date: "24년 09월 14일 (토)", time: "23:00", stadium: "St Mary's Stadium", enemy: "사우샘프턴", home: false, finished: false, highlight: "", score: "", manUtdGoal: [], enemyGoal: [], player: [], enemyPlayer: []),
//        MatchInfo(id: 245, matchType: "Premier League"
//, round: "5", date: "24년 09월 21일 (토)", time: "23:00", stadium: "Selhurst Park Stadium", enemy: "팰리스", home: false, finished: false, highlight: "", score: "", manUtdGoal: [], enemyGoal: [], player: [], enemyPlayer: []),
//        MatchInfo(id: 246, matchType: "Premier League"
//, round: "6", date: "24년 09월 28일 (토)", time: "23:00", stadium: "Old Trafford", enemy: "토트넘", home: true, finished: false, highlight: "", score: "", manUtdGoal: [], enemyGoal: [], player: [], enemyPlayer: []),
//        MatchInfo(id: 247, matchType: "Premier League"
//, round: "7", date: "24년 10월 05일 (토)", time: "23:00", stadium: "Villa Park", enemy: "애스턴빌라", home: false, finished: false, highlight: "", score: "", manUtdGoal: [], enemyGoal: [], player: [], enemyPlayer: []),
//        MatchInfo(id: 248, matchType: "Premier League"
//, round: "8", date: "24년 10월 19일 (토)", time: "23:00", stadium: "Old Trafford", enemy: "브렌트퍼드", home: true, finished: false, highlight: "", score: "", manUtdGoal: [], enemyGoal: [], player: [], enemyPlayer: []),
//        MatchInfo(id: 249, matchType: "Premier League"
//, round: "9", date: "24년 10월 26일 (토)", time: "23:00", stadium: "London Stadium", enemy: "웨스트햄", home: false, finished: false, highlight: "", score: "", manUtdGoal: [], enemyGoal: [], player: [], enemyPlayer: []),
//        MatchInfo(id: 2410, matchType: "Premier League"
//                  , round: "10", date: "24년 11월 03일 (토)", time: "00:00", stadium: "Old Trafford", enemy: "첼시", home: true, finished: false, highlight: "", score: "", manUtdGoal: [], enemyGoal: [], player: [], enemyPlayer: []),
//        MatchInfo(id: 2411, matchType: "Premier League"
//                  , round: "11", date: "24년 11월 10일 (일)", time: "00:00", stadium: "Old Trafford", enemy: "레스터", home: true, finished: false, highlight: "", score: "", manUtdGoal: [], enemyGoal: [], player: [], enemyPlayer: []),
//        MatchInfo(id: 2412, matchType: "Premier League"
//, round: "12", date: "24년 11월 24일 (일)", time: "00:00", stadium: "Portman Road", enemy: "입스위치", home: false, finished: false, highlight: "", score: "", manUtdGoal: [], enemyGoal: [], player: [], enemyPlayer: []),
//        MatchInfo(id: 2413, matchType: "Premier League"
//, round: "13", date: "24년 12월 01일 (일)", time: "00:00", stadium: "Old Trafford", enemy: "에버턴", home: true, finished: false, highlight: "", score: "", manUtdGoal: [], enemyGoal: [], player: [], enemyPlayer: []),
//        MatchInfo(id: 2414, matchType: "Premier League"
//, round: "14", date: "24년 12월 04일 (수)", time: "00:00", stadium: "Emirates Stadium", enemy: "아스널", home: false, finished: false, highlight: "", score: "", manUtdGoal: [], enemyGoal: [], player: [], enemyPlayer: []),
//        MatchInfo(id: 2415, matchType: "Premier League"
//, round: "15", date: "24년 12월 08일 (일)", time: "00:00", stadium: "Old Trafford", enemy: "노팅엄", home: true, finished: false, highlight: "", score: "", manUtdGoal: [], enemyGoal: [], player: [], enemyPlayer: []),
//        MatchInfo(id: 2416, matchType: "Premier League"
//, round: "16", date: "24년 12월 15일 (일)", time: "00:00", stadium: "Etihad Stadium", enemy: "맨시티", home: false, finished: false, highlight: "", score: "", manUtdGoal: [], enemyGoal: [], player: [], enemyPlayer: []),
//        MatchInfo(id: 2417, matchType: "Premier League"
//, round: "17", date: "24년 12월 22일 (일)", time: "00:00", stadium: "Old Trafford", enemy: "본머스", home: true, finished: false, highlight: "", score: "", manUtdGoal: [], enemyGoal: [], player: [], enemyPlayer: []),
//        MatchInfo(id: 2418, matchType: "Premier League"
//, round: "18", date: "24년 12월 27일 (금)", time: "00:00", stadium: "Molineux Stadium", enemy: "울버햄튼", home: false, finished: false, highlight: "", score: "", manUtdGoal: [], enemyGoal: [], player: [], enemyPlayer: []),
//        MatchInfo(id: 2419, matchType: "Premier League"
//, round: "19", date: "24년 12월 30일 (월)", time: "00:00", stadium: "Old Trafford", enemy: "뉴캐슬", home: true, finished: false, highlight: "", score: "", manUtdGoal: [], enemyGoal: [], player: [], enemyPlayer: []),
//        MatchInfo(id: 2420, matchType: "Premier League"
//, round: "20", date: "25년 01월 05일 (일)", time: "00:00", stadium: "Anfield", enemy: "리버풀", home: false, finished: false, highlight: "", score: "", manUtdGoal: [], enemyGoal: [], player: [], enemyPlayer: []),
//        MatchInfo(id: 2421, matchType: "Premier League"
//, round: "21", date: "25년 01월 16일 (목)", time: "05:00", stadium: "Old Trafford", enemy: "사우샘프턴", home: true, finished: false, highlight: "", score: "", manUtdGoal: [], enemyGoal: [], player: [], enemyPlayer: []),
//        MatchInfo(id: 2422, matchType: "Premier League"
//, round: "22", date: "25년 01월 19일 (일)", time: "00:00", stadium: "Old Trafford", enemy: "브라이턴", home: true, finished: false, highlight: "", score: "", manUtdGoal: [], enemyGoal: [], player: [], enemyPlayer: []),
//        MatchInfo(id: 2423, matchType: "Premier League"
//, round: "23", date: "25년 01월 26일 (일)", time: "00:00", stadium: "Craven Cottage", enemy: "풀럼", home: false, finished: false, highlight: "", score: "", manUtdGoal: [], enemyGoal: [], player: [], enemyPlayer: []),
//        MatchInfo(id: 2424, matchType: "Premier League"
//, round: "24", date: "25년 02월 02일 (일)", time: "00:00", stadium: "Old Trafford", enemy: "팰리스", home: true, finished: false, highlight: "", score: "", manUtdGoal: [], enemyGoal: [], player: [], enemyPlayer: []),
//        MatchInfo(id: 2425, matchType: "Premier League"
//, round: "25", date: "25년 02월 16일 (일)", time: "00:00", stadium: "Tottenham Hotspur Stadium", enemy: "토트넘", home: false, finished: false, highlight: "", score: "", manUtdGoal: [], enemyGoal: [], player: [], enemyPlayer: []),
//        MatchInfo(id: 2426, matchType: "Premier League"
//, round: "26", date: "25년 02월 23일 (일)", time: "00:00", stadium: "Goodison Park", enemy: "에버턴", home: false, finished: false, highlight: "", score: "", manUtdGoal: [], enemyGoal: [], player: [], enemyPlayer: []),
//        MatchInfo(id: 2427, matchType: "Premier League"
//, round: "27", date: "25년 02월 27일 (목)", time: "05:00", stadium: "Old Trafford", enemy: "입스위치", home: true, finished: false, highlight: "", score: "", manUtdGoal: [], enemyGoal: [], player: [], enemyPlayer: []),
//        MatchInfo(id: 2428, matchType: "Premier League"
//, round: "28", date: "25년 03월 09일 (일)", time: "00:00", stadium: "Old Trafford", enemy: "아스널", home: true, finished: false, highlight: "", score: "", manUtdGoal: [], enemyGoal: [], player: [], enemyPlayer: []),
//        MatchInfo(id: 2429, matchType: "Premier League"
//, round: "29", date: "25년 03월 16일 (일)", time: "00:00", stadium: "King Power Stadium", enemy: "레스터", home: false, finished: false, highlight: "", score: "", manUtdGoal: [], enemyGoal: [], player: [], enemyPlayer: []),
//        MatchInfo(id: 2430, matchType: "Premier League"
//, round: "30", date: "25년 04월 01일 (화)", time: "23:00", stadium: "City Ground", enemy: "노팅엄", home: false, finished: false, highlight: "", score: "", manUtdGoal: [], enemyGoal: [], player: [], enemyPlayer: []),
//        MatchInfo(id: 2431, matchType: "Premier League"
//, round: "31", date: "25년 04월 05일 (토)", time: "23:00", stadium: "Old Trafford", enemy: "맨시티", home: true, finished: false, highlight: "", score: "", manUtdGoal: [], enemyGoal: [], player: [], enemyPlayer: []),
//        MatchInfo(id: 2432, matchType: "Premier League"
//, round: "32", date: "25년 04월 12일 (토)", time: "23:00", stadium: "St.James' Park", enemy: "뉴캐슬", home: false, finished: false, highlight: "", score: "", manUtdGoal: [], enemyGoal: [], player: [], enemyPlayer: []),
//        MatchInfo(id: 2433, matchType: "Premier League"
//, round: "33", date: "25년 04월 19일 (토)", time: "23:00", stadium: "Old Trafford", enemy: "울버햄튼", home: true, finished: false, highlight: "", score: "", manUtdGoal: [], enemyGoal: [], player: [], enemyPlayer: []),
//        MatchInfo(id: 2434, matchType: "Premier League"
//, round: "34", date: "25년 04월 26일 (토)", time: "23:00", stadium: "Vitality Stadium", enemy: "본머스", home: false, finished: false, highlight: "", score: "", manUtdGoal: [], enemyGoal: [], player: [], enemyPlayer: []),
//        MatchInfo(id: 2435, matchType: "Premier League"
//, round: "35", date: "25년 05월 03일 (토)", time: "23:00", stadium: "Brentford Community Stadium", enemy: "브렌트퍼드", home: false, finished: false, highlight: "", score: "", manUtdGoal: [], enemyGoal: [], player: [], enemyPlayer: []),
//        MatchInfo(id: 2436, matchType: "Premier League"
//, round: "36", date: "25년 05월 10일 (토)", time: "23:00", stadium: "Old Trafford", enemy: "웨스트햄", home: true, finished: false, highlight: "", score: "", manUtdGoal: [], enemyGoal: [], player: [], enemyPlayer: []),
//        MatchInfo(id: 2437, matchType: "Premier League"
//, round: "37", date: "25년 05월 18일 (일)", time: "23:00", stadium: "Stamford Bridge", enemy: "첼시", home: false, finished: false, highlight: "", score: "", manUtdGoal: [], enemyGoal: [], player: [], enemyPlayer: []),
//        MatchInfo(id: 2438, matchType: "Premier League"
//, round: "38", date: "25년 05월 26일 (월)", time: "00:00", stadium: "Old Trafford", enemy: "애스턴빌라", home: true, finished: false, highlight: "", score: "", manUtdGoal: [], enemyGoal: [], player: [], enemyPlayer: []),
//    ]
//}

// MARK: - 선발 출전 선수

//extension Player{
//    static let playerDB: [Player] = [
//        Player(position: "FW", name: "지르크제이"),
//        Player(position: "FW", name: "가르나초"),
//        Player(position: "FW", name: "페르난데스"),
//        Player(position: "FW", name: "디알로"),
//        Player(position: "MF", name: "에릭센"),
//        Player(position: "MF", name: "마이누"),
//        Player(position: "DF", name: "달롯"),
//        Player(position: "DF", name: "마르티네즈"),
//        Player(position: "DF", name: "더 리흐트"),
//        Player(position: "DF", name: "마즈라위"),
//        Player(position: "GK", name: "오나나"),
//    ]
//    
//    static let enemyPlayerDB: [Player] = [
//        Player(position: "FW", name: "마테타"),
//        Player(position: "FW", name: "은케티아"),
//        Player(position: "FW", name: "에제"),
//        Player(position: "MF", name: "무뇨스"),
//        Player(position: "MF", name: "워튼"),
//        Player(position: "MF", name: "카마다"),
//        Player(position: "MF", name: "미첼"),
//        Player(position: "DF", name: "라크루와"),
//        Player(position: "DF", name: "게히"),
//        Player(position: "DF", name: "리차드"),
//        Player(position: "GK", name: "헨더슨"),
//    ]
//}

// MARK: - 리그 순위

//extension Score {
//    static let scoreDB = [
//        Score(rank: 1, team:"맨시티", round: "5", point: 13, win: 4, draw: 1, loss: 0, gd: 8, image: ""),
//        Score(rank: 2, team:"리버풀", round: "5", point: 12, win: 4, draw: 0, loss: 1, gd: 9, image: ""),
//        Score(rank: 3, team:"애스턴빌라", round: "5", point: 12, win: 4, draw: 0, loss: 1, gd: 3, image: ""),
//        Score(rank: 4, team:"아스널", round: "5", point: 11, win: 3, draw: 2, loss: 0, gd: 5, image: ""),
//        Score(rank: 5, team:"첼시", round: "5", point: 10, win: 3, draw: 1, loss: 1, gd: 6, image: ""),
//        Score(rank: 6, team:"뉴캐슬", round: "5", point: 10, win: 3, draw: 1, loss: 1, gd: 1, image: ""),
//        Score(rank: 7, team:"브라이턴", round: "4", point: 9, win: 2, draw: 3, loss: 0, gd: 4, image: ""),
//        Score(rank: 8, team:"노팅엄", round: "5", point: 9, win: 2, draw: 3, loss: 0, gd: 2, image: ""),
//        Score(rank: 9, team:"풀럼", round: "5", point: 8, win: 2, draw: 2, loss: 1, gd: 2, image: ""),
//        Score(rank: 10, team:"토트넘", round: "5", point: 7, win: 2, draw: 1, loss: 2, gd: 4, image: ""),
//        Score(rank: 11, team:"맨유", round: "5", point: 7, win: 2, draw: 1, loss: 2, gd: 0, image: ""),
//        Score(rank: 12, team:"브렌트퍼드", round: "5", point: 6, win: 2, draw: 0, loss: 3, gd: -2, image: ""),
//        Score(rank: 13, team:"본머스", round: "5", point: 5, win: 1, draw: 2, loss: 2, gd: -3, image: ""),
//        Score(rank: 14, team:"웨스트햄", round: "5", point: 4, win: 1, draw: 1, loss: 3, gd: -4, image: ""),
//        Score(rank: 15, team:"레스터", round: "5", point: 3, win: 0, draw: 3, loss: 2, gd: -2, image: ""),
//        Score(rank: 16, team:"팰리스", round: "5", point: 3, win: 0, draw: 3, loss: 2, gd: -3, image: ""),
//        Score(rank: 17, team:"입스위치", round: "5", point: 3, win: 0, draw: 3, loss: 2, gd: -5, image: ""),
//        Score(rank: 18, team:"사우샘프턴", round: "5", point: 1, win: 0, draw: 1, loss: 4, gd: -7, image: ""),
//        Score(rank: 19, team:"에버턴", round: "5", point: 1, win: 0, draw: 1, loss: 4, gd: -9, image: ""),
//        Score(rank: 19, team:"울버햄튼", round: "5", point: 1, win: 0, draw: 1, loss: 4, gd: -9, image: ""),
//    ]
//}
