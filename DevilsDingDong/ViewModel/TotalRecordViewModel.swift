//
//  TotalRecordViewModel.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 7/6/24.
//

import Foundation

class TotalRecordViewModel {
    private let firebaseStoreManager = FirebaseStoreManager()
    var scores: [Score] = [] {
        didSet {
            viewUpdateCloser?()
           
        }
    }
    var viewUpdateCloser: (() -> Void)?
    
    func fetchScoreData() {
           firebaseStoreManager.fetchScoreFirestore(collection: "24-25_Score") { [weak self] (result: Result< ScoreList, Error>) in
               DispatchQueue.main.async {
                   switch result {
                   case .success(let scoreList):
                       self?.scores = scoreList.scores
                       self?.sortScores()
                       print("Fetched scores: \(scoreList.scores)")
                   case .failure(let error):
                       print("Error fetching scores: \(error)")
                   }
               }
           }
       }
    
    func sortScores() {
        scores.sort { $0.rank < $1.rank }
    }
}
