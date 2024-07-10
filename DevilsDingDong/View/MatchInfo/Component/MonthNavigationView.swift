//
//  MonthNavigationView.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 5/31/24.
//

import UIKit

class MonthNavigationView: UIView {
    private var viewModel: MatchInfoViewModel
    
    private lazy var prevButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(previousMonthTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private lazy var monthLabel: UILabel = {
        let label = UILabel()
        label.text = "\(viewModel.formattedCurrentYearMonth)"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 28)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(nextMonthTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        addSubview(monthLabel)
        addSubview(prevButton)
        addSubview(nextButton)
    }
    
    private func setAutoLayout() {
        NSLayoutConstraint.activate([
            prevButton.trailingAnchor.constraint(equalTo: monthLabel.leadingAnchor, constant: -20),
            prevButton.widthAnchor.constraint(equalToConstant: 50),
            prevButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            monthLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            monthLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            monthLabel.widthAnchor.constraint(equalToConstant: 150),
            nextButton.leadingAnchor.constraint(equalTo: monthLabel.trailingAnchor, constant: 20),
            nextButton.widthAnchor.constraint(equalToConstant: 50),
            nextButton.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}

extension MonthNavigationView {
    @objc private func previousMonthTapped() {
        viewModel.previousMonthTapped()
    }
    
    @objc private func nextMonthTapped() {
        viewModel.nextMonthTapped()
    }
}
