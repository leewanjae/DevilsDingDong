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
}
