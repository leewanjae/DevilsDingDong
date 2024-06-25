//
//  MatchInfoCell.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 5/12/24.
//

import UIKit

class MatchInfoCell: UITableViewCell {
    static let id = "MatchInfoCell"
    
    lazy var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.layer.shadowOpacity = 0.2
        return view
    }()
    
    // matchDateContainer에 MatchDate, matchTime 넣기
    lazy var matchDateContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .accentColor
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy var matchDate: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    lazy var matchTime: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    // matchInfoContainer에 stadium, manutd, enemy, round 들어가기
    lazy var matchInfoContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        view.layer.cornerRadius = 10
        
        return view
    }()
    
    
    lazy var stadium: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = UIColor.subTextColor
        label.numberOfLines = 0
        return label
    }()
    
    lazy var manutd: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.text = Teams.manUtd
        return label
    }()
    
    lazy var state: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = UIColor.subTextColor
        return label
    }()
    
    lazy var enemy: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    lazy var round: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = UIColor.subTextColor
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.backgroundColor = .bgColor
        setUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MatchInfoCell {
    private func setUI() {
        addView()
        setAutoLayout()
    }
    
    private func addView() {
        contentView.addSubview(container)
        container.addSubview(matchDateContainer)
        container.addSubview(matchInfoContainer)
        
        matchDateContainer.addSubview(matchDate)
        matchDateContainer.addSubview(matchTime)
        
        matchInfoContainer.addSubview(stadium)
        matchInfoContainer.addSubview(manutd)
        matchInfoContainer.addSubview(state)
        matchInfoContainer.addSubview(enemy)
        matchInfoContainer.addSubview(round)
    }
    
    private func setAutoLayout() {
        NSLayoutConstraint.activate([
            
            container.topAnchor.constraint(equalTo: contentView.topAnchor),
            container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            container.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            
            matchDateContainer.topAnchor.constraint(equalTo: container.topAnchor),
            matchDateContainer.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            matchDateContainer.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            matchDateContainer.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: 0.3),
            
            matchDate.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            matchDate.centerYAnchor.constraint(equalTo: matchDateContainer.centerYAnchor),
            matchTime.leadingAnchor.constraint(equalTo: matchDate.trailingAnchor, constant: 10),
            matchTime.centerYAnchor.constraint(equalTo: matchDateContainer.centerYAnchor),
            
            matchInfoContainer.topAnchor.constraint(equalTo: matchDateContainer.bottomAnchor),
            matchInfoContainer.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            matchInfoContainer.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            matchInfoContainer.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            matchInfoContainer.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: 0.7),
            
            // matchInfoContainer에 matchTime, stadium, manutd, enemy, round 들어가기
            stadium.leadingAnchor.constraint(equalTo: matchDate.leadingAnchor),
            stadium.widthAnchor.constraint(equalToConstant: 70),
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
    
    func configure(matchDate: String, matchTime:String, stadium: String, state:String, enemy: String, round: String) {
        self.matchDate.text = matchDate
        self.matchTime.text = matchTime
        self.stadium.text = stadium
        self.state.text = state
        self.enemy.text = enemy
        self.round.text = round
        
        if state == "종료" {
            self.state.textColor = .subTextColor?.withAlphaComponent(0.7)
        } else if state == "예정" {
            self.state.textColor = .accent.withAlphaComponent(0.7)
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yy년 MM월 dd일 (E)"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        
        guard let matchDateParsed = dateFormatter.date(from: matchDate) else {
            print("Date parsing failed for matchDate: \(matchDate)")
            return
        }
        
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        let matchDateWithoutTime = calendar.startOfDay(for: matchDateParsed)
        
        if matchDateWithoutTime > today {
            matchDateContainer.backgroundColor = .blue
        } else if matchDateWithoutTime == today {
            matchDateContainer.backgroundColor = .accentColor
        } else {
            matchDateContainer.backgroundColor = .lightGray
        }
    }
}
