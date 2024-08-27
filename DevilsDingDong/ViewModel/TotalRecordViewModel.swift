//
//  TotalRecordViewModel.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 7/6/24.
//

import Foundation

class TotalRecordViewModel {
    private let firebaseStoreManager = FirebaseStoreManager()
    var scores: [Score] = []
    var viewUpdateCloser: (() -> Void)?
    private var isDataLoaded = false

    init() {
        fetchScoreData()
        (viewUpdateCloser ?? {})()
    }
    
    func fetchScoreData() {
        guard !isDataLoaded else { return print("이미 Score가 Fetch 되었습니다") }

           firebaseStoreManager.fetchScoreFirestore(collection: "24-25_Score") { [weak self] (result: Result< ScoreList, Error>) in
                   switch result {
                   case .success(let scoreList):
                       self?.scores = scoreList.scores
                       self?.isDataLoaded = true
                       self?.sortScores()
                   case .failure(let error):
                       print("Error fetching scores: \(error)")
                   }
           }
       }
    
    func sortScores() {
        scores.sort { $0.rank < $1.rank }
    }
}
