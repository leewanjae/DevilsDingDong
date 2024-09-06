//
//  MatchInfoViewModel.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 5/29/24.
//

import UIKit

import RxSwift
import RxCocoa

class MatchInfoViewModel: ViewModelType {
    
    // MARK: - Properties
    
    private let firebaseStoreManager = FirebaseStoreManager()
    let matchesSubject = BehaviorSubject<[MatchInfo]>(value: [])
    private let currentDateSubject = BehaviorSubject<DateComponents>(value: Calendar.current.dateComponents([.year, .month], from: Date()))
    
    // MARK: - Input
    
    struct Input {
        let previousMonthTap: ControlEvent<Void>
        let nextMonthTap: ControlEvent<Void>
        let fetchMatches: Observable<Void>
    }
    
    // MARK: - Output
    
    struct Output {
        let filteredMatches: Observable<[MatchInfo]>
        let formattedCurrentYearMonth: Observable<String>
        let isEmptyState: Observable<Bool>
    }
    
    func transform(input: Input, disposeBag: DisposeBag) -> Output {
        input.fetchMatches
            .flatMapLatest { [weak self] in
                self?.fetchMatchData() ?? .just([])
            }
            .subscribe { [weak self] matches in
                self?.matchesSubject.onNext(matches)
            }
            .disposed(by: disposeBag)
        
        input.previousMonthTap
            .withLatestFrom(currentDateSubject)
            .map { [weak self]  in
                self?.updateMonth(dateComponents: $0, change: -1)
            }
            .subscribe { [weak self]  newDate in
                if let newDate = newDate {
                    self?.currentDateSubject.onNext(newDate)
                }
            }
            .disposed(by: disposeBag)
        
        input.nextMonthTap
            .withLatestFrom(currentDateSubject)
            .map { [weak self] in
                self?.updateMonth(dateComponents: $0, change: 1)
            }
            .subscribe { [weak self] newDate in
                if let newDate = newDate {
                    self?.currentDateSubject.onNext(newDate)
                }
            }
            .disposed(by: disposeBag)
        
        let filteredMatches = Observable.combineLatest(matchesSubject, currentDateSubject)
            .map { matches, currentDate in
                let formattedYearMonth = self.formatYearMonth(from: currentDate)
                return matches.filter { $0.date.contains(formattedYearMonth) }
            }
        
        let formattedCurrentYearMonth = currentDateSubject
            .map { self.formatYearMonth(from: $0) }
        
        let isEmptyState = filteredMatches
            .map { $0.isEmpty }
        
        return Output(
            filteredMatches: filteredMatches,
            formattedCurrentYearMonth: formattedCurrentYearMonth,
            isEmptyState: isEmptyState
        )
    }
    
    private func fetchMatchData() -> Observable<[MatchInfo]> {
         return Observable.create { observer in
             self.firebaseStoreManager.fetchMatchesFirestore(collection: "matches") { (result: Result<[MatchInfo], Error>) in
                 switch result {
                 case .success(let matches):
                     observer.onNext(matches)
                     observer.onCompleted()
                 case .failure(let error):
                     observer.onError(error)
                 }
             }
             return Disposables.create()
         }
     }
    
    private func updateMonth(dateComponents: DateComponents, change: Int) -> DateComponents {
        var newDate = dateComponents
        var newMonth = (newDate.month ?? 1) + change
        var newYear = newDate.year ?? 2023
        
        if newMonth < 1 {
            newMonth = 12
            newYear -= 1
        } else if newMonth > 12 {
            newMonth = 1
            newYear += 1
        }
        
        if newYear < 2023 {
            newYear = 2023
            newMonth = 1
        } else if newYear > 2025 {
            newYear = 2025
            newMonth = 12
        }
        
        newDate.month = newMonth
        newDate.year = newYear
        return newDate
    }
    
    private func formatYearMonth(from dateComponents: DateComponents) -> String {
        guard let year = dateComponents.year, let month = dateComponents.month else { return "" }
        return String(format: "%02d년 %02d월", year % 100, month)
    }
}
