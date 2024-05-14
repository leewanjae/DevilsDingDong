//
//  Match.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 5/11/24.
//

import Foundation

enum MatchType: String {
    case league = "Premier League"
    case Champion = "UEFA Champions League"
    case Europa = "UEFA Europa League"
}

struct Match {
    let id: Int
    let matchType: MatchType
    let round: Int?
    var date: String
    var time: String
    let stadium: String
    let enemy: String
    let home: Bool
    var finished: Bool?
    var score: String?
}

extension Match {
    static var data = [
        Match(id: 1, matchType: .league, round: 1, date: "08월 15일 (화)", time: "04:00", stadium: "Old \nTrafford", enemy: "울버햄튼", home: true, finished: true, score: "1:0"),
        Match(id: 2,matchType: .league, round: 2, date: "08월 20일 (일)", time: "01:30", stadium: "Tottenham \nHotspur \nStadium", enemy: "토트넘", home: false, finished: true, score: "2:0"),
        Match(id: 3,matchType: .league, round: 3, date: "08월 26일 (토)", time: "23:00", stadium: "Old \nTrafford", enemy: "노팅엄", home: true, finished: true, score: "3:2"),
        Match(id: 4,matchType: .league, round: 4, date: "09월 04일 (월)", time: "00:30", stadium: "Emirates \nStadium", enemy: "아스널", home: false, finished: true, score: "3:1"),
        Match(id: 5,matchType: .league, round: 5, date: "09월 16일 (토)", time: "23:00", stadium: "Old \nTrafford", enemy: "브라이턴", home: true, finished: true, score: "1:3"),
        Match(id: 6,matchType: .league, round: 6, date: "09월 24일 (일)", time: "04:00", stadium: "Turf \nMoor", enemy: "번리", home: false, finished: true, score: "0:1"),
        Match(id: 7,matchType: .league, round: 7, date: "09월 30일 (토)", time: "23:00", stadium: "Old \nTrafford", enemy: "팰리스", home: true, finished: true, score: "0:1"),
        Match(id: 8,matchType: .league, round: 8, date: "10월 07일 (토)", time: "23:00", stadium: "Old \nTrafford", enemy: "브렌트퍼드", home: true, finished: true, score: "2:1"),
        Match(id: 9,matchType: .league, round: 9, date: "10월 22일 (일)", time: "04:00", stadium: "Bramall \nLane", enemy: "셰필드", home: false, finished: true, score: "1:2"),
        Match(id: 10,matchType: .league, round: 10, date: "10월 30일 (월)", time: "00:30", stadium: "Old \nTrafford", enemy: "맨시티", home: true, finished: true, score: "0:3"),
        Match(id: 11,matchType: .league, round: 11, date: "11월 04일 (토)", time: "21:30", stadium: "Craven \nCottage", enemy: "풀럼", home: false, finished: true, score: "0:1"),
        Match(id: 12,matchType: .league, round: 12, date: "11월 12일 (일)", time: "00:00", stadium: "Old \nTrafford", enemy: "루턴", home: true, finished: true, score: "1:0"),
        Match(id: 13,matchType: .league, round: 13, date: "11월 27일 (월)", time: "01:30", stadium: "Goodison \nPark", enemy: "에버턴", home: false, finished: true, score: "0:3"),
        Match(id: 14,matchType: .league, round: 14, date: "12월 03일 (일)", time: "05:00", stadium: "St.James'Park", enemy: "뉴캐슬", home: false, finished: true, score: "1:0"),
        Match(id: 15,matchType: .league, round: 15, date: "12월 07일 (목)", time: "05:15", stadium: "Old \nTrafford", enemy: "첼시", home: true, finished: true, score: "2:1"),
        Match(id: 16,matchType: .league, round: 16, date: "12월 10일 (일)", time: "00:00", stadium: "Old \nTrafford", enemy: "본머스", home: true, finished: true, score: "0:3"),
        Match(id: 17,matchType: .league, round: 17, date: "12월 18일 (월)", time: "01:30", stadium: "Anfield", enemy: "리버풀", home: false, finished: true, score: "0:0"),
        Match(id: 18,matchType: .league, round: 18, date: "12월 23일 (토)", time: "21:30", stadium: "London \nStadium", enemy: "웨스트햄", home: false, finished: true, score: "2:0"),
        Match(id: 19,matchType: .league, round: 19, date: "12월 27일 (수)", time: "05:00", stadium: "Old \nTrafford", enemy: "애스턴빌라", home: true, finished: true, score: "3:2"),
        Match(id: 20,matchType: .league, round: 20, date: "12월 31일 (일)", time: "02:30", stadium: "City \nGround", enemy: "노팅엄", home: false, finished: true, score: "2:1"),
        Match(id: 21,matchType: .league, round: 21, date: "01월 15일 (월)", time: "01:30", stadium: "Old \nTrafford", enemy: "토트넘", home: true, finished: true, score: "2:2"),
        Match(id: 22,matchType: .league, round: 22, date: "02월 02일 (금)", time: "05:15", stadium: "Molineux \nStadium", enemy: "울버햄튼", home: false, finished: true, score: "3:4"),
        Match(id: 23,matchType: .league, round: 23, date: "02월 04일 (일)", time: "23:00", stadium: "Old \nTrafford", enemy: "웨스트햄", home: true, finished: true, score: "3:0"),
        Match(id: 24,matchType: .league, round: 24, date: "02월 12일 (월)", time: "01:30", stadium: "Villa \nPark", enemy: "애스턴빌라", home: false, finished: true, score: "1:2"),
        Match(id: 25,matchType: .league, round: 25, date: "02월 19일 (월)", time: "01:30", stadium: "Kenilworth \nRoad", enemy: "루턴", home: false, finished: true, score: "1:2"),
        Match(id: 26,matchType: .league, round: 26, date: "02월 25일 (일)", time: "00:00", stadium: "Old \nTrafford", enemy: "풀럼", home: true, finished: true, score: "1:2"),
        Match(id: 27,matchType: .league, round: 27, date: "03월 04일 (월)", time: "00:30", stadium: "Etihad \nStadium", enemy: "맨시티", home: false, finished: true, score: "3:1"),
        Match(id: 28,matchType: .league, round: 28, date: "03월 09일 (토)", time: "21:30", stadium: "Old \nTrafford", enemy: "에버턴", home: true, finished: true, score: "2:0"),
        Match(id: 29,matchType: .league, round: 29, date: "03월 31일 (일)", time: "05:00", stadium: "Brentford \nCommunity \nStadium", enemy: "브렌트퍼드", home: false, finished: true, score: "1:1"),
        Match(id: 30,matchType: .league, round: 30, date: "04월 05일 (금)", time: "04:15", stadium: "Stamford \nBridge", enemy: "첼시", home: false, finished: true, score: "4:3"),
        Match(id: 31,matchType: .league, round: 31, date: "04월 07일 (일)", time: "23:30", stadium: "Old \nTrafford", enemy: "리버풀", home: true, finished: true, score: "2:2"),
        Match(id: 32,matchType: .league, round: 32, date: "04월 14일 (일)", time: "01:30", stadium: "Vitality \nStadium", enemy: "본머스", home: false, finished: true, score: "2:2"),
        Match(id: 33,matchType: .league, round: 33, date: "04월 25일 (목)", time: "04:00", stadium: "Old \nTrafford", enemy: "셰필드", home: true, finished: true, score: "4:2"),
        Match(id: 34,matchType: .league, round: 34, date: "04월 27일 (토)", time: "23:00", stadium: "Old \nTrafford", enemy: "번리", home: true, finished: true, score: "1:1"),
        Match(id: 35,matchType: .league, round: 35, date: "05월 07일 (화)", time: "04:00", stadium: "Selhurst \nPark Stadium", enemy: "팰리스", home: false, finished: true, score: "4:0"),
        Match(id: 36,matchType: .league, round: 36, date: "05월 13일 (월)", time: "00:30", stadium: "Old \nTrafford", enemy: "아스널", home: true, finished: false),
        Match(id: 37,matchType: .league, round: 37, date: "05월 16일 (목)", time: "04:00", stadium: "Old \nTrafford", enemy: "뉴캐슬", home: true, finished: false),
        Match(id: 38,matchType: .league, round: 38, date: "05월 20일 (월)", time: "00:00", stadium: "American \nExpress \nCommunity \nStadium", enemy: "브라이턴", home: false, finished: false),
    ]
}
