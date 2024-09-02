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
            try ref.setData(from: data, merge: true) { error in
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
    
    func updatePlayerData(collection: String, documentID: String, playerDB: [Player]?, enemyPlayerDB: [Player]?) {
        let collection = collection
        let documentID = documentID
        let db = Firestore.firestore()
        
        // 먼저 해당 문서를 가져옴
        db.collection(collection).document(documentID).getDocument { (document, error) in
            if let document = document, document.exists {
                do {
                    var existingData = try document.data(as: MatchInfo.self)
                    
                    // playerDB가 nil이 아닌 경우에만 업데이트
                    if let newPlayers = playerDB {
                        var existingPlayers = existingData.player ?? []
                        existingPlayers.append(contentsOf: newPlayers)
                        existingData.player = existingPlayers
                    }
                    
                    // enemyPlayerDB가 nil이 아닌 경우에만 업데이트
                    if let newEnemyPlayers = enemyPlayerDB {
                        var existingEnemyPlayers = existingData.enemyPlayer ?? []
                        existingEnemyPlayers.append(contentsOf: newEnemyPlayers)
                        existingData.enemyPlayer = existingEnemyPlayers
                    }
                    
                    // Firestore에 업데이트된 데이터를 저장
                    self.addFirestore(collection: collection, document: documentID, data: existingData)
                    
                } catch {
                    print("Failed to decode existing document: \(error)")
                }
            } else {
                print("Document does not exist or failed to fetch document: \(error?.localizedDescription ?? "Unknown error")")
            }
        }
    }

    
    func fetchMatchesFirestore<T: Decodable>(collection: String, completion: @escaping (Result<[T], Error>) -> Void) {
        let db = Firestore.firestore()
        db.collection(collection).getDocuments { query, error in
            if let error = error {
                print("error: \(error)")
                completion(.failure(error))
            } else {
                guard let document = query?.documents else {
                    print("no found document")
                    completion(.success([]))
                    return
                }
                
                let items = document.compactMap { document -> T? in
                    return try? document.data(as: T.self)
                }
                completion(.success(items))
            }
        }
    }
    
    func fetchScoreFirestore<T: Decodable>(collection: String, completion: @escaping (Result<T, Error>) -> Void) {
        let db = Firestore.firestore()
        db.collection(collection).getDocuments { query, error in
            if let error = error {
                print("Error: \(error)")
                completion(.failure(error))
            } else {
                guard let documents = query?.documents else {
                    print("No documents found")
                    completion(.success([] as! T))
                    return
                }
                
                // Assume there's only one document for simplicity
                if let document = documents.first, let item = try? document.data(as: T.self) {
                    completion(.success(item))
                } else {
                    completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Document decoding failed"])))
                }
            }
        }
    }
}
