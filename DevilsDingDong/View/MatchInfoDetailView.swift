//
//  MatchInfoDetailView.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 5/8/24.
//

import UIKit

class MatchInfoDetailView: UIViewController {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "MatchInfoDeatilView"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        setUI()
    }
    
    func setUI() {
        view.backgroundColor = UIColor.bg
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
