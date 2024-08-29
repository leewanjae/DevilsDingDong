//
//  MonthNavigationView.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 5/31/24.
//

import UIKit
import SnapKit

class MonthNavigationView: UIView {
    private var viewModel: MatchInfoViewModel
    
    private lazy var prevButton = createButton(image: "chevron.left", action: #selector(previousMonthTapped))
    private lazy var nextButton = createButton(image: "chevron.right", action: #selector(nextMonthTapped))
    private lazy var monthLabel: UILabel = {
        let label = UILabel()
        label.text = "\(viewModel.formattedCurrentYearMonth)"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 28)
        return label
    }()
    
    init(viewModel: MatchInfoViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setUI()
        setAutoLayout()
        viewModel.monthUpdateCloser = { [weak self] in
            self?.monthLabel.text = "\(self?.viewModel.formattedCurrentYearMonth ?? "00년 00월")"
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        [monthLabel, prevButton, nextButton].forEach { addSubview($0)}
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
    @objc private func previousMonthTapped() {
        viewModel.previousMonthTapped()
    }
    
    @objc private func nextMonthTapped() {
        viewModel.nextMonthTapped()
    }
    
    private func createButton(image: String, action: Selector) -> UIButton {
        let button = UIButton()
        button.setImage(UIImage(systemName: image), for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: action, for: .touchUpInside)
        return button
    }
}
