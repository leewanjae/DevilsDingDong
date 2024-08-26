//
//  MatchInfoViewController.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 8/21/24.
//

import UIKit

class MatchInfoViewController: UIViewController {
    private let viewModel = MatchInfoViewModel()
    private var matchInfoView: MatchInfoView?

    override func loadView() {
        matchInfoView = MatchInfoView(viewModel: viewModel)
        self.view = matchInfoView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        setupTableView()
        bindViewModel()
    }

    private func setupNavigationBar() {
        navigationItem.title = "경기 일정"
        navigationItem.largeTitleDisplayMode = .never
    }

    private func setupTableView() {
        matchInfoView?.tableView.delegate = self
        matchInfoView?.tableView.dataSource = self
        matchInfoView?.tableView.register(MatchInfoCell.self, forCellReuseIdentifier: MatchInfoCell.id)
    }

    private func bindViewModel() {
        viewModel.viewUpdateCloser = { [weak self] in
            self?.matchInfoView?.tableView.reloadData()
            self?.updateEmptyState()
        }
    }

    private func updateEmptyState() {
        let hasMatches = viewModel.filteredMatches.count != 0
        matchInfoView?.emptyCharacter.isHidden = hasMatches
        matchInfoView?.emptyStateLabel.isHidden = hasMatches
    }
}

extension MatchInfoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.filteredMatches.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MatchInfoCell.id, for: indexPath) as? MatchInfoCell else { return UITableViewCell() }
        let matchInfo = viewModel.filteredMatches[indexPath.row]
        let state = matchInfo.finished ? "종료" : "예정"
        cell.configure(matchDate: matchInfo.date, matchTime: matchInfo.time, stadium: matchInfo.stadium, state: state, enemy: matchInfo.enemy, round: matchInfo.round )
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIDevice.current.userInterfaceIdiom == .phone ? 170 : 250
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let matchInfo = viewModel.filteredMatches[indexPath.row]
        if matchInfo.finished {
            navigationController?.pushViewController(MatchInfoDetailViewController(matchInfo: matchInfo), animated: true)
        }
    }
}
