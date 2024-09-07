//
//  MatchInfoDetailViewController.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 8/22/24.
//

import UIKit

class MatchInfoDetailViewController: UIViewController {
    
    // MARK: - Properties
    
    private var matchInfo: MatchInfo
    
    // MARK: - Components
    
    private var matchInfoDetailView = MatchInfoDetailView()
    
    // MARK: - Life Cycle
    
    init(matchInfo: MatchInfo) {
        self.matchInfo = matchInfo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = matchInfoDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataBinding(matchInfo: matchInfo)
    }
    
    // MARK: - bind
    
    private func dataBinding(matchInfo: MatchInfo) {
        // MatchResultView 설정
        matchInfoDetailView.matchResultView.matchType.text = matchInfo.matchType
        matchInfoDetailView.matchResultView.matchDate.text = matchInfo.date
        matchInfoDetailView.matchResultView.score.text = matchInfo.score ?? "N/A"
        
        if let enemyLabel = matchInfoDetailView.matchResultView.enemyStack.arrangedSubviews.compactMap({ $0 as? UILabel }).first {
            enemyLabel.text = matchInfo.enemy
        }
        
        if let enemyImageView = matchInfoDetailView.matchResultView.enemyStack.arrangedSubviews.compactMap({ $0 as? UIImageView }).first {
            enemyImageView.image = UIImage(named: matchInfo.enemy)
        }
        
        let manUtdGoalsView = matchInfoDetailView.matchResultView.createGoalsView(goals: matchInfo.manUtdGoal, textAlign: .right)
        matchInfoDetailView.matchResultView.manUtdGoalsView.addSubview(manUtdGoalsView)
        manUtdGoalsView.snp.makeConstraints { $0.edges.equalToSuperview() }
        
        let enemyGoalsView = matchInfoDetailView.matchResultView.createGoalsView(goals: matchInfo.enemyGoal, textAlign: .left)
        matchInfoDetailView.matchResultView.enemyGoalsView.addSubview(enemyGoalsView)
        enemyGoalsView.snp.makeConstraints { $0.edges.equalToSuperview() }
        
        
        // Highlight 설정
        matchInfoDetailView.highlightTitleLabel.text = "하이라이트"
        
        if let highlightURLString = matchInfo.highlight,
           let url = URL(string: highlightURLString) {
            matchInfoDetailView.highlightView.load(URLRequest(url: url))
        } else {
            matchInfoDetailView.highlightView.isHidden = true // 웹뷰를 숨김 처리
        }
    }
}
