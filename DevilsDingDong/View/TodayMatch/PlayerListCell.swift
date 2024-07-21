//
//  PlayerListCell.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 6/25/24.
//

import UIKit
import SnapKit

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
    private lazy var playerPosition = createLabel()
    private lazy var playerName = createLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setAutoLayout()
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
    }
    
    private func setAutoLayout() {
        playerName.snp.makeConstraints {
            $0.width.equalTo(100)
        }
        
        playerStackView.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview()
        }
    }
    
    private func createLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }
    
    func configure(position: String, name: String) {
            playerPosition.text = position
            playerName.text = name
        }
}
