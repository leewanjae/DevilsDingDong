//
//  MatchInfoViewModel.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 5/29/24.
//

import UIKit

class MatchInfoViewModel {
    private let firebaseStoreManager = FirebaseStoreManager()
    var matches: [MatchInfo] = []
    var filteredMatches: [MatchInfo] = []
    var todayMatch: [MatchInfo] = []
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
        fetchMatchData()
        setTodayMatch()
    }
    
    func previousMonthTapped() {
        currentMonth -= 1
        if currentMonth > 12 {
            currentMonth = 1
        } else if currentMonth < 1 {
            currentMonth = 12
        }
        setFilterMatchData()
    }
    
    func nextMonthTapped() {
        currentMonth += 1
        if currentMonth > 12 {
            currentMonth = 1
        } else if currentMonth < 1 {
            currentMonth = 12
        }
        setFilterMatchData()
    }
    
    func fetchMatchData() {
        firebaseStoreManager.fetchFirestore(collection: "matches") { [weak self] (matches: [MatchInfo]) in
            self?.matches = matches
            self?.setFilterMatchData()
        }
    }
    
    func setFilterMatchData() {
        filteredMatches = matches.filter { match in
            match.date.contains("\(formattedCurrentMonth)월")
        }
        viewUpdateCloser?()
        print("현재 포메팅 월: \(formattedCurrentMonth)")
        print("필터된 경기 데이터: \(filteredMatches.count)")
    }
    
    func setTodayMatch() {
        let date = Date()
        let formatted = DateFormatter()
        formatted.dateFormat = "yy MM dd (E)"
        formatted.locale = Locale(identifier: "ko_KR")
        let formattedDate = formatted.string(from: date)
        print("formattedDate: \(formattedDate)")
        
        todayMatch = matches.filter { match in
            match.date.contains(formattedDate)
        }
    }
}
