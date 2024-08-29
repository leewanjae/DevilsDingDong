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
    private var isDataLoaded = false
    private let scoreSubject = BehaviorSubject<[Score]>(value: [])
    
    //MARK: - Input
    
    struct Input {
        let fetchTrigger: Observable<Void>
    }
    
    //MARK: - Output
    
    struct Output {
        let scores: Observable<[Score]>
        let error: Observable<Error?>
    }
}

extension TotalRecordViewModel {
    func transform(input: Input, disposeBag: DisposeBag) -> Output {
        let errorSubject = PublishSubject<Error?>()
        let scoresSubject = BehaviorSubject<[Score]>(value: [])
        
        input.fetchTrigger
            .flatMapLatest { [weak self] in
                return self?.fetchScoreData() ?? .just([])
            }
            .subscribe(onNext: { [weak self] scores in
                let sortedScores = self?.sortScores(scores) ?? []
                scoresSubject.onNext(sortedScores)
            }, onError: { error in
                errorSubject.onNext(error)
            })
            .disposed(by: disposeBag)
        
        return Output(scores: scoresSubject.asObservable(), error: errorSubject.asObservable())
    }
    
    func fetchScoreData() -> Observable<[Score]> {
        return Observable.create { [weak self] observer in
            guard let self = self, !self.isDataLoaded else {
                observer.onNext((try? self?.scoreSubject.value()) ?? [])
                observer.onCompleted()
                return Disposables.create()
            }
            
            self.firebaseStoreManager.fetchScoreFirestore(collection: "24-25_Score") { (result: Result<ScoreList, Error>) in
                switch result {
                case .success(let scoreList):
                    self.isDataLoaded = true
                    observer.onNext(scoreList.scores)
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
