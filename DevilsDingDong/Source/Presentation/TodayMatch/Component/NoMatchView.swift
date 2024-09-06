//
//  NoMatchView.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 8/21/24.
//

import UIKit
import SnapKit

class NoMatchView: UIView {

    // MARK: - Properties

    private var characterImageView = UIImageView()
    private var noMatchLabel = UILabel()
    
    // MARK: - Life Cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI

    private func setUI() {
        characterImageView = createImage(url: "ch")
        noMatchLabel = createLabel(size: 17, weight: .regular, text: "경기 일정이 없습니다", color: .gray)
        addSubview(characterImageView)
        addSubview(noMatchLabel)
    }
    
    private func setAutoLayout() {
        characterImageView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.height.equalTo(200)
        }
        
        noMatchLabel.snp.makeConstraints {
            $0.top.equalTo(characterImageView.snp.bottom).offset(50)
            $0.centerX.equalTo(characterImageView.snp.centerX)
        }
    }
}

extension NoMatchView {
    private func createLabel(size: CGFloat, weight: UIFont.Weight, text: String, color: UIColor = UIColor.black) -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: size, weight: weight)
        label.text = text
        label.textColor = color
        label.textAlignment = .center
        return label
    }
    
    private func createImage(url: String) -> UIImageView {
        let image = UIImageView()
        image.image = UIImage(named: url)
        image.contentMode = .scaleAspectFit
        return image
    }
}
