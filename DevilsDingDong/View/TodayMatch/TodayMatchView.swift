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

class TodayMatchView: UIViewController {
    private let viewModel = MatchInfoViewModel()
    private lazy var character = createImage(url: "ch")
    private var playerDataSource: UICollectionViewDiffableDataSource<Section, Player>?
    private var enemyPlayerDataSource: UICollectionViewDiffableDataSource<Section, Player>?
    private lazy var playerCollectionView = createCollectionView()
    private lazy var enemyPlayerCollectionView = createCollectionView()
    private lazy var noMatchLabel = createLabel(size: 17, weight: .regular, text: "경기 일정이 없습니다", color: .gray)
    private lazy var matchStackView = createStackView()
    private lazy var manLogoStackView = createTeamStackView(teamName: "맨유")
    private lazy var vsLabel = createLabel(size: 17, weight: .regular, text: "VS")
    private lazy var enemyLogoStackView = createTeamStackView(teamName: viewModel.todayMatch.first?.enemy ?? "미정")
    private lazy var dateStackView = createStackView()
    private lazy var matchDate = createLabel(size: 20, weight: .regular, text: viewModel.todayMatch.first?.date ?? "00년 00월 00일 (E)")
    private lazy var matchTime = createLabel(size: 20, weight: .regular, text: viewModel.todayMatch.first?.time ?? "00:00")
    private lazy var matchTypeStackView = createStackView()
    private lazy var matchType = createLabel(size: 18, weight: .regular, text: viewModel.todayMatch.first?.matchType ?? "프리미어리그")
    private lazy var round = createLabel(size: 14, weight: .regular, text:viewModel.todayMatch.first?.round ?? "0R")
    private lazy var stadium = createLabel(size: 14, weight: .regular, text:viewModel.todayMatch.first?.stadium ?? "Old Trafford")
    private lazy var playerTitle = createLabel(size: 20, weight: .bold, text:"선수 명단")
    private lazy var manUtdPlayerLabel = createLabel(size: 16, weight: .semibold, text:"맨유")
    private lazy var enemyPlayerLabel = createLabel(size: 16, weight: .semibold, text:viewModel.todayMatch.first?.enemy ?? "상대편")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .bgColor
        
        navigationItem.title = "오늘의 경기"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        
        playerCollectionView.register(PlayerListCell.self, forCellWithReuseIdentifier: PlayerListCell.id)
        enemyPlayerCollectionView.register(PlayerListCell.self, forCellWithReuseIdentifier: PlayerListCell.id)
        playerCollectionView.setCollectionViewLayout(createLayout(), animated: true)
        enemyPlayerCollectionView.setCollectionViewLayout(createLayout(), animated: true)
        setDataSource()
        setSnapShot()
        
        setUI()
        setAutoLayout()
        
        if viewModel.todayMatch.isEmpty != true {
            if let notiData = viewModel.todayMatch.first {
                NotificationManger.shared.setNotification(enemy: notiData.enemy, date: notiData.date, time: notiData.time)
            } else { return }
        }
    }
}

// MARK: - UI Methods
extension TodayMatchView {
    private func setUI() {
        if viewModel.todayMatch.isEmpty {
            let viewItems = [character, noMatchLabel]
            viewItems.forEach { view.addSubview($0) }
        } else {
            let viewItems = [matchStackView, stadium, dateStackView, matchTypeStackView, playerTitle, playerCollectionView, manUtdPlayerLabel, enemyPlayerLabel, enemyPlayerCollectionView]
            viewItems.forEach { view.addSubview($0) }
            
            let matchStackItems = [manLogoStackView, vsLabel, enemyLogoStackView]
            matchStackItems.forEach { matchStackView.addArrangedSubview($0) }
            
            let matchTypeStackViewItems = [matchType, round]
            matchTypeStackViewItems.forEach { matchTypeStackView.addArrangedSubview($0) }
            
            let dateStackViewItems = [matchDate, matchTime]
            dateStackViewItems.forEach { dateStackView.addArrangedSubview($0) }
            
            [noMatchLabel, matchType, round, stadium].forEach { $0.textColor = .gray }
            noMatchLabel.textAlignment = .center
        }
    }
    
