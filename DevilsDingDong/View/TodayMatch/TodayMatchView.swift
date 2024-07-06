//
//  TodayMatchView.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 6/11/24.
//

import UIKit

struct Section: Hashable {
    let id: String
}

class TodayMatchView: UIViewController {
    private let viewModel = MatchInfoViewModel()
    private var playerDataSource: UICollectionViewDiffableDataSource<Section, Player>?
    private var enemyPlayerDataSource: UICollectionViewDiffableDataSource<Section, Player>?
    private let playerCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
       return collectionView
    }()
    private let enemyPlayerCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
       return collectionView
    }()
    private lazy var noMatchLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "경기 일정이 없습니다"
        label.textColor = .gray
        label.textAlignment = .center
        return label
    }()
    private lazy var matchStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var manUtdLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.text = "맨유"
        return label
    }()
    private lazy var vsLabel: UILabel = {
        let label = UILabel()
        label.text = "VS"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var enemyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    private lazy var dateStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var matchDate: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    private lazy var matchTime: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    private lazy var matchTypeStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var matchType: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        return label
    }()
    private lazy var round: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        return label
    }()
    private lazy var stadium: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        return label
    }()
    private lazy var playerTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    private lazy var manUtdPlayerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.text = "맨유"
        return label
    }()
    private lazy var enemyPlayerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .bgColor
        if viewModel.todayMatch.first?.enemy != nil {
            setUI()
        } else {
            setNoMatchUI()
        }
        playerCollectionView.register(PlayerListCell.self, forCellWithReuseIdentifier: PlayerListCell.id)
        enemyPlayerCollectionView.register(PlayerListCell.self, forCellWithReuseIdentifier: PlayerListCell.id)
        setDataSource()
        setSnapShot()
        playerCollectionView.setCollectionViewLayout(createLayout(), animated: true)
        enemyPlayerCollectionView.setCollectionViewLayout(createLayout(), animated: true)
    }
}

extension TodayMatchView {
    private func setUI() {
        navigationItem.title = "오늘의 경기"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        matchType.text = viewModel.todayMatch.first?.matchType ?? "프리미어리그"
        round.text = viewModel.todayMatch.first?.round ?? "0R"
        stadium.text = viewModel.todayMatch.first?.stadium ?? "Old Trafford"
        enemyLabel.text = viewModel.todayMatch.first?.enemy ?? "미정"
        matchDate.text = viewModel.todayMatch.first?.date ?? "00년 00월 00일 (E)"
        matchTime.text = viewModel.todayMatch.first?.time ?? "00:00"
        playerTitle.text = "선수 명단"
        enemyPlayerLabel.text = viewModel.todayMatch.first?.enemy ?? "상대편"
        addView()
        setAutoLayout()
    }
    
    private func setNoMatchUI() {
        view.addSubview(noMatchLabel)
        NSLayoutConstraint.activate([
            noMatchLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            noMatchLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    private func addView() {
        view.addSubview(matchStackView)
        view.addSubview(stadium)
        view.addSubview(dateStackView)
        view.addSubview(matchTypeStackView)
        view.addSubview(playerTitle)
        view.addSubview(playerCollectionView)
        view.addSubview(manUtdPlayerLabel)
        view.addSubview(enemyPlayerLabel)
        view.addSubview(enemyPlayerCollectionView)
        
        matchStackView.addArrangedSubview(manUtdLabel)
        matchStackView.addArrangedSubview(vsLabel)
        matchStackView.addArrangedSubview(enemyLabel)
        
        matchTypeStackView.addArrangedSubview(matchType)
        matchTypeStackView.addArrangedSubview(round)
        
        dateStackView.addArrangedSubview(matchDate)
        dateStackView.addArrangedSubview(matchTime)
    }
    
    private func setAutoLayout() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            matchStackView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20),
            matchStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            matchTypeStackView.topAnchor.constraint(equalTo: matchStackView.bottomAnchor, constant: 10),
            matchTypeStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            stadium.topAnchor.constraint(equalTo: matchTypeStackView.bottomAnchor, constant: 5),
            stadium.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stadium.heightAnchor.constraint(equalToConstant: 30),
            
            dateStackView.topAnchor.constraint(equalTo: stadium.bottomAnchor, constant: 20),
            dateStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            playerTitle.topAnchor.constraint(equalTo: dateStackView.bottomAnchor, constant: 40),
            playerTitle.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            
            manUtdPlayerLabel.topAnchor.constraint(equalTo: playerTitle.bottomAnchor, constant: 20),
            manUtdPlayerLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            
            playerCollectionView.topAnchor.constraint(equalTo: manUtdPlayerLabel.bottomAnchor, constant: 10),
            playerCollectionView.leadingAnchor.constraint(equalTo: manUtdPlayerLabel.leadingAnchor),
            playerCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            playerCollectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
            
            enemyPlayerLabel.topAnchor.constraint(equalTo: playerCollectionView.bottomAnchor, constant: 30),
            enemyPlayerLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            
            enemyPlayerCollectionView.topAnchor.constraint(equalTo: enemyPlayerLabel.bottomAnchor, constant: 10),
            enemyPlayerCollectionView.leadingAnchor.constraint(equalTo: enemyPlayerLabel.leadingAnchor),
            enemyPlayerCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            enemyPlayerCollectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),

        ])
    }
}

extension TodayMatchView {
    private func createLayout() -> UICollectionViewCompositionalLayout {
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 20
        
        return UICollectionViewCompositionalLayout(sectionProvider: {[weak self] sectionIndex, _ in
            switch sectionIndex {
            case 0:
                self?.createPlayerListSection()
            case 1:
                self?.createPlayerListSection()
            default:
                nil
            }
        }, configuration: config)
    }
    
    func createPlayerListSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/3))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2), heightDimension: .fractionalHeight(1))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
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
