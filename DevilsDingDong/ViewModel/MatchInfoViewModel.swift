//
//  MatchInfoViewModel.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 5/29/24.
//

import UIKit

class MatchInfoViewModel {
    
    var isRedirected: Bool = false
    var selectedMatchID: Int?
    var filteredMatches: [Match] = []
    var monthButtons: [UIButton] = []
    var filterButtons: [UIButton] = []
}
