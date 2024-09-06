//
//  MonthNavigationView.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 5/31/24.
//

import UIKit
import SnapKit

class MonthNavigationView: UIView {
    
    // MARK: - Properties
    
    var prevButton = UIButton()
    var nextButton = UIButton()
    var monthLabel = UILabel()
    
    // MARK: - Life Cycle
    
    init() {
        super.init(frame: .zero)
        setUI()
        setAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        prevButton = createButton(image: "chevron.left")
        nextButton = createButton(image: "chevron.right")
        
        monthLabel.textColor = .black
        monthLabel.textAlignment = .center
        monthLabel.font = UIFont.systemFont(ofSize: 28)

        addSubview(monthLabel)
        addSubview(prevButton)
        addSubview(nextButton)
    }
    
    private func setAutoLayout() {
        monthLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.equalTo(150)
        }
        
        prevButton.snp.makeConstraints {
            $0.trailing.equalTo(monthLabel.snp.leading).offset(-20)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(50)
        }
        
        nextButton.snp.makeConstraints {
            $0.leading.equalTo(monthLabel.snp.trailing).offset(20)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(50)
        }
    }
}

extension MonthNavigationView {
    private func createButton(image: String) -> UIButton {
        let button = UIButton()
        button.setImage(UIImage(systemName: image), for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }
}
