//
//  SeedDB.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 7/6/24.
//

//import Foundation


//        let scoreList = ScoreList(scores: Score.score)
//        let firebaseStoreManager = FirebaseStoreManager()
//        firebaseStoreManager.addFirestore(collection: "24-25_Score", document: "score", data: scoreList)

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
////
//extension Player{
//    static let playerDB: [Player] = [
//        Player(id: 38, position: "FW", name: "가르나초"),
//        Player(id: 38, position: "MF", name: "페르난데스"),
//        Player(id: 38, position: "MF", name: "마이누"),
//        Player(id: 38, position: "MF", name: "카제미루"),
//        Player(id: 38, position: "MF", name: "맥토미니"),
//        Player(id: 38, position: "MF", name: "디알로"),
//        Player(id: 38, position: "MF", name: "암라바트"),
//        Player(id: 38, position: "DF", name: "달롯"),
//        Player(id: 38, position: "DF", name: "마르티네즈"),
//        Player(id: 38, position: "DF", name: "완 비사카"),
//        Player(id: 38, position: "GK", name: "오나나"),
//    ]
//    
//    static let enemyPlayerDB: [Player] = [
//        Player(id: 38, position: "FW", name: "웰벡"),
//        Player(id: 38, position: "MF", name: "주앙 페드루"),
//        Player(id: 38, position: "MF", name: "랄라나"),
//        Player(id: 38, position: "MF", name: "아딩그라"),
//        Player(id: 38, position: "MF", name: "모데르"),
//        Player(id: 38, position: "MF", name: "발레바"),
//        Player(id: 38, position: "DF", name: "그로스"),
//        Player(id: 38, position: "DF", name: "웹스터"),
//        Player(id: 38, position: "DF", name: "이고르 줄리우"),
//        Player(id: 38, position: "DF", name: "바르코"),
//        Player(id: 38, position: "GK", name: "스틸"),
//    ]
//}


