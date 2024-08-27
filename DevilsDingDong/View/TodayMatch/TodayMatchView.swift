//
//  TodayMatchView.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 6/11/24.
//

import UIKit
import SnapKit

struct Section: Hashable {
    let id: String
}

class TodayMatchView: UIView {
    private let viewModel: MatchInfoViewModel

    private let noMatchView = NoMatchView()
    private lazy var matchStackView = MatchStackView(
        teamName: "맨유",
        enemyName: viewModel.todayMatch.first?.enemy ?? "미정"
    )
    private lazy var todayMatchInfoView = TodayMatchInfoView(
        date: viewModel.todayMatch.first?.date ?? "00년 00월 00일 (E)",
        time: viewModel.todayMatch.first?.time ?? "00:00",
        matchType: viewModel.todayMatch.first?.matchType ?? "프리미어리그",
        round: viewModel.todayMatch.first?.round ?? "0R",
        stadium: viewModel.todayMatch.first?.stadium ?? "Old Trafford"
    )
    
    private lazy var playerTitle = UILabel()
    private lazy var manUtdPlayerLabel = UILabel()
    private lazy var enemyPlayerLabel = UILabel()

    lazy var playerCollectionView = createCollectionView()
    lazy var enemyPlayerCollectionView = createCollectionView()

    init(viewModel: MatchInfoViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setUI()
        setAutoLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUI() {
        backgroundColor = .bgColor
        playerTitle = createLabel(size: 20, weight: .bold, text:"선수 명단")
        manUtdPlayerLabel = createLabel(size: 16, weight: .semibold, text:"맨유")
        enemyPlayerLabel = createLabel(size: 16, weight: .semibold, text:viewModel.todayMatch.first?.enemy ?? "상대편")
        
        if viewModel.todayMatch.isEmpty {
            addSubview(noMatchView)
        } else {
            addSubview(matchStackView)
            addSubview(todayMatchInfoView)
            
            addSubview(playerTitle)
            addSubview(manUtdPlayerLabel)
            addSubview(enemyPlayerLabel)
            
            addSubview(playerCollectionView)
            addSubview(enemyPlayerCollectionView)
        }
    }

    private func setAutoLayout() {
        let safeArea = self.safeAreaLayoutGuide

        if viewModel.todayMatch.isEmpty {
            noMatchView.snp.makeConstraints {
                $0.centerX.centerY.equalToSuperview()
                $0.width.height.equalTo(200)
            }
        } else {
            matchStackView.snp.makeConstraints {
                $0.top.equalTo(safeArea).offset(10)
                $0.centerX.equalToSuperview()
            }

            todayMatchInfoView.snp.makeConstraints {
                $0.top.equalTo(matchStackView.snp.bottom).offset(10)
                $0.centerX.equalToSuperview()
            }
            
            playerTitle.snp.makeConstraints {
                $0.top.equalTo(todayMatchInfoView.snp.bottom).offset(20)
                $0.leading.trailing.equalToSuperview().offset(14)
            }
            
            manUtdPlayerLabel.snp.makeConstraints {
                $0.top.equalTo(playerTitle.snp.bottom).offset(20)
                $0.leading.trailing.equalToSuperview().offset(14)
            }
            
            playerCollectionView.snp.makeConstraints {
                $0.top.equalTo(manUtdPlayerLabel.snp.bottom).offset(20)
                $0.leading.trailing.equalToSuperview().offset(14)
                $0.height.equalToSuperview().multipliedBy(0.1)
            }

            enemyPlayerLabel.snp.makeConstraints {
                $0.top.equalTo(playerCollectionView.snp.bottom).offset(20)
                $0.leading.trailing.equalToSuperview().offset(14)
            }
            
            enemyPlayerCollectionView.snp.makeConstraints {
                $0.top.equalTo(enemyPlayerLabel.snp.bottom).offset(20)
                $0.leading.trailing.equalToSuperview().offset(14)
                $0.height.equalToSuperview().multipliedBy(0.1)
                $0.bottom.equalTo(safeArea.snp.bottom)
            }
        }
    }
    
    func createCollectionView() -> UICollectionView {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.backgroundColor = .clear
        return collectionView
    }

    private func createLayout() -> UICollectionViewCompositionalLayout {
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 20

        return UICollectionViewCompositionalLayout(sectionProvider: { sectionIndex, _ in
            switch sectionIndex {
            case 0:
                return self.createPlayerListSection()
            case 1:
                return self.createPlayerListSection()
            default:
                return nil
            }
        }, configuration: config)
    }

    private func createPlayerListSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/3))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 5, leading: 5, bottom: 5, trailing: 5)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2.2), heightDimension: .fractionalHeight(1))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }
    
    private func createLabel(size: CGFloat, weight: UIFont.Weight, text: String) -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: size, weight: weight)
        label.text = text
        label.textColor = .black
        return label
    }
}
