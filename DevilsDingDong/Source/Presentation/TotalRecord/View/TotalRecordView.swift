//
//  TotalRecordView.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 6/11/24.
//

import UIKit
import SnapKit

class TotalRecordView: UIView {
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private lazy var scoreTitleStackView: UIStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure
extension TotalRecordView {
    private func setUI() {
        backgroundColor = .bgColor
        
        collectionView.backgroundColor = .white
        collectionView.layer.cornerRadius = 12
        collectionView.showsVerticalScrollIndicator = false
        collectionView.layer.shadowOpacity = 0.1
        
        let titles = ["순위", "팀", "경기", "승", "무", "패", "승점", "득실"]
        let labels = titles.map { createTitleLabel(text: $0) }
        scoreTitleStackView = UIStackView(arrangedSubviews: labels)
        scoreTitleStackView.axis = .horizontal
        scoreTitleStackView.alignment = .fill
        scoreTitleStackView.distribution = .fillEqually
        
        self.addSubview(scoreTitleStackView)
        self.addSubview(collectionView)
    }
    
    private func setAutoLayout() {
        let safeArea = self.safeAreaLayoutGuide
        scoreTitleStackView.snp.makeConstraints {
            $0.top.equalTo(safeArea.snp.top).offset(20)
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(scoreTitleStackView.snp.bottom).offset(10)
            $0.bottom.equalTo(safeArea.snp.bottom)
            $0.leading.trailing.equalTo(scoreTitleStackView)
        }
    }
}

// MARK: - Create UI
extension TotalRecordView {
    private func createTitleLabel(text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.text = text
        return label
    }
}
