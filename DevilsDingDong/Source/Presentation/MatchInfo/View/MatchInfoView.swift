//
//  MatchInfoView.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 5/12/24.
//

import UIKit
import SnapKit

class MatchInfoView: UIView {
    
    // MARK: - Properties

    let tableView = UITableView()
    let emptyCharacter = UIImageView()
    let emptyStateLabel = UILabel()

    // MARK: - Components
    
    let monthNavigationView = MonthNavigationView()
    
    // MARK: - Life Cycle

    init() {
        super.init(frame: .zero)
        setUI()
        setAutoLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UI

    private func setUI() {
        backgroundColor = .bgColor

        emptyCharacter.image = UIImage(named: "ch")
        emptyCharacter.contentMode = .scaleAspectFit
        
        emptyStateLabel.text = "경기 일정이 없습니다"
        emptyStateLabel.textColor = .gray
        emptyStateLabel.textAlignment = .center
        emptyStateLabel.isHidden = true
        
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .bgColor
        tableView.separatorStyle = .none

        addSubview(monthNavigationView)
        addSubview(tableView)
        addSubview(emptyStateLabel)
        addSubview(emptyCharacter)
    }

    private func setAutoLayout() {
        let safeArea = self.safeAreaLayoutGuide

        monthNavigationView.snp.makeConstraints {
            $0.top.equalTo(safeArea.snp.top)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalToSuperview().multipliedBy(0.1)
            $0.centerX.equalToSuperview()
        }

        tableView.snp.makeConstraints {
            $0.top.equalTo(monthNavigationView.snp.bottom)
            $0.bottom.equalTo(safeArea.snp.bottom)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }

        emptyCharacter.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.height.equalTo(200)
        }

        emptyStateLabel.snp.makeConstraints {
            $0.top.equalTo(emptyCharacter.snp.bottom).offset(50)
            $0.centerX.equalTo(emptyCharacter.snp.centerX)
        }
    }
}
