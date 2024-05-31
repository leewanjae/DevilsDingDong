//
//  MatchInfoViewModel.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 5/29/24.
//

import UIKit

class MatchInfoViewModel {
    var selectedMatchID: Int?
    var isRedirected: Bool = false
    var filteredMatches: [Match] = []
    var monthButtons: [UIButton] = []
    var updateTableView: (() -> Void)?
    var selectedMonth: String? {
        didSet {
            updateTableSelectedMonth()
        }
    }
    
    init() {
        filteredMatches = Match.data
    }
    
    func tappedMonthBtn(sender: UIButton) {
        guard let month = sender.title(for: .normal) else {
            print("Month title is nil")
            return
        }
        print("selected: \(month)")
        selectedMonth = month
        updateButtonSelectionState(sender: sender)
    }
    
    func updateButtonSelectionState(sender: UIButton) {
        for button in monthButtons {
            button.isSelected = false
            button.setTitleColor(.black, for: .normal)
        }
        sender.isSelected = true
        sender.setTitleColor(.accentColor, for: .normal)
    }
    
    func updateTableSelectedMonth() {
        guard let month = selectedMonth else {
            filteredMatches = Match.data
            updateTableView?()
            return
        }
        filteredMatches = Match.data.filter { $0.date.contains(month) }
        updateTableView?()
    }
}
