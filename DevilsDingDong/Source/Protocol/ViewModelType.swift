//
//  ViewModelType.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 8/29/24.
//

import Foundation
import RxSwift

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    func transform(input: Input, disposeBag: DisposeBag) -> Output
}
