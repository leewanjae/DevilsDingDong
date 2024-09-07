//
//  TodayMatchViewController.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 8/21/24.
//

import UIKit
import RxSwift
import RxCocoa

class TodayMatchViewController: UIViewController {

    // MARK: - Components

    private let viewModel = TodayMatchViewModel()
    private var todayMatchView: TodayMatchView?
    
    // MARK: - Properties
    
    private let disposeBag = DisposeBag()
    var playerDataSource: UICollectionViewDiffableDataSource<Section, Player>?
    var enemyPlayerDataSource: UICollectionViewDiffableDataSource<Section, Player>?
    
    // MARK: - Life Cycle

    override func loadView() {
        todayMatchView = TodayMatchView()
        self.view = todayMatchView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupCollectionViews()
        bindViewModel()
        setDataSource()
    }
    
    // MARK: - UI

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
    
    // MARK: - Bind

    private func bindViewModel() {
        let input = TodayMatchViewModel.Input(fetchTrigger: Observable.just(()))
        let output = viewModel.transform(input: input, disposeBag: disposeBag)
        
        output.todayMatch
            .observe(on: MainScheduler.instance)
            .compactMap { $0.first }
            .bind { [weak self] match in
                guard let self = self, let todayMatchView = self.todayMatchView else { return }
                
               
                todayMatchView.matchStackView.update(teamName: "맨유", enemyName: match.enemy)
                todayMatchView.todayMatchInfoView.update(date: match.date, time: match.time, matchType: match.matchType, round: match.round, stadium: match.stadium)
                todayMatchView.enemyPlayerLabel.text = match.enemy
                
                todayMatchView.noMatchView.isHidden = true
                todayMatchView.matchStackView.isHidden = false
                todayMatchView.todayMatchInfoView.isHidden = false
                todayMatchView.playerTitle.isHidden = false
                todayMatchView.manUtdPlayerLabel.isHidden = false
                todayMatchView.enemyPlayerLabel.isHidden = false
                todayMatchView.playerCollectionView.isHidden = false
                todayMatchView.enemyPlayerCollectionView.isHidden = false
                self.setSnapShot(with: match)
            }
            .disposed(by: disposeBag)
        

        output.todayMatch
            .observe(on: MainScheduler.instance)
            .filter { $0.isEmpty }
            .bind { [weak self] _ in
                guard let self = self, let todayMatchView = self.todayMatchView else { return }
                
                print("No match data found, showing noMatchView")
                
                todayMatchView.noMatchView.isHidden = false
                todayMatchView.matchStackView.isHidden = true
                todayMatchView.todayMatchInfoView.isHidden = true
                todayMatchView.playerTitle.isHidden = true
                todayMatchView.manUtdPlayerLabel.isHidden = true
                todayMatchView.enemyPlayerLabel.isHidden = true
                todayMatchView.playerCollectionView.isHidden = true
                todayMatchView.enemyPlayerCollectionView.isHidden = true
            }
            .disposed(by: disposeBag)
    }
    
    private func setSnapShot(with match: MatchInfo) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Player>()
        let playerListSection = Section(id: "PlayerList")
        snapshot.appendSections([playerListSection])
        
        // 선수 명단이 있는지 확인하고 추가
        if let players = match.player {
            snapshot.appendItems(players, toSection: playerListSection)
        } else {
            print("No player data found.")
        }
        playerDataSource?.apply(snapshot, animatingDifferences: true)
        
        var enemySnapshot = NSDiffableDataSourceSnapshot<Section, Player>()
        let enemyPlayerListSection = Section(id: "EnemyPlayerList")
        enemySnapshot.appendSections([enemyPlayerListSection])
        
        // 상대팀 선수 명단이 있는지 확인하고 추가
        if let enemyPlayers = match.enemyPlayer {
            enemySnapshot.appendItems(enemyPlayers, toSection: enemyPlayerListSection)
        } else {
            print("No enemy player data found.")
        }
        enemyPlayerDataSource?.apply(enemySnapshot, animatingDifferences: true)
    }
}
