//
//  PlayerListCell.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 6/25/24.
//

import UIKit

class PlayerListCell: UICollectionViewCell {
    static let id = "PlayerListCell"
    private lazy var playerStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.translatesAutoresizingMaskIntoConstraints = false
        view.distribution = .fill
        view.spacing = 10
        return view
    }()
    private lazy var playerPosition: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    private lazy var playerName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PlayerListCell {
    private func setUI() {
        addSubview(playerStackView)
        
        playerStackView.addArrangedSubview(playerPosition)
        playerStackView.addArrangedSubview(playerName)
        
        setAutoLayout()
    }
    
    private func setAutoLayout() {
        NSLayoutConstraint.activate([
            playerName.widthAnchor.constraint(equalToConstant: 100),
            
            playerStackView.topAnchor.constraint(equalTo: topAnchor),
            playerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            playerStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configure(position: String, name: String) {
            playerPosition.text = position
            playerName.text = name
        }
}
