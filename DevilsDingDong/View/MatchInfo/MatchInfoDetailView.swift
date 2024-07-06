//
//  MatchInfoDetailView.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 5/8/24.
//

import UIKit
import WebKit

class MatchInfoDetailView: UIViewController {
    private var matchInfo: MatchInfo?
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var resultTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "경기결과"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    private lazy var resultContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .placeholderText
        view.layer.cornerRadius = 20
        view.layer.borderColor = CGColor(red: 0.765, green: 0.2, blue: 0.18, alpha: 0)
        view.layer.shadowOpacity = 0.2
        return view
    }()
    private lazy var matchType: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = matchInfo?.matchType
        label.textColor = .white
        return label
    }()
    private lazy var matchDate: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = matchInfo?.date
        label.textColor = .white
        return label
    }()
    private lazy var scoreBox: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var manUtdLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "맨유"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .white
        return label
    }()
    private lazy var score: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = matchInfo?.score
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        return label
    }()
    private lazy var enemy: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var enemyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = matchInfo?.enemy
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    private lazy var separatorHBar: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        view.layer.borderWidth = 1
        return view
    }()
    private lazy var separatorVBar: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .darkGray.withAlphaComponent(0)
        return view
    }()
    private lazy var manUtdGoalsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        if let goals = matchInfo?.manUtdGoal?.filter({ !$0.isEmpty }) {
            var previousLabel: UILabel?
            for goal in goals {
                let label = UILabel()
                label.translatesAutoresizingMaskIntoConstraints = false
                label.text = goal
                label.textColor = .white
                label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
                label.textAlignment = .right
                view.addSubview(label)
                NSLayoutConstraint.activate([
                    label.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    label.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                    label.heightAnchor.constraint(equalToConstant: 20)
                ])
                if let previousLabel = previousLabel {
                    NSLayoutConstraint.activate([
                        label.topAnchor.constraint(equalTo: previousLabel.bottomAnchor)
                    ])
                } else {
                    NSLayoutConstraint.activate([
                        label.topAnchor.constraint(equalTo: view.topAnchor)
                    ])
                }
                previousLabel = label
            }
            if let previousLabel = previousLabel {
                previousLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            }
        }
        return view
    }()
    private lazy var enemyGoalsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        if let goals = matchInfo?.enemyGoal?.filter({ !$0.isEmpty }) {
            var previousLabel: UILabel?
            for goal in goals {
                let label = UILabel()
                label.translatesAutoresizingMaskIntoConstraints = false
                label.text = goal
                label.textColor = .white
                label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
                view.addSubview(label)
                NSLayoutConstraint.activate([
                    label.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    label.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                    label.heightAnchor.constraint(equalToConstant: 20)
                ])
                if let previousLabel = previousLabel {
                    NSLayoutConstraint.activate([
                        label.topAnchor.constraint(equalTo: previousLabel.bottomAnchor)
                    ])
                } else {
                    NSLayoutConstraint.activate([
                        label.topAnchor.constraint(equalTo: view.topAnchor)
                    ])
                }
                previousLabel = label
            }
            if let previousLabel = previousLabel {
                previousLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            }
        }
        return view
    }()
    private lazy var enemyGoal: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 8, weight: .semibold)
        return label
    }()
    private lazy var highlightTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "하이라이트"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    private lazy var highlightContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        return view
    }()
    private lazy var highlightView: WKWebView = {
        let webView = WKWebView()
        webView.load(URLRequest(url: URL(string: matchInfo?.highlight ?? "")!))
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.layer.shadowOpacity = 0.2
        return webView
    }()
    
    init(matchInfo: MatchInfo) {
        self.matchInfo = matchInfo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

extension MatchInfoDetailView {
    private func setUI() {
        view.backgroundColor = UIColor.bg
        addView()
        setAutoLayout()
    }
    
    private func addView() {
        view.addSubview(scrollView)
        scrollView.addSubview(resultTitleLabel)
        scrollView.addSubview(resultContainer)
        scrollView.addSubview(highlightTitleLabel)
        scrollView.addSubview(highlightContainerView)
        
        resultContainer.addSubview(matchType)
        resultContainer.addSubview(matchDate)
        resultContainer.addSubview(scoreBox)
        resultContainer.addSubview(separatorHBar)
        resultContainer.addSubview(separatorVBar)
        resultContainer.addSubview(manUtdGoalsView)
        resultContainer.addSubview(enemyGoalsView)
        
        scoreBox.addSubview(manUtdLabel)
        scoreBox.addSubview(score)
        scoreBox.addSubview(enemyLabel)
        
        highlightContainerView.addSubview(highlightView)
    }
    
    private func setAutoLayout() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            resultTitleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor),
            resultTitleLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            
            resultContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resultContainer.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30),
            resultContainer.topAnchor.constraint(equalTo: resultTitleLabel.bottomAnchor, constant: 10),
            
            matchType.centerXAnchor.constraint(equalTo: resultContainer.centerXAnchor),
            matchType.topAnchor.constraint(equalTo: resultContainer.topAnchor, constant: 10),
            
            matchDate.centerXAnchor.constraint(equalTo: resultContainer.centerXAnchor),
            matchDate.topAnchor.constraint(equalTo: matchType.bottomAnchor, constant: 10),
            
            scoreBox.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scoreBox.topAnchor.constraint(equalTo: matchDate.bottomAnchor, constant: 25),
            scoreBox.heightAnchor.constraint(equalToConstant: 30),
            
            manUtdLabel.trailingAnchor.constraint(equalTo: score.leadingAnchor, constant: -5),
            enemyLabel.leadingAnchor.constraint(equalTo: score.trailingAnchor, constant: 5),
            score.centerXAnchor.constraint(equalTo: scoreBox.centerXAnchor),
            
            separatorHBar.topAnchor.constraint(equalTo: scoreBox.bottomAnchor , constant: 20),
            separatorHBar.leadingAnchor.constraint(equalTo: resultContainer.leadingAnchor),
            separatorHBar.trailingAnchor.constraint(equalTo: resultContainer.trailingAnchor),
            separatorHBar.heightAnchor.constraint(equalToConstant: 1),
            
            separatorVBar.topAnchor.constraint(equalTo: separatorHBar.bottomAnchor),
            separatorVBar.centerXAnchor.constraint(equalTo: resultContainer.centerXAnchor),
            separatorVBar.widthAnchor.constraint(equalToConstant: 1),
            separatorVBar.bottomAnchor.constraint(equalTo: resultContainer.bottomAnchor, constant: -10),
            
            manUtdGoalsView.topAnchor.constraint(equalTo: separatorHBar.bottomAnchor, constant: 5),
            manUtdGoalsView.trailingAnchor.constraint(equalTo: separatorVBar.leadingAnchor, constant: -15),
            manUtdGoalsView.bottomAnchor.constraint(equalTo: resultContainer.bottomAnchor, constant: -10),
            manUtdGoalsView.widthAnchor.constraint(equalTo: resultContainer.widthAnchor, multiplier: 0.5, constant: -20),
            
            enemyGoalsView.topAnchor.constraint(equalTo: separatorHBar.bottomAnchor, constant: 5),
            enemyGoalsView.leadingAnchor.constraint(equalTo: separatorVBar.trailingAnchor, constant: 15),
            enemyGoalsView.bottomAnchor.constraint(equalTo: manUtdGoalsView.bottomAnchor),
            enemyGoalsView.widthAnchor.constraint(equalTo: resultContainer.widthAnchor, multiplier: 0.5, constant: -20),
            
            highlightTitleLabel.topAnchor.constraint(equalTo: resultContainer.bottomAnchor, constant: 30),
            highlightTitleLabel.leadingAnchor.constraint(equalTo: resultTitleLabel.leadingAnchor),
            
            highlightContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            highlightContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.26),
            highlightContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30),
            highlightContainerView.topAnchor.constraint(equalTo: highlightTitleLabel.bottomAnchor, constant: 10),
            
            highlightView.topAnchor.constraint(equalTo: highlightContainerView.topAnchor),
            highlightView.leadingAnchor.constraint(equalTo: highlightContainerView.leadingAnchor),
            highlightView.trailingAnchor.constraint(equalTo: highlightContainerView.trailingAnchor),
            highlightView.bottomAnchor.constraint(equalTo: highlightContainerView.bottomAnchor),
        ])
    }
}
