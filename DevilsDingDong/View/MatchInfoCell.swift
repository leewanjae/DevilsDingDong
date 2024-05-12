//
//  MatchInfoCell.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 5/12/24.
//

import UIKit

class MatchInfoCell: UITableViewCell {
    static let id = "MatchInfoCell"
    
    // matchDateContainer에 MatchDate 넣기
    lazy var matchDateContianer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .accentColor
        return view
    }()
    
    lazy var matchDate: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    // matchInfoContainer에 matchTime, stadium, manutd, enemy, round 들어가기
    lazy var matchInfoContainer: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.bgColor
        return view
    }()
    
    lazy var matchTime: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        return label
    }()
    
    lazy var stadium: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 8, weight: .regular)
        label.textColor = UIColor.subTextColor
        label.numberOfLines = 0
        return label
    }()
    
    lazy var manutd: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.text = Teams.manUtd
        return label
    }()
    
    lazy var state: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        label.textColor = UIColor.subTextColor
        return label
    }()
    
    lazy var enemy: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        return label
    }()
    
    lazy var round: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 10, weight: .medium)
        label.textColor = UIColor.subTextColor
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        setUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(matchDate: String, matchTime:String, stadium: String, state:String, enemy: String, round: String) {
        self.matchDate.text = matchDate
        self.matchTime.text = matchTime
        self.stadium.text = stadium
        self.state.text = state
        self.enemy.text = enemy
        self.round.text = round
    }
    
    private func setUI() {
        addView()
        setAutoLayout()
    }
    
    private func addView() {
        contentView.addSubview(matchDateContianer)
        matchDateContianer.addSubview(matchDate)
        
        contentView.addSubview(matchInfoContainer)
        matchInfoContainer.addSubview(matchTime)
        matchInfoContainer.addSubview(stadium)
        matchInfoContainer.addSubview(manutd)
        matchInfoContainer.addSubview(state)
        matchInfoContainer.addSubview(enemy)
        matchInfoContainer.addSubview(round)
    }
    
    private func setAutoLayout() {
        NSLayoutConstraint.activate([
            matchDateContianer.topAnchor.constraint(equalTo: contentView.topAnchor),
            matchDateContianer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            matchDateContianer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            matchDateContianer.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.4),
            matchDate.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            matchDate.centerYAnchor.constraint(equalTo: matchDateContianer.centerYAnchor),
            
            matchInfoContainer.topAnchor.constraint(equalTo: matchDateContianer.bottomAnchor),
            matchInfoContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            matchInfoContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            matchInfoContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            matchInfoContainer.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.6),
            
            // matchInfoContainer에 matchTime, stadium, manutd, enemy, round 들어가기
            matchTime.leadingAnchor.constraint(equalTo: matchDate.leadingAnchor),
            matchTime.centerYAnchor.constraint(equalTo: matchInfoContainer.centerYAnchor),
            stadium.leadingAnchor.constraint(equalTo: matchTime.trailingAnchor, constant: 15),
            stadium.widthAnchor.constraint(equalToConstant: 50),
            stadium.centerYAnchor.constraint(equalTo: matchInfoContainer.centerYAnchor),
            state.centerXAnchor.constraint(equalTo: matchInfoContainer.centerXAnchor),
            state.centerYAnchor.constraint(equalTo: matchInfoContainer.centerYAnchor),
            manutd.trailingAnchor.constraint(equalTo: state.leadingAnchor, constant: -20),
            manutd.centerYAnchor.constraint(equalTo: matchInfoContainer.centerYAnchor),
            enemy.leadingAnchor.constraint(equalTo: state.trailingAnchor, constant: 20),
            enemy.centerYAnchor.constraint(equalTo: matchInfoContainer.centerYAnchor),
            round.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            round.centerYAnchor.constraint(equalTo: matchInfoContainer.centerYAnchor),
        ])
    }
}