    private func setAutoLayout() {
        if viewModel.todayMatch.isEmpty {
            character.snp.makeConstraints {
                $0.centerX.equalTo(view.snp.centerX)
                $0.centerY.equalTo(view.snp.centerY)
                $0.width.height.equalTo(200)
            }
            
            noMatchLabel.snp.makeConstraints {
                $0.top.equalTo(character.snp.bottom).offset(50)
                $0.centerX.equalTo(character.snp.centerX)
            }
        } else {
            let safeArea = view.safeAreaLayoutGuide
            matchStackView.snp.makeConstraints {
                $0.top.equalTo(safeArea.snp.top).offset(20)
                $0.centerX.equalTo(view.snp.centerX)
            }
            
            matchTypeStackView.snp.makeConstraints {
                $0.top.equalTo(matchStackView.snp.bottom).offset(10)
                $0.centerX.equalTo(view.snp.centerX)
            }
            
            stadium.snp.makeConstraints {
                $0.top.equalTo(matchTypeStackView.snp.bottom).offset(5)
                $0.centerX.equalTo(view.snp.centerX)
                $0.height.equalTo(30)
            }
            
            dateStackView.snp.makeConstraints {
                $0.top.equalTo(stadium.snp.bottom).offset(20)
                $0.centerX.equalTo(view.snp.centerX)
            }
            
            playerTitle.snp.makeConstraints {
                $0.top.equalTo(dateStackView.snp.bottom).offset(40)
                $0.leading.equalToSuperview().offset(20)
            }
            
            manUtdPlayerLabel.snp.makeConstraints {
                $0.top.equalTo(playerTitle.snp.bottom).offset(20)
                $0.leading.equalToSuperview().offset(20)
            }
            
            playerCollectionView.snp.makeConstraints {
                $0.top.equalTo(manUtdPlayerLabel.snp.bottom).offset(10)
                $0.leading.equalTo(manUtdPlayerLabel.snp.leading)
                $0.trailing.equalToSuperview()
                $0.height.equalToSuperview().multipliedBy(0.1)
            }
            
            enemyPlayerLabel.snp.makeConstraints {
                $0.top.equalTo(playerCollectionView.snp.bottom).offset(30)
                $0.leading.equalToSuperview().offset(20)
            }
            
            enemyPlayerCollectionView.snp.makeConstraints {
                $0.top.equalTo(enemyPlayerLabel.snp.bottom).offset(10)
                $0.leading.equalTo(enemyPlayerLabel.snp.leading)
                $0.trailing.equalToSuperview()
                $0.height.equalToSuperview().multipliedBy(0.1)
            }
        }
    }
    
    private func createLabel(size: CGFloat, weight: UIFont.Weight, text: String, color: UIColor = UIColor.black ) -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: size, weight: weight)
        label.text = text
        label.textColor = color
        return label
    }
    
    private func createStackView() -> UIStackView {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 20
        return view
    }
    
    private func createCollectionView() -> UICollectionView {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
        collectionView.backgroundColor = .clear
        return collectionView
    }
    
    private func createImage(url: String) -> UIImageView {
        let image = UIImageView()
        image.image = UIImage(named: url)
        image.contentMode = .scaleAspectFit
        return image
    }
    
    private func createTeamStackView(teamName: String) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10
        
        let logoImageView = createImage(url: teamName)
        let teamLabel = createLabel(size: 24, weight: .semibold, text: teamName)
        logoImageView.snp.makeConstraints {
            $0.width.height.equalTo(70)
        }
        
        stackView.addArrangedSubview(logoImageView)
        stackView.addArrangedSubview(teamLabel)
        
        return stackView
    }
}

// MARK: - CollectionViewCompostionalLayout Methods
extension TodayMatchView {
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
    
    func createPlayerListSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/3))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2.2), heightDimension: .fractionalHeight(1))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }
    
    private func setDataSource() {
        playerDataSource = UICollectionViewDiffableDataSource<Section, Player>(collectionView: playerCollectionView) { collectionView, indexPath, player in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlayerListCell.id, for: indexPath) as? PlayerListCell else {
                return UICollectionViewCell()
            }
            cell.configure(position: player.position, name: player.name)
            return cell
        }
        
        enemyPlayerDataSource = UICollectionViewDiffableDataSource<Section, Player>(collectionView: enemyPlayerCollectionView, cellProvider: { collectionView, indexPath, player in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlayerListCell.id, for: indexPath) as? PlayerListCell else {
                return UICollectionViewCell()
            }
            cell.configure(position: player.position, name: player.name)
            return cell
        })
    }
    
    private func setSnapShot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Player>()
        let playerListSection = Section(id: "PlayerList")
        snapshot.appendSections([playerListSection])
        if let players = viewModel.todayMatch.first?.player {
            snapshot.appendItems(players, toSection: playerListSection)
        }
        playerDataSource?.apply(snapshot, animatingDifferences: true)
        
        var enemySnapshot = NSDiffableDataSourceSnapshot<Section, Player>()
        let enemyPlayerListSection = Section(id: "EnemyPlayerList")
        enemySnapshot.appendSections([enemyPlayerListSection])
        if let players = viewModel.todayMatch.first?.enemyPlayer {
            enemySnapshot.appendItems(players, toSection: enemyPlayerListSection)
        }
        enemyPlayerDataSource?.apply(enemySnapshot, animatingDifferences: true)
    }
}
