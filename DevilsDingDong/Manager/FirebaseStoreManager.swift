//
//  FirebaseStoreManager.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 6/5/24.
//

import FirebaseFirestore

class FirebaseStoreManager {
    
    func addMatchesToFirestore() {
        let db = Firestore.firestore()
        let batch = db.batch()
        
        for match in MatchInfo.data {
            let matchRef = db.collection("matches").document("\(match.id)")
            batch.setData(match.toDictionary(), forDocument: matchRef)
        }
        
        batch.commit { error in
            if let error = error {
                print("Error writing batch \(error)")
            } else {
                print("Batch write succeeded.")
            }
        }
    }
    
    func fetchMatches(completion: @escaping ([MatchInfo]) -> Void) {
        let db = Firestore.firestore()
        
        db.collection("matches").getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
                completion([])
            } else {
                guard let documents = querySnapshot?.documents else {
                    print("No documents found")
                    completion([])
                    return
                }
                
                let matches = documents.compactMap { document -> MatchInfo? in
                    let data = document.data()
                    return MatchInfo(dictionary: data)
                }
                completion(matches)
            }
        }
    }
}
