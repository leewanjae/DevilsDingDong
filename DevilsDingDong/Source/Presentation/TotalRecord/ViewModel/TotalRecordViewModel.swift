//
//  TotalRecordViewModel.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 7/6/24.
//

import Foundation
import RxSwift

class TotalRecordViewModel: ViewModelType {
    
    //MARK: - Properties
    
    private let firebaseStoreManager = FirebaseStoreManager()
    private let disposeBag = DisposeBag()
    
    //MARK: - Input
    
    struct Input {
        let fetchTrigger: Observable<Void>
    }
    
    //MARK: - Output
    
    struct Output {
        let scores = BehaviorSubject<[Score]>(value: [])
    }
}

extension TotalRecordViewModel {
    func transform(input: Input, disposeBag: DisposeBag) -> Output {
        let output = Output()
        
        input.fetchTrigger
            .flatMapLatest { [weak self] _ in
                self?.fetchScoreData() ?? .just([])
            }
            .subscribe(
                onNext: { scores in
                    output.scores.onNext(scores)
                },
                onError: { error in
                    print(error)
                })
            .disposed(by: disposeBag)
        
        return output
    }
    
    func fetchScoreData() -> Observable<[Score]> {
        return Observable.create { [weak self] observer in
            guard let self = self else {
                observer.onNext([])
                observer.onCompleted()
                return Disposables.create()
            }
            
            self.firebaseStoreManager.fetchScoreFirestore(collection: "24-25_Score") { (result: Result<ScoreList, Error>) in
                switch result {
                case .success(let scoreList):
                    let sortedScores = self.sortScores(scoreList.scores)
                    observer.onNext(sortedScores)
                    observer.onCompleted()
                case .failure(let error):
                    observer.onError(error)
                }
            }
            
            return Disposables.create()
        }
    }
    
    func sortScores(_ scores: [Score]) -> [Score] {
        return scores.sorted {
            if $0.rank == $1.rank {
                return $0.gd > $1.gd
            }
            return $0.rank < $1.rank
        }
    }
}
