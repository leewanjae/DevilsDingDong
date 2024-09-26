//
//  TotalRecordView.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 6/11/24.
//

import UIKit
import SnapKit

class TotalRecordView: UIView {
    
    // MARK: - Properties

    let tableView = UITableView()
    let scoreContainer = UIView()
    
    // MARK: - Components
    
    let navTitleView = NavTitleView()
    let rankerView2 = RankerView(rankLabelsize: 20, teamLabelsize: 16, weight: .medium, circleSize: CGSize(width: 100, height: 100), ribbonSize: CGSize(width: 100, height: 116), logoSize: CGSize(width: 62.73, height: 63.64))
    let rankerView1 = RankerView(rankLabelsize: 24, teamLabelsize: 20, weight: .semibold, circleSize: CGSize(width: 120, height: 120), ribbonSize: CGSize(width: 120, height: 152), logoSize: CGSize(width: 75.27, height: 76.36))
    let rankerView3 = RankerView(rankLabelsize: 20, teamLabelsize: 16, weight: .medium, circleSize: CGSize(width: 100, height: 100), ribbonSize: CGSize(width: 100, height: 116), logoSize: CGSize(width: 62.73, height: 63.64))
    
    let scoreTitleView = ScoreTitleView()
    
    // MARK: - Life Cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UI

extension TotalRecordView {
    private func setUI() {
        backgroundColor = .bgColor
        
        scoreContainer.backgroundColor = .white
        scoreContainer.layer.cornerRadius = 15
        
        tableView.backgroundColor = .white
        tableView.layer.cornerRadius = 12
        tableView.showsVerticalScrollIndicator = false
        
        scoreContainer.addSubview(scoreTitleView)
        scoreContainer.addSubview(tableView)
        
        addSubview(navTitleView)
        addSubview(rankerView2)
        addSubview(rankerView1)
        addSubview(rankerView3)
        addSubview(scoreContainer)
    }
    
    private func setAutoLayout() {
        let safeArea = self.safeAreaLayoutGuide
        navTitleView.snp.makeConstraints {
            $0.top.equalTo(safeArea.snp.top)
            $0.leading.trailing.equalToSuperview()
        }
        
        rankerView2.snp.makeConstraints {
            $0.top.equalTo(navTitleView.snp.bottom).offset(71)
            $0.leading.equalToSuperview().offset(31)
            $0.bottom.equalTo(scoreContainer.snp.top)
        }

        rankerView1.snp.makeConstraints {
            $0.top.equalTo(navTitleView.snp.bottom).offset(24)
            $0.leading.equalTo(rankerView2.snp.trailing).offset(6)
            $0.trailing.equalTo(rankerView3.snp.leading).offset(-6)
            $0.bottom.equalTo(scoreContainer.snp.top)
        }

        rankerView3.snp.makeConstraints {
            $0.top.equalTo(navTitleView.snp.bottom).offset(71)
            $0.trailing.equalToSuperview().offset(-30)
            $0.bottom.equalTo(scoreContainer.snp.top)
        }
        
        scoreContainer.snp.makeConstraints {
            $0.top.equalTo(rankerView2.snp.bottom)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.bottom.equalTo(safeArea.snp.bottom)
            $0.width.equalTo(361)
            $0.height.equalTo(434)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(scoreTitleView.snp.bottom).offset(31)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(scoreContainer.snp.bottom)
        }
    }
}
