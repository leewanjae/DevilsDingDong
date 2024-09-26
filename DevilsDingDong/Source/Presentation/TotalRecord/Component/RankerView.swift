//
//  RankerView.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 9/23/24.
//

import UIKit
import SnapKit

class RankerView: UIView {
    let circleView = UIView()
    let teamLogoImageView = UIImageView()
    let ribbonView = UIView()
    let rankLabel = UILabel()
    let teamLabel = UILabel()
    
    init(rankLabelsize: CGFloat, teamLabelsize: CGFloat, weight: UIFont.Weight ,circleSize: CGSize, ribbonSize: CGSize, logoSize: CGSize) {
        super.init(frame: .zero)
        setUI(rankLabelsize: rankLabelsize, teamLabelsize: teamLabelsize, weight: weight, circleSize: circleSize)
        setAutoLayout(circleSize: circleSize, ribbonSize: ribbonSize, logoSize: logoSize)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI(rankLabelsize: CGFloat, teamLabelsize: CGFloat, weight: UIFont.Weight, circleSize: CGSize) {
        rankLabel.font = .systemFont(ofSize: rankLabelsize, weight: .bold)
        rankLabel.text = ""
        
        teamLabel.font = .systemFont(ofSize: teamLabelsize, weight: weight)
        teamLabel.text = ""
        
        teamLogoImageView.image = nil
        
        circleView.backgroundColor = .white
        circleView.layer.cornerRadius = circleSize.width / 2
        
        circleView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.15).cgColor
        circleView.layer.shadowOpacity = 1
        circleView.layer.shadowRadius = 4
        circleView.layer.shadowOffset = CGSize(width: 0, height: 2)
        
        ribbonView.backgroundColor = .ribbonbg
        
        addSubview(ribbonView)
        addSubview(circleView)
        addSubview(teamLogoImageView)
        addSubview(rankLabel)
        addSubview(teamLabel)
    }
    
    private func setAutoLayout(circleSize: CGSize, ribbonSize: CGSize, logoSize: CGSize) {
        ribbonView.snp.makeConstraints {
            $0.width.equalTo(ribbonSize.width)
            $0.height.equalTo(ribbonSize.height)
            $0.leading.trailing.equalToSuperview()
            $0.centerX.equalTo(circleView)
            $0.bottom.equalToSuperview()
        }
        
        circleView.snp.makeConstraints {
            $0.width.equalTo(circleSize.width)
            $0.height.equalTo(circleSize.height)
            $0.centerX.equalTo(ribbonView)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(ribbonView.snp.centerY)
        }
        
        teamLogoImageView.snp.makeConstraints {
            $0.width.equalTo(logoSize.width)
            $0.height.equalTo(logoSize.height)
            $0.centerX.centerY.equalTo(circleView)
        }
        
        rankLabel.snp.makeConstraints {
            $0.top.equalTo(circleView.snp.bottom).offset(8)
            $0.centerX.equalTo(circleView)
        }
        
        teamLabel.snp.makeConstraints {
            $0.top.equalTo(rankLabel.snp.bottom)
            $0.centerX.equalTo(rankLabel)
        }
    }
    
    
    func configure(rank: String, team: String, logo: String) {
        rankLabel.text = rank
        teamLabel.text = team
        teamLogoImageView.image = UIImage(named: logo)
    }
}
