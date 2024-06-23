//
//  TodayMatchView.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 6/11/24.
//

import UIKit

class TodayMatchView: UIViewController {
    let viewModel = MatchInfoViewModel()
    lazy var noMatchLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "경기 일정이 없습니다"
        label.textColor = .gray
        label.textAlignment = .center
        return label
    }()
    lazy var MatchStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var manUtdLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24)
        label.text = "맨유"
        return label
    }()
    lazy var manUtdImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "맨유")
        return image
    }()
    lazy var vsLabel: UILabel = {
        let label = UILabel()
        label.text = "VS"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var enemyImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "맨유")
        return image
    }()
    lazy var enemyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .bgColor
        if viewModel.todayMatch.first?.date != nil {
            setUI()
        } else {
            setNoMatchUI()
        }
    }
    
    func setUI() {
        navigationItem.title = "오늘의 경기"
        enemyLabel.text = viewModel.todayMatch.first?.enemy ?? "없음"
        addView()
        setAutoLayout()
    }
    
    func setNoMatchUI() {
        view.addSubview(noMatchLabel)
        NSLayoutConstraint.activate([
            noMatchLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            noMatchLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    func addView() {
        view.addSubview(MatchStackView)
        
        MatchStackView.addArrangedSubview(manUtdLabel)
        MatchStackView.addArrangedSubview(manUtdImage)
        MatchStackView.addArrangedSubview(vsLabel)
        MatchStackView.addArrangedSubview(enemyImage)
        MatchStackView.addArrangedSubview(enemyLabel)
    }
    
    func setAutoLayout() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            MatchStackView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 150),
            MatchStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
    }
}
