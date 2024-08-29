//
//  TodayMatchInfoView.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 8/21/24.
//

import UIKit
import SnapKit

class TodayMatchInfoView: UIStackView {
    init(date: String, time: String, matchType: String, round: String, stadium: String) {
        super.init(frame: .zero)
        setUI(date: date, time: time, matchType: matchType, round: round, stadium: stadium)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TodayMatchInfoView {
    private func setUI(date: String, time: String, matchType: String, round: String, stadium: String) {
        axis = .vertical
        alignment = .center
        spacing = 10
        
        let matchTypeStackView = createStackView()
        let dateStackView = createStackView()
        
        let matchTypeLabel = createLabel(size: 18, weight: .regular, text: matchType)
        let roundLabel = createLabel(size: 14, weight: .regular, text: round)
        let stadiumLabel = createLabel(size: 14, weight: .regular, text: stadium)
        let dateLabel = createLabel(size: 20, weight: .regular, text: date)
        let timeLabel = createLabel(size: 20, weight: .regular, text: time)
        
        matchTypeStackView.addArrangedSubview(matchTypeLabel)
        matchTypeStackView.addArrangedSubview(roundLabel)
        
        dateStackView.addArrangedSubview(dateLabel)
        dateStackView.addArrangedSubview(timeLabel)
        
        addArrangedSubview(matchTypeStackView)
        addArrangedSubview(stadiumLabel)
        addArrangedSubview(dateStackView)
        
        [matchTypeLabel, roundLabel, stadiumLabel].forEach { $0.textColor = .gray }
    }
    
    private func createLabel(size: CGFloat, weight: UIFont.Weight, text: String) -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: size, weight: weight)
        label.text = text
        label.textColor = .black
        return label
    }
    
    private func createStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 20
        return stackView
    }
}
