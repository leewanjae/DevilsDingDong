//
//  MatchInfoViewModel.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 5/29/24.
//

import UIKit

class MatchInfoViewModel {
<<<<<<< HEAD
    var matches: [MatchInfo] = MatchInfo.data
    var filteredMatches: [MatchInfo] = MatchInfo.data
=======
    private let firebaseStoreManager = FirebaseStoreManager()
    var matches: [MatchInfo] = []
    var filteredMatches: [MatchInfo] = []
    var todayMatch: [MatchInfo] = []
>>>>>>> 53ff7b74eb07f851df93f38f1861e928ad351b46
    var currentMonth = Calendar.current.component(.month, from: Date()) {
        didSet {
            viewUpdateCloser?()
            monthUpdateCloser?()
        }
    }
    var formattedCurrentMonth: String {
        return String(format: "%02d", currentMonth)
    }
    var viewUpdateCloser: (() -> Void)?
    var monthUpdateCloser: (() -> Void)?
    
    init() {
<<<<<<< HEAD
        setMatchData()
=======
        fetchMatchData()
>>>>>>> 53ff7b74eb07f851df93f38f1861e928ad351b46
    }
    
    func previousMonthTapped() {
        currentMonth -= 1
        if currentMonth > 12 {
<<<<<<< HEAD
            currentMonth = 1
        } else if currentMonth < 1 {
            currentMonth = 12
        }
        setMatchData()
=======
            currentMonth = 1 
        } else if currentMonth < 1 {
            currentMonth = 12
        }
        setFilterMatchData()
>>>>>>> 53ff7b74eb07f851df93f38f1861e928ad351b46
    }
    
    func nextMonthTapped() {
        currentMonth += 1
        if currentMonth > 12 {
            currentMonth = 1
        } else if currentMonth < 1 {
            currentMonth = 12
        }
<<<<<<< HEAD
        setMatchData()
    }
    
    func setMatchData() {
=======
        setFilterMatchData()
    }
    
    func fetchMatchData() {
        firebaseStoreManager.fetchFirestore(collection: "matches") { [weak self] (matches: [MatchInfo]) in
            self?.matches = matches
            self?.setFilterMatchData()
            self?.setTodayMatch()
            print("todayMatch: \(self?.todayMatch)")
        }
    }
    
    func setFilterMatchData() {
>>>>>>> 53ff7b74eb07f851df93f38f1861e928ad351b46
        filteredMatches = matches.filter { match in
            match.date.contains("\(formattedCurrentMonth)월")
        }
        viewUpdateCloser?()
        print("현재 포메팅 월: \(formattedCurrentMonth)")
        print("필터된 경기 데이터: \(filteredMatches.count)")
    }
<<<<<<< HEAD
=======
    
    func setTodayMatch() {
        let date = Date()
        let formatted = DateFormatter()
        formatted.dateFormat = "yy년 MM월 dd일"
        formatted.locale = Locale(identifier: "ko_KR")
        let formattedDate = formatted.string(from: date)
        print("formattedDate: \(formattedDate)")
        
        todayMatch = matches.filter { match in
            match.date.contains(formattedDate)
        }
    }
>>>>>>> 53ff7b74eb07f851df93f38f1861e928ad351b46
}
