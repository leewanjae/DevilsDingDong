//
//  MatchResultView.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 8/22/24.
//

import UIKit
import SnapKit

class MatchResultView: UIView {
    private var matchInfo: MatchInfo
    private lazy var scrollView = UIScrollView()
    private lazy var resultTitleLabel = UILabel()
    private lazy var resultContainer = UIView()
    private lazy var matchType = UILabel()
    private lazy var matchDate = UILabel()
    
    private lazy var scoreBox = UIView()
    private lazy var score = UILabel()
    
    private lazy var manUtdStack = UIStackView()
    private lazy var enemyStack = UIStackView()

    private lazy var separatorHBar = UIView()
    private lazy var separatorVBar = UIView()
    private lazy var manUtdGoalsView = UIView()
    private lazy var enemyGoalsView = UIView()
    
    init(matchInfo: MatchInfo) {
        self.matchInfo = matchInfo
        super.init(frame: .zero)
        setUI()
        setAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        scrollView = createScrollView()
        resultTitleLabel = createLabel(text: "경기결과", fontSize: 20, fontWeight: .bold)
        resultContainer = createContainerView()
        matchType = createLabel(text: matchInfo.matchType)
        matchDate = createLabel(text: matchInfo.date)
        scoreBox = createContainerView()
        score = createLabel(text: matchInfo.score ?? "", fontSize: 30, fontWeight: .bold)
        manUtdStack = createTeamStackView(teamName: "맨유", logoName: "맨유", fontSize: 24)
        enemyStack = createTeamStackView(teamName: matchInfo.enemy, logoName: matchInfo.enemy, fontSize: 24)
        separatorHBar = createSeparatorView(color: .darkGray.withAlphaComponent(0.5), borderWidth: 1)
        separatorVBar = createSeparatorView(color: .darkGray.withAlphaComponent(0.3), borderWidth: 1)
        manUtdGoalsView = createGoalsView(goals: matchInfo.manUtdGoal, textAlign: .right)
        enemyGoalsView = createGoalsView(goals: matchInfo.enemyGoal, textAlign: .left)
        
        
        addSubview(scrollView)

        scrollView.addSubview(resultContainer)

        resultContainer.addSubview(resultTitleLabel)
        resultContainer.addSubview(matchType)
        resultContainer.addSubview(matchDate)
        resultContainer.addSubview(scoreBox)
        
        let scoreBoxItems = [manUtdStack, score, enemyStack]
        scoreBoxItems.forEach { scoreBox.addSubview($0) }
        
        let resultContainerItems = [separatorHBar, separatorVBar, manUtdGoalsView, enemyGoalsView]
        resultContainerItems.forEach { resultContainer.addSubview($0) }
    }
    
    private func setAutoLayout() {
        let safeArea = safeAreaLayoutGuide
        
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(safeArea)
        }
        
        resultTitleLabel.snp.makeConstraints {
            $0.top.equalTo(scrollView.snp.top).offset(30)
            $0.leading.equalTo(scrollView.snp.leading).offset(20)
        }
        
        resultContainer.snp.makeConstraints {
            $0.centerX.equalTo(snp.centerX)
            $0.width.equalTo(snp.width).offset(-30)
            $0.top.equalTo(resultTitleLabel.snp.bottom).offset(20)
        }
        
        matchType.snp.makeConstraints {
            $0.centerX.equalTo(resultContainer.snp.centerX)
            $0.top.equalTo(resultContainer.snp.top).offset(10)
        }
        
        matchDate.snp.makeConstraints {
            $0.centerX.equalTo(resultContainer.snp.centerX)
            $0.top.equalTo(matchType.snp.bottom).offset(10)
        }
        
