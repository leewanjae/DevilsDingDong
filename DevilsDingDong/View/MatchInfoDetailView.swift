//
//  MatchInfoDetailView.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 5/8/24.
//

import UIKit
import WebKit

class MatchInfoDetailView: UIViewController {
    var matchInfo: MatchInfo?
    
    init(matchInfo: MatchInfo) {
        self.matchInfo = matchInfo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    lazy var resultTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "경기결과"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    lazy var resultContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .placeholderText
        view.layer.cornerRadius = 20
        view.layer.borderColor = CGColor(red: 0.765, green: 0.2, blue: 0.18, alpha: 0)
        return view
    }()
    lazy var matchType: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = matchInfo?.matchType
        label.textColor = .white
        return label
    }()
    lazy var matchDate: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = matchInfo?.date
        label.textColor = .white
        return label
    }()
    lazy var scoreBox: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var manUtd: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var manUtdLogo: UIImageView = {
        let image = UIImageView(image: UIImage(named: "맨유"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    lazy var manUtdLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "맨유"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .white
        return label
    }()
    lazy var score: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = matchInfo?.score
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        return label
    }()
    lazy var enemy: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var enemyLogo: UIImageView = {
        let image = UIImageView(image: UIImage(named: "맨유"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    lazy var enemyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = matchInfo?.enemy
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    lazy var separatorHBar: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        view.layer.borderWidth = 1
        return view
    }()
    lazy var separatorVBar: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .darkGray.withAlphaComponent(0)
        return view
    }()
    lazy var manUtdGoalsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 4
        if let goals = matchInfo?.manUtdGoal {
            for goal in goals {
                let label = UILabel()
                label.translatesAutoresizingMaskIntoConstraints = false
                label.text = goal
                label.font = UIFont.systemFont(ofSize: 8, weight: .semibold)
                stackView.addArrangedSubview(label)
            }
        }
        return stackView
    }()
    lazy var enemyGoalsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 4
        if let goals = matchInfo?.enemyGoal {
            for goal in goals {
                let label = UILabel()
                label.translatesAutoresizingMaskIntoConstraints = false
                label.text = goal
                label.font = UIFont.systemFont(ofSize: 8, weight: .semibold)
                stackView.addArrangedSubview(label)
            }
        }
        return stackView
    }()
    lazy var enemyGoal: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 8, weight: .semibold)
        return label
    }()
    lazy var highlightTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "하이라이트"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    lazy var highlightView: WKWebView = {
        let webView = WKWebView()
        webView.load(URLRequest(url: URL(string: matchInfo?.highlight ?? "")!))
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI() {
        view.backgroundColor = UIColor.bg
        AddView()
        setAutoLayout()
    }
    
    private func AddView() {
        view.addSubview(resultTitleLabel)
        view.addSubview(resultContainer)
        view.addSubview(highlightTitleLabel)
        view.addSubview(highlightView)
        
        resultContainer.addSubview(matchType)
        resultContainer.addSubview(matchDate)
        resultContainer.addSubview(scoreBox)
        resultContainer.addSubview(separatorHBar)
        resultContainer.addSubview(separatorVBar)
        resultContainer.addSubview(manUtdGoalsStackView)
        resultContainer.addSubview(enemyGoalsStackView)
        
        scoreBox.addSubview(manUtdLabel)
        scoreBox.addSubview(manUtdLogo)
        scoreBox.addSubview(score)
        scoreBox.addSubview(enemyLogo)
        scoreBox.addSubview(enemyLabel)
    }
    
    private func setAutoLayout() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            resultTitleLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 30),
            resultTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            resultContainer.topAnchor.constraint(equalTo: resultTitleLabel.topAnchor, constant: 30),
            resultContainer.leadingAnchor.constraint(equalTo: resultTitleLabel.leadingAnchor),
            resultContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            resultContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25),
            
            matchType.centerXAnchor.constraint(equalTo: resultContainer.centerXAnchor),
            matchType.topAnchor.constraint(equalTo: resultContainer.topAnchor, constant: 10),
            
            matchDate.centerXAnchor.constraint(equalTo: resultContainer.centerXAnchor),
            matchDate.topAnchor.constraint(equalTo: matchType.bottomAnchor, constant: 10),
            
            scoreBox.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scoreBox.topAnchor.constraint(equalTo: matchDate.bottomAnchor, constant: 25),
            scoreBox.heightAnchor.constraint(equalTo: resultContainer.heightAnchor, multiplier: 0.2),
            
            manUtdLabel.trailingAnchor.constraint(equalTo: manUtdLogo.leadingAnchor, constant: -5),
            enemyLabel.leadingAnchor.constraint(equalTo: enemyLogo.trailingAnchor, constant: 5),
            manUtdLogo.trailingAnchor.constraint(equalTo: score.leadingAnchor, constant: -5),
            manUtdLogo.centerYAnchor.constraint(equalTo: score.centerYAnchor),
            enemyLogo.leadingAnchor.constraint(equalTo: score.trailingAnchor, constant: 5),
            enemyLogo.centerYAnchor.constraint(equalTo: score.centerYAnchor),
            score.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            separatorHBar.topAnchor.constraint(equalTo: scoreBox.bottomAnchor , constant: 20),
            separatorHBar.leadingAnchor.constraint(equalTo: resultContainer.leadingAnchor),
            separatorHBar.trailingAnchor.constraint(equalTo: resultContainer.trailingAnchor),
            separatorHBar.heightAnchor.constraint(equalToConstant: 1),
            
            separatorVBar.topAnchor.constraint(equalTo: separatorHBar.bottomAnchor),
            separatorVBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            separatorVBar.widthAnchor.constraint(equalToConstant: 1),
            separatorVBar.bottomAnchor.constraint(equalTo: resultContainer.bottomAnchor),
            
            manUtdGoalsStackView.topAnchor.constraint(equalTo: separatorHBar.bottomAnchor, constant: 5),
            manUtdGoalsStackView.trailingAnchor.constraint(equalTo: separatorVBar.leadingAnchor, constant: -15),
            
            enemyGoalsStackView.topAnchor.constraint(equalTo: manUtdGoalsStackView.topAnchor),
            enemyGoalsStackView.leadingAnchor.constraint(equalTo: separatorVBar.trailingAnchor, constant: 15),
            
            highlightTitleLabel.topAnchor.constraint(equalTo: resultContainer.bottomAnchor, constant: 30),
            highlightTitleLabel.leadingAnchor.constraint(equalTo: resultTitleLabel.leadingAnchor),
            
            highlightView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            highlightView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.26),
            highlightView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40),
            highlightView.topAnchor.constraint(equalTo: highlightTitleLabel.bottomAnchor, constant: 10),
        ])
    }
}
