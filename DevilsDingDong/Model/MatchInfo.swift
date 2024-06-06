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
    var date: String
    var time: String
    let stadium: String
    let enemy: String
    let home: Bool
    var finished: Bool
    
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
            "finished": finished
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
            let finished = dictionary["finished"] as? Bool
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
    }
    
    static var data = [
        MatchInfo(id: 1, matchType: "Premier League", round: "1R", date: "23년 08월 15일 (화)", time: "04:00", stadium: "Old \nTrafford", enemy: "울버햄튼", home: true, finished: true),
        MatchInfo(id: 2, matchType: "Premier League", round: "2R", date: "23년 08월 20일 (일)", time: "01:30", stadium: "Tottenham \nHotspur \nStadium", enemy: "토트넘", home: false, finished: true),
        MatchInfo(id: 3, matchType: "Premier League", round: "3R", date: "23년 08월 26일 (토)", time: "23:00", stadium: "Old \nTrafford", enemy: "노팅엄", home: true, finished: true),
        MatchInfo(id: 4, matchType: "Premier League", round: "4R", date: "23년 09월 04일 (월)", time: "00:30", stadium: "Emirates \nStadium", enemy: "아스널", home: false, finished: true),
        MatchInfo(id: 5, matchType: "Premier League", round: "5R", date: "23년 09월 16일 (토)", time: "23:00", stadium: "Old \nTrafford", enemy: "브라이턴", home: true, finished: true),
        MatchInfo(id: 6, matchType: "Premier League", round: "6R", date: "23년 09월 24일 (일)", time: "04:00", stadium: "Turf \nMoor", enemy: "번리", home: false, finished: true),
        MatchInfo(id: 7, matchType: "Premier League", round: "7R", date: "23년 09월 30일 (토)", time: "23:00", stadium: "Old \nTrafford", enemy: "팰리스", home: true, finished: true),
        MatchInfo(id: 8, matchType: "Premier League", round: "8R", date: "23년 10월 07일 (토)", time: "23:00", stadium: "Old \nTrafford", enemy: "브렌트퍼드", home: true, finished: true),
        MatchInfo(id: 9, matchType: "Premier League", round: "9R", date: "23년 10월 22일 (일)", time: "04:00", stadium: "Bramall \nLane", enemy: "셰필드", home: false, finished: true),
        MatchInfo(id: 10, matchType: "Premier League", round: "10R", date: "23년 10월 30일 (월)", time: "00:30", stadium: "Old \nTrafford", enemy: "맨시티", home: true, finished: true),
        MatchInfo(id: 11, matchType: "Premier League", round: "11R", date: "23년 11월 04일 (토)", time: "21:30", stadium: "Craven \nCottage", enemy: "풀럼", home: false, finished: true),
        MatchInfo(id: 12, matchType: "Premier League", round: "12R", date: "23년 11월 12일 (일)", time: "00:00", stadium: "Old \nTrafford", enemy: "루턴", home: true, finished: true),
        MatchInfo(id: 13, matchType: "Premier League", round: "13R", date: "23년 11월 27일 (월)", time: "01:30", stadium: "Goodison \nPark", enemy: "에버턴", home: false, finished: true),
        MatchInfo(id: 14, matchType: "Premier League", round: "14R", date: "23년 12월 03일 (일)", time: "05:00", stadium: "St.James'\nPark", enemy: "뉴캐슬", home: false, finished: true),
        MatchInfo(id: 15, matchType: "Premier League", round: "15R", date: "23년 12월 07일 (목)", time: "05:15", stadium: "Old \nTrafford", enemy: "첼시", home: true, finished: true),
        MatchInfo(id: 16, matchType: "Premier League", round: "16R", date: "23년 12월 10일 (일)", time: "00:00", stadium: "Old \nTrafford", enemy: "본머스", home: true, finished: true),
        MatchInfo(id: 17, matchType: "Premier League", round: "17R", date: "23년 12월 18일 (월)", time: "01:30", stadium: "Anfield", enemy: "리버풀", home: false, finished: true),
        MatchInfo(id: 18, matchType: "Premier League", round: "18R", date: "23년 12월 23일 (토)", time: "21:30", stadium: "London \nStadium", enemy: "웨스트햄", home: false, finished: true),
        MatchInfo(id: 19, matchType: "Premier League", round: "19R", date: "23년 12월 27일 (수)", time: "05:00", stadium: "Old \nTrafford", enemy: "애스턴빌라", home: true, finished: true),
        MatchInfo(id: 20, matchType: "Premier League", round: "20R", date: "23년 12월 31일 (일)", time: "02:30", stadium: "City \nGround", enemy: "노팅엄", home: false, finished: true),
        MatchInfo(id: 21, matchType: "Premier League", round: "21R", date: "24년 01월 15일 (월)", time: "01:30", stadium: "Old \nTrafford", enemy: "토트넘", home: true, finished: true),
        MatchInfo(id: 22, matchType: "Premier League", round: "22R", date: "24년 02월 02일 (금)", time: "05:15", stadium: "Molineux \nStadium", enemy: "울버햄튼", home: false, finished: true),
        MatchInfo(id: 23, matchType: "Premier League", round: "23R", date: "24년 02월 04일 (일)", time: "23:00", stadium: "Old \nTrafford", enemy: "웨스트햄", home: true, finished: true),
        MatchInfo(id: 24, matchType: "Premier League", round: "24R", date: "24년 02월 12일 (월)", time: "01:30", stadium: "Villa \nPark", enemy: "애스턴빌라", home: false, finished: true),
        MatchInfo(id: 25, matchType: "Premier League", round: "25R", date: "24년 02월 19일 (월)", time: "01:30", stadium: "Kenilworth \nRoad", enemy: "루턴", home: false, finished: true),
        MatchInfo(id: 26, matchType: "Premier League", round: "26R", date: "24년 02월 25일 (일)", time: "00:00", stadium: "Old \nTrafford", enemy: "풀럼", home: true, finished: true),
        MatchInfo(id: 27, matchType: "Premier League", round: "27R", date: "24년 03월 04일 (월)", time: "00:30", stadium: "Etihad \nStadium", enemy: "맨시티", home: false, finished: true),
        MatchInfo(id: 28, matchType: "Premier League", round: "28R", date: "24년 03월 09일 (토)", time: "21:30", stadium: "Old \nTrafford", enemy: "에버턴", home: true, finished: true),
        MatchInfo(id: 29, matchType: "Premier League", round: "29R", date: "24년 03월 31일 (일)", time: "05:00", stadium: "Brentford \nCommunity \nStadium", enemy: "브렌트퍼드", home: false, finished: true),
        MatchInfo(id: 30, matchType: "Premier League", round: "30R", date: "24년 04월 05일 (금)", time: "04:15", stadium: "Stamford \nBridge", enemy: "첼시", home: false, finished: true),
        MatchInfo(id: 31, matchType: "Premier League", round: "31R", date: "24년 04월 07일 (일)", time: "23:30", stadium: "Old \nTrafford", enemy: "리버풀", home: true, finished: true),
        MatchInfo(id: 32, matchType: "Premier League", round: "32R", date: "24년 04월 14일 (일)", time: "01:30", stadium: "Vitality \nStadium", enemy: "본머스", home: false, finished: true),
        MatchInfo(id: 33, matchType: "Premier League", round: "33R", date: "24년 04월 25일 (목)", time: "04:00", stadium: "Old \nTrafford", enemy: "셰필드", home: true, finished: true),
        MatchInfo(id: 34, matchType: "Premier League", round: "34R", date: "24년 04월 27일 (토)", time: "23:00", stadium: "Old \nTrafford", enemy: "번리", home: true, finished: true),
        MatchInfo(id: 35, matchType: "Premier League", round: "35R", date: "24년 05월 07일 (화)", time: "04:00", stadium: "Selhurst \nPark Stadium", enemy: "팰리스", home: false, finished: true),
        MatchInfo(id: 36, matchType: "Premier League", round: "36R", date: "24년 05월 13일 (월)", time: "00:30", stadium: "Old \nTrafford", enemy: "아스널", home: true, finished: true),
        MatchInfo(id: 37, matchType: "Premier League", round: "37R", date: "24년 05월 16일 (목)", time: "04:00", stadium: "Old \nTrafford", enemy: "뉴캐슬", home: true, finished: true),
        MatchInfo(id: 38, matchType: "Premier League", round: "38R", date: "24년 05월 20일 (월)", time: "00:00", stadium: "American \nExpress \nCommunity \nStadium", enemy: "브라이턴", home: false, finished: true),
    ]
}
