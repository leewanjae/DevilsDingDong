//
//  TodayMatchViewModel.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 8/30/24.
//

import UIKit

class TodayMatchViewModel {
    private let firebaseStoreManager = FirebaseStoreManager()
    var todayMatch: MatchInfo?
    var viewUpdateCloser: (() -> Void)?

    init() {
        fetchTodayMatchData()
    }

    private func fetchTodayMatchData() {
        firebaseStoreManager.fetchMatchesFirestore(collection: "matches") { [weak self] (result: Result<[MatchInfo], Error>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let matches):
                    self?.todayMatch = self?.filterTodayMatch(from: matches)
                    self?.viewUpdateCloser?()
                case .failure(let error):
                    print("Error fetching matches: \(error)")
                }
            }
        }
    }

    private func filterTodayMatch(from matches: [MatchInfo]) -> MatchInfo? {
        let date = Date()
        let formatted = DateFormatter()
        formatted.dateFormat = "yy년 MM월 dd일"
        formatted.locale = Locale(identifier: "ko_KR")
        let formattedDate = formatted.string(from: date)

        return matches.first { $0.date.contains(formattedDate) }
    }
}
