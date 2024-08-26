//
//  MatchInfoDetailViewController.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 8/22/24.
//

import UIKit

class MatchInfoDetailViewController: UIViewController {
    private var matchInfo: MatchInfo
    
    init(matchInfo: MatchInfo) {
        self.matchInfo = matchInfo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let matchInfoDetailView = MatchInfoDetailView(matchInfo: matchInfo)
        self.view = matchInfoDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
