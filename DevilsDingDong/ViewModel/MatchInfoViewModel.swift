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
    var currentDate = Calendar.current.dateComponents([.year, .month], from: Date()) {
        didSet {
            viewUpdateCloser?()
            monthUpdateCloser?()
        }
    }
    var formattedCurrentYearMonth: String {
           guard let year = currentDate.year, let month = currentDate.month else { return "" }
           let formattedYear = String(format: "%02d", year % 100)
           let formattedMonth = String(format: "%02d", month)
           return "\(formattedYear)년 \(formattedMonth)월"
       }
    var viewUpdateCloser: (() -> Void)?
    var monthUpdateCloser: (() -> Void)?
    
    init() {
        fetchMatchData()
    }
    
    func previousMonthTapped() {
        if let currentMonth = currentDate.month, let currentYear = currentDate.year {
            var newMonth = currentMonth - 1
            var newYear = currentYear
            
            if newMonth < 1 {
                newMonth = 12
                newYear -= 1
            }
            
            if newYear < 2023 {
                newYear = 2023
                newMonth = 1
            }
            
            currentDate.month = newMonth
            currentDate.year = newYear
            setFilterMatchData()
        }
    }
    
    func nextMonthTapped() {
        if let currentMonth = currentDate.month, let currentYear = currentDate.year {
            var newMonth = currentMonth + 1
            var newYear = currentYear
            
            if newMonth > 12 {
                newMonth = 1
                newYear += 1
            }
            
            if newYear > 2025 {
                newYear = 2025
                newMonth = 12
            }
            
            currentDate.month = newMonth
            currentDate.year = newYear
            setFilterMatchData()
        }
    }
    
    func fetchMatchData() {
            firebaseStoreManager.fetchMatchesFirestore(collection: "matches") { [weak self] (result: Result<[MatchInfo], Error>) in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let matches):
                        self?.matches = matches
                        self?.setFilterMatchData()
                        self?.setTodayMatch()
                    case .failure(let error):
                        print("Error fetching matches: \(error)")
                    }
                }
            }
        }
    
    func setFilterMatchData() {
        filteredMatches = matches.filter { match in
            match.date.contains("\(formattedCurrentYearMonth)")
        }
        viewUpdateCloser?()
    }
    
    func setTodayMatch() {
        let date = Date()
        let formatted = DateFormatter()
        formatted.dateFormat = "yy년 MM월 dd일"
        formatted.locale = Locale(identifier: "ko_KR")
        let formattedDate = formatted.string(from: date)
        
        todayMatch = matches.filter { match in
            match.date.contains(formattedDate)
        }
    }
}
