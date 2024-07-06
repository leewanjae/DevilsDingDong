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
           firebaseStoreManager.fetchFirestore2(collection: "24-25_Score") { [weak self] (result: Result< ScoreList, Error>) in
               DispatchQueue.main.async {
                   switch result {
                   case .success(let scoreList):
                       self?.scores = scoreList.scores
                       print("Fetched scores: \(scoreList.scores)")
                   case .failure(let error):
                       print("Error fetching scores: \(error)")
                   }
               }
           }
       }
   }
