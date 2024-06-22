//
//  FirebaseStoreManager.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 6/5/24.
//

import FirebaseFirestore

class FirebaseStoreManager {
    
    func addFirestore<T: Encodable>(collection: String, document: String, data: T) {
        let db = Firestore.firestore()
        let ref = db.collection(collection).document(document)
        do {
            try ref.setData(from: data) { error in
                if let error = error {
                    print("error: \(error)")
                } else {
                    print("sucess written")
                }
            }
        } catch let error {
            print("error: \(error)")
        }
    }
    
    func fetchFirestore<T: Decodable>(collection: String, completion: @escaping (([T]) -> Void)) {
        let db = Firestore.firestore()
        db.collection(collection).getDocuments { query, error in
            if let error = error {
                print("error: \(error)")
                completion([])
            } else {
                guard let document = query?.documents else {
                    print("no found document")
                    completion([])
                    return
                }
                
                let items = document.compactMap { document -> T? in
                    return try? document.data(as: T.self)
                }
                completion(items)
            }
        }
    }
}
