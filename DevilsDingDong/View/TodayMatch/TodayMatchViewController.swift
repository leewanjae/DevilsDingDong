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

    override func loadView() {
        todayMatchView = TodayMatchView(viewModel: viewModel)
        self.view = todayMatchView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        todayMatchView?.setupCollectionViews()
        todayMatchView?.setDataSource()
        todayMatchView?.setSnapShot()

        if let notiData = viewModel.todayMatch.first {
            NotificationManger.shared.setNotification(enemy: notiData.enemy, date: notiData.date, time: notiData.time)
        }
    }

    private func setupNavigationBar() {
        navigationItem.title = "오늘의 경기"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