extension Score {
    static let scoreDB = [
        Score(rank: 1, team:"맨시티", round: "1", point: 0, win: 0, draw: 0, loss: 0, gd: 0, image: "https://firebasestorage.googleapis.com/v0/b/devilsdingdong-8fcb2.appspot.com/o/%E1%84%86%E1%85%A2%E1%86%AB%E1%84%89%E1%85%B5%E1%84%90%E1%85%B5.svg?alt=media&token=f2f8b4b1-2026-4d76-8389-61289c125bbc"),
        Score(rank: 2, team:"아스널", round: "1", point: 0, win: 0, draw: 0, loss: 0, gd: 0, image: "https://firebasestorage.googleapis.com/v0/b/devilsdingdong-8fcb2.appspot.com/o/%E1%84%8B%E1%85%A1%E1%84%89%E1%85%B3%E1%84%82%E1%85%A1%E1%86%AF.svg?alt=media&token=fb07b4c3-83e5-46b4-ac6a-735bf589874c"),
        Score(rank: 3, team:"리버풀", round: "1", point: 0, win: 0, draw: 0, loss: 0, gd: 0, image: "https://firebasestorage.googleapis.com/v0/b/devilsdingdong-8fcb2.appspot.com/o/%E1%84%85%E1%85%B5%E1%84%87%E1%85%A5%E1%84%91%E1%85%AE%E1%86%AF.svg?alt=media&token=ed6b56cd-80d6-4d54-971d-610ca09e64d4"),
        Score(rank: 4, team:"애스턴빌라", round: "1", point: 0, win: 0, draw: 0, loss: 0, gd: 0, image: "https://firebasestorage.googleapis.com/v0/b/devilsdingdong-8fcb2.appspot.com/o/%E1%84%8B%E1%85%A2%E1%84%89%E1%85%B3%E1%84%90%E1%85%A5%E1%86%AB%E1%84%87%E1%85%B5%E1%86%AF%E1%84%85%E1%85%A1.svg?alt=media&token=26ca870b-8f4d-4990-b049-b520ce5ad08c"),
        Score(rank: 5, team:"토트넘", round: "1", point: 0, win: 0, draw: 0, loss: 0, gd: 0, image: "https://firebasestorage.googleapis.com/v0/b/devilsdingdong-8fcb2.appspot.com/o/%E1%84%90%E1%85%A9%E1%84%90%E1%85%B3%E1%84%82%E1%85%A5%E1%86%B7.svg?alt=media&token=5ddd4344-2685-4f0b-9612-4e95ad332c11"),
        Score(rank: 6, team:"첼시", round: "1", point: 0, win: 0, draw: 0, loss: 0, gd: 0, image: "https://firebasestorage.googleapis.com/v0/b/devilsdingdong-8fcb2.appspot.com/o/%E1%84%8E%E1%85%A6%E1%86%AF%E1%84%89%E1%85%B5.svg?alt=media&token=30c781dc-df9a-4a0c-ac29-f7fa3f0e9fdc"),
        Score(rank: 7, team:"뉴캐슬", round: "1", point: 0, win: 0, draw: 0, loss: 0, gd: 0, image: "https://firebasestorage.googleapis.com/v0/b/devilsdingdong-8fcb2.appspot.com/o/%E1%84%82%E1%85%B2%E1%84%8F%E1%85%A2%E1%84%89%E1%85%B3%E1%86%AF.svg?alt=media&token=e4422ba5-4caa-4cd2-bb39-5ee683e5aecb"),
        Score(rank: 8, team:"맨유", round: "1", point: 0, win: 0, draw: 0, loss: 0, gd: 0, image: "https://firebasestorage.googleapis.com/v0/b/devilsdingdong-8fcb2.appspot.com/o/%E1%84%86%E1%85%A2%E1%86%AB%E1%84%8B%E1%85%B2.svg?alt=media&token=b4b80a55-92be-495a-a6f7-4a0b1fe5396c"),
        Score(rank: 9, team:"웨스트햄", round: "1", point: 0, win: 0, draw: 0, loss: 0, gd: 0, image: "https://firebasestorage.googleapis.com/v0/b/devilsdingdong-8fcb2.appspot.com/o/%E1%84%8B%E1%85%B0%E1%84%89%E1%85%B3%E1%84%90%E1%85%B3%E1%84%92%E1%85%A2%E1%86%B7.svg?alt=media&token=c082e625-1067-4df9-85a8-ef84d4b3f0ce"),
        Score(rank: 10, team:"팰리스", round: "1", point: 0, win: 0, draw: 0, loss: 0, gd: 0, image: "https://firebasestorage.googleapis.com/v0/b/devilsdingdong-8fcb2.appspot.com/o/%E1%84%91%E1%85%A2%E1%86%AF%E1%84%85%E1%85%B5%E1%84%89%E1%85%B3.svg?alt=media&token=8a6b270a-808c-4ec0-8a78-e469053fba4b"),
        Score(rank: 11, team:"브라이턴", round: "1", point: 0, win: 0, draw: 0, loss: 0, gd: 0, image: "https://firebasestorage.googleapis.com/v0/b/devilsdingdong-8fcb2.appspot.com/o/%E1%84%87%E1%85%B3%E1%84%85%E1%85%A1%E1%84%8B%E1%85%B5%E1%84%90%E1%85%A5%E1%86%AB.svg?alt=media&token=dc805d0f-51ed-42fe-9847-f79cb88a94bf"),
        Score(rank: 12, team:"본머스", round: "1", point: 0, win: 0, draw: 0, loss: 0, gd: 0, image: "https://firebasestorage.googleapis.com/v0/b/devilsdingdong-8fcb2.appspot.com/o/%E1%84%87%E1%85%A9%E1%86%AB%E1%84%86%E1%85%A5%E1%84%89%E1%85%B3.svg?alt=media&token=6700d64b-4c69-4732-96df-796883c913cf"),
        Score(rank: 13, team:"풀럼", round: "1", point: 0, win: 0, draw: 0, loss: 0, gd: 0, image: "https://firebasestorage.googleapis.com/v0/b/devilsdingdong-8fcb2.appspot.com/o/%E1%84%91%E1%85%AE%E1%86%AF%E1%84%85%E1%85%A5%E1%86%B7.svg?alt=media&token=2e873a8d-ecec-4faf-9e1a-15c09e085b90"),
        Score(rank: 14, team:"울버햄튼", round: "1", point: 0, win: 0, draw: 0, loss: 0, gd: 0, image: "https://firebasestorage.googleapis.com/v0/b/devilsdingdong-8fcb2.appspot.com/o/%E1%84%8B%E1%85%AE%E1%86%AF%E1%84%87%E1%85%A5%E1%84%92%E1%85%A2%E1%86%B7%E1%84%90%E1%85%B3%E1%86%AB.svg?alt=media&token=a7d00e95-1414-4b60-890d-8595da4c9218"),
        Score(rank: 15, team:"에버턴", round: "1", point: 0, win: 0, draw: 0, loss: 0, gd: 0, image: "https://firebasestorage.googleapis.com/v0/b/devilsdingdong-8fcb2.appspot.com/o/%E1%84%8B%E1%85%A6%E1%84%87%E1%85%A5%E1%84%90%E1%85%B3%E1%86%AB.svg?alt=media&token=28fc188a-a065-4b7f-a30d-5dfade9585cc"),
        Score(rank: 16, team:"브렌트퍼드", round: "1", point: 0, win: 0, draw: 0, loss: 0, gd: 0, image: "https://firebasestorage.googleapis.com/v0/b/devilsdingdong-8fcb2.appspot.com/o/%E1%84%87%E1%85%B3%E1%84%85%E1%85%A6%E1%86%AB%E1%84%90%E1%85%B3%E1%84%91%E1%85%A5%E1%84%83%E1%85%B3.svg?alt=media&token=48923b31-7c47-423a-8a3f-b3ac47113178"),
        Score(rank: 17, team:"노팅엄", round: "1", point: 0, win: 0, draw: 0, loss: 0, gd: 0, image: "https://firebasestorage.googleapis.com/v0/b/devilsdingdong-8fcb2.appspot.com/o/%E1%84%82%E1%85%A9%E1%84%90%E1%85%B5%E1%86%BC%E1%84%8B%E1%85%A5%E1%86%B7.svg?alt=media&token=58f0c4af-00e1-44fb-a54e-9fe535b411f5"),
        Score(rank: 18, team:"입스위치", round: "1", point: 0, win: 0, draw: 0, loss: 0, gd: 0, image: "https://firebasestorage.googleapis.com/v0/b/devilsdingdong-8fcb2.appspot.com/o/%E1%84%8B%E1%85%B5%E1%86%B8%E1%84%89%E1%85%B3%E1%84%8B%E1%85%B1%E1%84%8E%E1%85%B5.svg?alt=media&token=9dab8d9f-db82-47b0-99cc-d03fa1bb1e92"),
        Score(rank: 19, team:"레스터", round: "1", point: 0, win: 0, draw: 0, loss: 0, gd: 0, image: "https://firebasestorage.googleapis.com/v0/b/devilsdingdong-8fcb2.appspot.com/o/%E1%84%85%E1%85%A6%E1%84%89%E1%85%B3%E1%84%90%E1%85%A5.svg?alt=media&token=1a364554-9b50-47f0-a489-8c0caa7a3b73"),
        Score(rank: 20, team:"사우샘프턴", round: "1", point: 0, win: 0, draw: 0, loss: 0, gd: 0, image: "https://firebasestorage.googleapis.com/v0/b/devilsdingdong-8fcb2.appspot.com/o/%E1%84%89%E1%85%A1%E1%84%8B%E1%85%AE%E1%84%89%E1%85%A2%E1%86%B7%E1%84%91%E1%85%B3%E1%84%90%E1%85%A5%E1%86%AB.svg?alt=media&token=60f18efc-74ea-4e82-8814-ae191112b5ef"),
    ]
}
