//
//  TodayMatchViewModel.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 8/30/24.
//

import UIKit
import RxSwift

class TodayMatchViewModel: ViewModelType {
    
    // MARK: - Properties
    
    private let firebaseStoreManager = FirebaseStoreManager()
    private let disposeBag = DisposeBag()
    
    // MARK: - Input
    struct Input {
        let fetchTrigger: Observable<Void>
    }
    
    // MARK: - Output
    struct Output {
        let todayMatch = BehaviorSubject<[MatchInfo]>(value: [])
    }
    
    func transform(input: Input, disposeBag: DisposeBag) -> Output {
        let output = Output()
        
        input.fetchTrigger
            .flatMapLatest { [weak self] _ in
                self?.fetchTodayMatchData() ?? .just([])
            }
            .subscribe(
                onNext: { todayMatch in
                    output.todayMatch.onNext(todayMatch)
                }, onError: { error in
                    print(error)
                })
            .disposed(by: disposeBag)
        return output
    }
    
    private func fetchTodayMatchData() -> Observable<[MatchInfo]> {
        return Observable.create { [weak self] observer in
            guard let self = self else {
                observer.onNext([])
                observer.onCompleted()
                return Disposables.create()
            }
            
            firebaseStoreManager.fetchMatchesFirestore(collection: "matches") { [weak self] (result: Result<[MatchInfo], Error>) in
                switch result {
                case .success(let matches):
                    if let todayMatch = self?.filterTodayMatch(from: matches) {
                        observer.onNext([todayMatch])
                        observer.onCompleted()
                    }
                case .failure(let error):
                    observer.onError(error)
                }
            }
            return Disposables.create()
        }
    }
    
    private func filterTodayMatch(from matches: [MatchInfo]) -> MatchInfo? {
        let date = Date()
        let formatted = DateFormatter()
        formatted.dateFormat = "yy년 MM월 dd일"
        formatted.locale = Locale(identifier: "ko_KR")
        let formattedDate = formatted.string(from: date)
        
        return matches.first { $0.date.contains(formattedDate) }
    }
}
