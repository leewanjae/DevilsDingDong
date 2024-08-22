//
//  TodayMatchViewController.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 8/21/24.
//

import UIKit

class TodayMatchViewController: UIViewController {
    private let viewModel = MatchInfoViewModel()
    private var todayMatchView: TodayMatchView?
    var playerDataSource: UICollectionViewDiffableDataSource<Section, Player>?
    var enemyPlayerDataSource: UICollectionViewDiffableDataSource<Section, Player>?
    
    override func loadView() {
        todayMatchView = TodayMatchView(viewModel: viewModel)
        self.view = todayMatchView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        setupCollectionViews()
        setDataSource()
        setSnapShot()

        if let notiData = viewModel.todayMatch.first {
            NotificationManger.shared.setNotification(enemy: notiData.enemy, date: notiData.date, time: notiData.time)
        }
    }

    private func setupNavigationBar() {
        navigationItem.title = "오늘의 경기"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func setupCollectionViews() {
        todayMatchView?.playerCollectionView.register(PlayerListCell.self, forCellWithReuseIdentifier: PlayerListCell.id)
        todayMatchView?.enemyPlayerCollectionView.register(PlayerListCell.self, forCellWithReuseIdentifier: PlayerListCell.id)
    }

    private func setDataSource() {
        guard let todayMatchView = todayMatchView else { return }

        playerDataSource = UICollectionViewDiffableDataSource<Section, Player>(collectionView: todayMatchView.playerCollectionView) { collectionView, indexPath, player in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlayerListCell.id, for: indexPath) as? PlayerListCell else {
                return UICollectionViewCell()
            }
            cell.configure(position: player.position, name: player.name)
            return cell
        }

        enemyPlayerDataSource = UICollectionViewDiffableDataSource<Section, Player>(collectionView: todayMatchView.enemyPlayerCollectionView) { collectionView, indexPath, player in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlayerListCell.id, for: indexPath) as? PlayerListCell else {
                return UICollectionViewCell()
            }
            cell.configure(position: player.position, name: player.name)
            return cell
        }
    }

    private func setSnapShot() {
        guard let todayMatchView = todayMatchView else { return }

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
