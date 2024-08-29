//
//  MatchInfoCell.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 5/12/24.
//

import UIKit
import SnapKit

class MatchInfoCell: UITableViewCell {
    static let id = "MatchInfoCell"
    
    private lazy var container: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.layer.shadowOpacity = 0.1
        return view
    }()
    // matchDateContainer에 MatchDate, matchTime 넣기
    private lazy var matchDateContainer = createContainer(color: .accentColor!, corner:  [.layerMinXMinYCorner, .layerMaxXMinYCorner])
    private lazy var matchDate = createLabel(font: 15, weight: .semibold, color: .white)
    private lazy var matchTime = createLabel(font: 15, weight: .medium, color: .white)
    
    // matchInfoContainer에 stadium, manutd, enemy, round 들어가기
    private lazy var matchInfoContainer = createContainer(color: .white, corner: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner])
    private lazy var stadium = createDynamicLabel(size: 10, weight: .regular, color: .subTextColor!)
    private lazy var manuStackView = createStackView()
    private lazy var manuLogo = createImage()
    private lazy var manutd = createLabel(font: 16, weight: .medium, text: "맨유")
    private lazy var state = createLabel(font: 13, weight: .regular, color: .subTextColor ?? .black)
    private lazy var enemyStackView = createStackView()
    private lazy var enemyLogo = createImage()
    private lazy var enemy: UILabel = createDynamicLabel(size: 16, weight: .medium)
    private lazy var round = createLabel(font: 12, weight: .medium, color: .subTextColor ?? .black)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.backgroundColor = .bgColor
        setUI()
        setAutoLayout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UI Methods
extension MatchInfoCell {
    private func setUI() {
        contentView.addSubview(container)
        let containerItems = [matchDateContainer, matchInfoContainer]
        containerItems.forEach { container.addSubview($0) }
            
        let matchDateContainerItems = [matchDate, matchTime]
        matchDateContainerItems.forEach { matchDateContainer.addSubview($0) }
        
        let matchInfoContainerItems = [stadium, manuStackView, state, enemyStackView, round]
        matchInfoContainerItems.forEach { matchInfoContainer.addSubview($0) }

        let manuStackViewItems = [manuLogo, manutd]
        manuStackViewItems.forEach { manuStackView.addArrangedSubview($0) }
        manuStackView.addArrangedSubview(manuLogo)
        manuStackView.addArrangedSubview(manutd)
        
        let enemyStackViewItems = [enemyLogo, enemy]
        enemyStackViewItems.forEach { enemyStackView.addArrangedSubview($0) }
    }
    
    private func setAutoLayout() {
        container.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        matchDateContainer.snp.makeConstraints {
            $0.top.equalTo(container.snp.top)
            $0.leading.equalTo(container.snp.leading)
            $0.trailing.equalTo(container.snp.trailing)
            $0.height.equalTo(container.snp.height).multipliedBy(0.25)
        }

        matchDate.snp.makeConstraints {
            $0.leading.equalTo(contentView.snp.leading).offset(15)
            $0.centerY.equalTo(matchDateContainer.snp.centerY)
        }

        matchTime.snp.makeConstraints {
            $0.leading.equalTo(matchDate.snp.trailing).offset(10)
            $0.centerY.equalTo(matchDateContainer.snp.centerY)
        }

        matchInfoContainer.snp.makeConstraints {
            $0.top.equalTo(matchDateContainer.snp.bottom)
            $0.leading.equalTo(container.snp.leading)
            $0.trailing.equalTo(container.snp.trailing)
            $0.bottom.equalTo(container.snp.bottom)
            $0.height.equalTo(container.snp.height).multipliedBy(0.75)
        }

        stadium.snp.makeConstraints {
            $0.leading.equalTo(matchDate.snp.leading)
            $0.width.equalTo(65)
            $0.centerY.equalTo(matchInfoContainer.snp.centerY)
        }

        state.snp.makeConstraints {
            $0.centerX.equalTo(matchInfoContainer.snp.centerX)
            $0.centerY.equalTo(matchInfoContainer.snp.centerY)
        }
        if UIDevice.current.userInterfaceIdiom == .phone {
            manuStackView.snp.makeConstraints {
                $0.trailing.equalTo(state.snp.leading).offset(-20)
                $0.width.equalTo(50)
                $0.bottom.equalTo(matchInfoContainer.snp.bottom).offset(-20)
                $0.top.equalTo(matchDateContainer.snp.bottom).offset(20)
            }
        } else {
            manuStackView.snp.makeConstraints {
                $0.trailing.equalTo(state.snp.leading).offset(-50)
                $0.width.equalTo(80)
                $0.bottom.equalTo(matchInfoContainer.snp.bottom).offset(-20)
                $0.top.equalTo(matchDateContainer.snp.bottom).offset(20)
            }
        }
        
        if UIDevice.current.userInterfaceIdiom == .phone {
            enemyStackView.snp.makeConstraints {
                $0.leading.equalTo(state.snp.trailing).offset(50)
                $0.width.equalTo(50)
                $0.top.equalTo(manuStackView.snp.top)
                $0.bottom.equalTo(manuStackView.snp.bottom)
            }
        } else {
            enemyStackView.snp.makeConstraints {
                $0.leading.equalTo(state.snp.trailing).offset(50)
                $0.width.equalTo(80)
                $0.top.equalTo(manuStackView.snp.top)
                $0.bottom.equalTo(manuStackView.snp.bottom)
            }
        }

        round.snp.makeConstraints {
            $0.trailing.equalTo(contentView.snp.trailing).offset(-15)
            $0.centerY.equalTo(state.snp.centerY)
        }
    }
    
    func configure(matchDate: String, matchTime:String, stadium: String, state:String, enemy: String, round: String) {
        self.matchDate.text = matchDate
        self.matchTime.text = matchTime
        self.stadium.text = stadium
        self.state.text = state
        self.enemy.text = enemy
        self.round.text = round
        self.enemyLogo.image = UIImage(named: enemy)
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
    
    private func createStackView() -> UIStackView {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 0
        view.alignment = .center
        view.distribution = .fillEqually
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    private func createLabel(font: CGFloat, weight: UIFont.Weight, color: UIColor = .black, text: String = "" ) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = color
        return label
    }
    
    private func createImage(url: String = "맨유") -> UIImageView {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: url)
        return image
    }
    
    private func createDynamicLabel(size: CGFloat, weight: UIFont.Weight, color: UIColor = .black) -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.numberOfLines = 4
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textColor = color
        return label
    }
    private func createContainer(color: UIColor, corner: CACornerMask) -> UIView {
        let view = UIView()
        view.backgroundColor = color
        view.layer.maskedCorners = corner
        view.layer.cornerRadius = 10
        return view
    }
}
