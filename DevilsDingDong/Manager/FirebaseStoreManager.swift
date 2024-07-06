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
    
    func fetchFirestore<T: Decodable>(collection: String, completion: @escaping (Result<[T], Error>) -> Void) {
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
    
    func fetchFirestore2<T: Decodable>(collection: String, completion: @escaping (Result<T, Error>) -> Void) {
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
