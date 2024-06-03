//
//  MatchInfoViewModel.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 5/29/24.
//

import UIKit

class MatchInfoViewModel {
    var matches: [Match] = Match.data
    var filteredMatches: [Match] = Match.data
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
        setMatchData()
    }
    
    func previousMonthTapped() {
        currentMonth -= 1
        if currentMonth > 12 {
            currentMonth = 1
        } else if currentMonth < 1 {
            currentMonth = 12
        }
        setMatchData()
    }

    func nextMonthTapped() {
        currentMonth += 1
        if currentMonth > 12 {
            currentMonth = 1
        } else if currentMonth < 1 {
            currentMonth = 12
        }
        setMatchData()
    }
    
    func setMatchData() {
        filteredMatches = matches.filter { match in
            match.date.contains("\(formattedCurrentMonth)월")
        }
        viewUpdateCloser?()
        print("현재 포메팅 월: \(formattedCurrentMonth)")
        print("필터된 경기 데이터: \(filteredMatches.count)")
    }
}