        scoreBox.snp.makeConstraints {
            $0.centerX.equalTo(resultContainer.snp.centerX)
            $0.top.equalTo(matchDate.snp.bottom).offset(25)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        manUtdStack.snp.makeConstraints {
            $0.trailing.equalTo(score.snp.leading).offset(-30)
            $0.bottom.equalTo(separatorHBar.snp.top).offset(-20)
            $0.top.equalTo(matchDate.snp.bottom).offset(5)
        }
        
        enemyStack.snp.makeConstraints {
            $0.leading.equalTo(score.snp.trailing).offset(30)
            $0.bottom.equalTo(separatorHBar.snp.top).offset(-20)
            $0.top.equalTo(matchDate.snp.bottom).offset(5)
        }
        
        score.snp.makeConstraints {
            $0.centerX.equalTo(resultContainer.snp.centerX)
            $0.centerY.equalTo(scoreBox.snp.centerY)
        }
        
        separatorHBar.snp.makeConstraints {
            $0.top.equalTo(scoreBox.snp.bottom).offset(50)
            $0.leading.trailing.equalTo(resultContainer)
            $0.height.equalTo(1)
        }
        
        separatorVBar.snp.makeConstraints {
            $0.top.equalTo(separatorHBar.snp.bottom)
            $0.centerX.equalTo(resultContainer.snp.centerX)
            $0.width.equalTo(1)
            $0.bottom.equalTo(resultContainer.snp.bottom).offset(-10)
        }
        
        manUtdGoalsView.snp.makeConstraints {
            $0.top.equalTo(separatorHBar.snp.bottom).offset(5)
            $0.trailing.equalTo(separatorVBar.snp.leading).offset(-10)
            $0.width.equalTo(resultContainer.snp.width).multipliedBy(0.5).offset(-20)
        }
        
        enemyGoalsView.snp.makeConstraints {
            $0.top.equalTo(separatorHBar.snp.bottom).offset(5)
            $0.leading.equalTo(separatorVBar.snp.trailing).offset(10)
            $0.width.equalTo(resultContainer.snp.width).multipliedBy(0.5).offset(-20)
        }
        
    }
    
}

extension MatchResultView {
    private func createScrollView() -> UIScrollView {
        let scrollView = UIScrollView()
        return scrollView
    }
    
    private func createLabel(text: String, fontSize: CGFloat = 14, fontWeight: UIFont.Weight = .regular, textColor: UIColor = .black, textAlign: NSTextAlignment = .left) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
        label.textColor = textColor
        label.textAlignment = textAlign
        return label
    }
    
    private func createContainerView(backgroundColor: UIColor = .clear, cornerRadius: CGFloat = 0) -> UIView {
        let view = UIView()
        view.backgroundColor = backgroundColor
        view.layer.cornerRadius = cornerRadius
        return view
    }
    
    private func createSeparatorView(color: UIColor, borderWidth: CGFloat = 0) -> UIView {
        let view = UIView()
        view.backgroundColor = color
        view.layer.borderWidth = borderWidth
        return view
    }
    
    private func createGoalsView(goals: [String]?, textAlign: NSTextAlignment = .left ) -> UIView {
        let view = UIView()
        if let goals = goals?.filter({ !$0.isEmpty }) {
            var previousLabel: UILabel?
            for goal in goals {
                let label = createLabel(text: goal, fontWeight: .semibold, textAlign: textAlign)
                view.addSubview(label)
                label.snp.makeConstraints {
                    $0.leading.trailing.equalTo(view)
                    $0.height.equalTo(20)
                    if let previousLabel = previousLabel {
                        $0.top.equalTo(previousLabel.snp.bottom)
                    } else {
                        $0.top.equalTo(view.snp.top)
                    }
                }
                previousLabel = label
            }
            if let previousLabel = previousLabel {
                previousLabel.snp.makeConstraints {
                    $0.bottom.equalTo(view.snp.bottom)
                }
            }
        }
        return view
    }
    
    private func createLogoImage(url: String) -> UIImageView {
        let image = UIImageView()
        image.image = UIImage(named: url)
        image.contentMode = .scaleAspectFit
        return image
    }
    
    private func createTeamStackView(teamName: String, logoName: String, fontSize: CGFloat) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10
        let logoImageView = createLogoImage(url: logoName)
        let teamLabel = createLabel(text: teamName, fontSize: fontSize)
        
        logoImageView.snp.makeConstraints {
            $0.width.height.equalTo(70)
        }
        
        stackView.addArrangedSubview(logoImageView)
        stackView.addArrangedSubview(teamLabel)
        
        return stackView
    }
}
