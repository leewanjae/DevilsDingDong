//
//  PlayerListCell.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 6/25/24.
//

import UIKit

class PlayerListCell: UICollectionViewCell {
    static let id = "PlayerListCell"
    private lazy var playerImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    private lazy var playerStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.translatesAutoresizingMaskIntoConstraints = false
        view.spacing = 10
        view.distribution = .fillProportionally
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
        addSubview(playerImage)
        addSubview(playerStackView)
        
        playerStackView.addArrangedSubview(playerPosition)
        playerStackView.addArrangedSubview(playerName)
        
        setAutoLayout()
    }
    
    private func setAutoLayout() {
        NSLayoutConstraint.activate([
            playerImage.topAnchor.constraint(equalTo: topAnchor),
            playerImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            playerImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            playerImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8),
            
            playerStackView.topAnchor.constraint(equalTo: playerImage.bottomAnchor),
            playerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            playerStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            playerStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configure(imageURL: String, position: String, name: String) {
            playerPosition.text = position
            playerName.text = name
            
            if let url = URL(string: imageURL) {
                DispatchQueue.global().async { [weak self] in
                    guard let self = self else { return }
                    do {
                        let data = try Data(contentsOf: url)
                        if let image = UIImage(data: data) {
                            DispatchQueue.main.async {
                                self.playerImage.image = image
                            }
                        }
                    } catch {
                        print("Error loading image from URL: \(error)")
                    }
                }
            } else {
                playerImage.image = nil
            }
        }
}
