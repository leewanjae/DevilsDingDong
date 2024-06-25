//
//  TodayMatchView.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 6/11/24.
//

import UIKit

class TodayMatchView: UIViewController {
    private let viewModel = MatchInfoViewModel()
    private lazy var noMatchLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "경기 일정이 없습니다"
        label.textColor = .gray
        label.textAlignment = .center
        return label
    }()
    private lazy var matchStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var manUtdLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.text = "맨유"
        return label
    }()
    private lazy var manUtdImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "맨유")
        return image
    }()
    private lazy var vsLabel: UILabel = {
        let label = UILabel()
        label.text = "VS"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var enemyImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "맨유")
        return image
    }()
    private lazy var enemyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    private lazy var dateStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var matchDate: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    private lazy var matchTime: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    private lazy var matchTypeStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var matchType: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        return label
    }()
    private lazy var round: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        return label
    }()
    private lazy var stadium: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        return label
    }()
    private lazy var playerTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .bgColor
        if viewModel.todayMatch.first?.enemy != nil {
            setUI()
        } else {
            setNoMatchUI()
        }
    }
}

extension TodayMatchView {
    private func setUI() {
        navigationItem.title = "오늘의 경기"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        matchType.text = viewModel.todayMatch.first?.matchType ?? "프리미어리그"
        round.text = viewModel.todayMatch.first?.round ?? "0R"
        stadium.text = viewModel.todayMatch.first?.stadium ?? "Old Trafford"
        enemyLabel.text = viewModel.todayMatch.first?.enemy ?? "미정"
        matchDate.text = viewModel.todayMatch.first?.date ?? "00년 00월 00일 (E)"
        matchTime.text = viewModel.todayMatch.first?.time ?? "00:00"
        playerTitle.text = "선수 명단"
        addView()
        setAutoLayout()
    }
    
    private func setNoMatchUI() {
        view.addSubview(noMatchLabel)
        NSLayoutConstraint.activate([
            noMatchLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            noMatchLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    private func addView() {
        view.addSubview(matchStackView)
        view.addSubview(stadium)
        view.addSubview(dateStackView)
        view.addSubview(matchTypeStackView)
        view.addSubview(playerTitle)
        
        matchStackView.addArrangedSubview(manUtdLabel)
        matchStackView.addArrangedSubview(manUtdImage)
        matchStackView.addArrangedSubview(vsLabel)
        matchStackView.addArrangedSubview(enemyImage)
        matchStackView.addArrangedSubview(enemyLabel)
        
        dateStackView.addArrangedSubview(matchDate)
        dateStackView.addArrangedSubview(matchTime)
        
        matchTypeStackView.addArrangedSubview(matchType)
        matchTypeStackView.addArrangedSubview(round)
    }
    
    private func setAutoLayout() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            matchStackView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20),
            matchStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            matchTypeStackView.topAnchor.constraint(equalTo: matchStackView.bottomAnchor, constant: 10),
            matchTypeStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            stadium.topAnchor.constraint(equalTo: matchTypeStackView.bottomAnchor, constant: 5),
            stadium.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            dateStackView.topAnchor.constraint(equalTo: stadium.bottomAnchor, constant: 20),
            dateStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            playerTitle.topAnchor.constraint(equalTo: dateStackView.bottomAnchor, constant: 40),
            playerTitle.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20)
        ])
    }
}
