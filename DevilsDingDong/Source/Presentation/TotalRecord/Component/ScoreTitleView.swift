//
//  ScoreTitleView.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 9/25/24.
//

import UIKit
import SnapKit

class ScoreTitleView: UIView {
    
    // MARK: - Properties
    
    let rankLabel = UILabel()
    let teamLabel = UILabel()
    let roundLabel = UILabel()
    let winLabel = UILabel()
    let drawLabel = UILabel()
    let lossLabel = UILabel()
    let pointLabel = UILabel()
    let gdLabel = UILabel()
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    
    private func setUI() {
        rankLabel.text = "순위"
        rankLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        rankLabel.textColor = .accent
        
        teamLabel.text = "팀"
        teamLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        teamLabel.textColor = .scoreTitle

        roundLabel.text = "경기"
        roundLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        roundLabel.textColor = .scoreTitle

        winLabel.text = "승"
        winLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        winLabel.textColor = .scoreTitle

        drawLabel.text = "무"
        drawLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        drawLabel.textColor = .scoreTitle

        lossLabel.text = "패"
        lossLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        lossLabel.textColor = .scoreTitle

        pointLabel.text = "승점"
        pointLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        pointLabel.textColor = .scoreTitle

        gdLabel.text = "득실"
        gdLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        gdLabel.textColor = .scoreTitle
        
        addSubview(rankLabel)
        addSubview(teamLabel)
        addSubview(roundLabel)
        addSubview(winLabel)
        addSubview(drawLabel)
        addSubview(lossLabel)
        addSubview(pointLabel)
        addSubview(gdLabel)
    }
    
    private func setAutoLayout() {
        rankLabel.snp.makeConstraints {
            $0.top.equalTo(snp.top).offset(12)
            $0.leading.equalToSuperview().offset(16)
            $0.width.equalTo(28)
            $0.height.equalTo(22)
        }
        
        teamLabel.snp.makeConstraints {
            $0.top.equalTo(rankLabel)
            $0.leading.equalTo(rankLabel.snp.trailing).offset(29)
            $0.width.equalTo(14)
            $0.height.equalTo(22)
        }
        
        roundLabel.snp.makeConstraints {
            $0.top.equalTo(rankLabel)
            $0.leading.equalTo(teamLabel.snp.trailing).offset(40)
            $0.width.equalTo(28)
            $0.height.equalTo(22)
        }
        
        winLabel.snp.makeConstraints {
            $0.top.equalTo(rankLabel)
            $0.leading.equalTo(roundLabel.snp.trailing).offset(17)
            $0.width.equalTo(14)
            $0.height.equalTo(22)
        }
        
        drawLabel.snp.makeConstraints {
            $0.top.equalTo(rankLabel)
            $0.leading.equalTo(winLabel.snp.trailing).offset(24)
            $0.width.equalTo(14)
            $0.height.equalTo(22)
        }
        
        lossLabel.snp.makeConstraints {
            $0.top.equalTo(rankLabel)
            $0.leading.equalTo(drawLabel.snp.trailing).offset(24)
            $0.width.equalTo(14)
            $0.height.equalTo(22)
        }
        
        pointLabel.snp.makeConstraints {
            $0.top.equalTo(rankLabel)
            $0.leading.equalTo(lossLabel.snp.trailing).offset(17)
            $0.width.equalTo(28)
            $0.height.equalTo(22)
        }
        
        gdLabel.snp.makeConstraints {
            $0.top.equalTo(rankLabel)
            $0.leading.equalTo(pointLabel.snp.trailing).offset(10)
            $0.width.equalTo(28)
            $0.height.equalTo(22)
        }
    }
}
