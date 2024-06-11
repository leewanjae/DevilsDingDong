//
//  MatchDetailCurrentScoreView.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 6/11/24.
//

import UIKit

class MatchDetailCurrentScoreView: UIView {
   
    lazy var mainStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.alignment = .fill
        view.spacing = 3
        view.backgroundColor = .lightText
        view.layer.cornerRadius = 20
        view.layer.shadowOpacity = 0.2
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        addView()
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addView() {
        addSubview(mainStackView)
        mainStackView.addArrangedSubview(createVerticalStackView(headerText: "순위", dataText: "8"))
        mainStackView.addArrangedSubview(createVerticalStackView(headerText: "경기", dataText: "38"))
        mainStackView.addArrangedSubview(createVerticalStackView(headerText: "승점", dataText: "60"))
        mainStackView.addArrangedSubview(createVerticalStackView(headerText: "승", dataText: "18"))
        mainStackView.addArrangedSubview(createVerticalStackView(headerText: "무", dataText: "6"))
        mainStackView.addArrangedSubview(createVerticalStackView(headerText: "패", dataText: "14"))
        mainStackView.addArrangedSubview(createVerticalStackView(headerText: "득", dataText: "57"))
        mainStackView.addArrangedSubview(createVerticalStackView(headerText: "실", dataText: "58"))
        mainStackView.addArrangedSubview(createVerticalStackView(headerText: "득실", dataText: "-1"))
    }
    
    func setUI() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
    }
}

extension MatchDetailCurrentScoreView {
    private func createVerticalStackView(headerText: String, dataText: String) -> UIStackView {
        let headerLabel = UILabel()
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.text = headerText
        headerLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        headerLabel.textAlignment = .center
        headerLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        let separatorHBar = UIView()
        separatorHBar.translatesAutoresizingMaskIntoConstraints = false
        separatorHBar.backgroundColor = .lightGray
       
        let dataLabel = UILabel()
        dataLabel.translatesAutoresizingMaskIntoConstraints = false
        dataLabel.text = dataText
        dataLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        dataLabel.textAlignment = .center
        dataLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        let stackView = UIStackView(arrangedSubviews: [headerLabel, separatorHBar, dataLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        
        NSLayoutConstraint.activate([
            separatorHBar.heightAnchor.constraint(equalToConstant: 1),
            separatorHBar.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            separatorHBar.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            separatorHBar.topAnchor.constraint(equalTo: headerLabel.bottomAnchor)
        ])
        return stackView
    }
}
