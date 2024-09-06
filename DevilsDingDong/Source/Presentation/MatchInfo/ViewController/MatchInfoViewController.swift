//
//  MatchInfoViewController.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 8/21/24.
//

import UIKit
import RxSwift
import RxCocoa

class MatchInfoViewController: UIViewController {
    
    // MARK: - Properties
    
    private var matchInfoView = MatchInfoView()
    private let viewModel = MatchInfoViewModel()
    private var output: MatchInfoViewModel.Output? = nil
    private let disposeBag = DisposeBag()
    private var currentFilteredMatches: [MatchInfo] = []
    
    // MARK: - Life Cycle
    override func loadView() {
        self.view = matchInfoView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setTableView()
        bindViewModel()
    }
    
    // MARK: - UI
    private func setNavigationBar() {
        navigationItem.title = "경기 일정"
        navigationItem.largeTitleDisplayMode = .never
    }
    
    private func setTableView() {
        matchInfoView.tableView.delegate = self
        matchInfoView.tableView.register(MatchInfoCell.self, forCellReuseIdentifier: MatchInfoCell.id)
    }
    
    // MARK: - bind
    private func bindViewModel() {
        let input = MatchInfoViewModel.Input(
            previousMonthTap: matchInfoView.monthNavigationView.prevButton.rx.tap,
            nextMonthTap: matchInfoView.monthNavigationView.nextButton.rx.tap,
            fetchMatches: .just(())
        )
        
        output = viewModel.transform(input: input, disposeBag: disposeBag)
        
        output?.filteredMatches
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] matches in
                self?.currentFilteredMatches = matches
            })
            .disposed(by: disposeBag)
        
        output?.filteredMatches
            .observe(on: MainScheduler.instance)
            .bind(to: matchInfoView.tableView.rx.items(cellIdentifier: MatchInfoCell.id, cellType: MatchInfoCell.self)) { index, matchInfo, cell in
                let state = matchInfo.finished ? "종료" : "예정"
                cell.configure(matchDate: matchInfo.date, matchTime: matchInfo.time, stadium: matchInfo.stadium, state: state, enemy: matchInfo.enemy, round: matchInfo.round)
            }
            .disposed(by: disposeBag)
        
        output?.formattedCurrentYearMonth
            .observe(on: MainScheduler.instance)
            .bind(to: matchInfoView.monthNavigationView.monthLabel.rx.text)
            .disposed(by: disposeBag)
        
        output?.isEmptyState
            .observe(on: MainScheduler.instance)
            .bind { [weak self] isEmpty in
                self?.matchInfoView.emptyCharacter.isHidden = !isEmpty
                self?.matchInfoView.emptyStateLabel.isHidden = !isEmpty
            }
            .disposed(by: disposeBag)
    }
}

    // MARK: - Delegate
extension MatchInfoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIDevice.current.userInterfaceIdiom == .phone ? 170 : 250
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard currentFilteredMatches.indices.contains(indexPath.row) else { return }
        let matchInfo = currentFilteredMatches[indexPath.row]
        
        let detailViewController = MatchInfoDetailViewController(matchInfo: matchInfo)
        navigationController?.pushViewController(detailViewController, animated: true)
        
    }
}
