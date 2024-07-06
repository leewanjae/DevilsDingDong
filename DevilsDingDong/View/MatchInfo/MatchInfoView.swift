//
//  MatchInfoView.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 5/12/24.
//

import UIKit

// TODO: - 경기의 일정 임박에 따른 위계부여 회색, 파랑, 빨강
class MatchInfoView: UIViewController {
    private let viewModel = MatchInfoViewModel()
    private lazy var monthNavigationView: MonthNavigationView = {
        let view = MonthNavigationView(viewModel: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .bgColor
        return tableView
    }()
    private lazy var emptyStateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "경기 일정이 없습니다"
        label.textColor = .gray
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(MatchInfoCell.self, forCellReuseIdentifier: MatchInfoCell.id)
        viewModel.viewUpdateCloser = { [weak self] in
            self?.tableView.reloadData()
            self?.updateEmptyState()
        }
    }
}

extension MatchInfoView {
    private func setUI() {
        view.backgroundColor = .bgColor
        
        self.navigationItem.title = PageElement.matchInfoNavTitle
        navigationItem.largeTitleDisplayMode = .never
        
        view.addSubview(monthNavigationView)
        view.addSubview(tableView)
        view.addSubview(emptyStateLabel)
        
        setAutoLayout()
        updateEmptyState()
    }
    
    private func setAutoLayout() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            monthNavigationView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: -20),
            monthNavigationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            monthNavigationView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            monthNavigationView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            monthNavigationView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
            
            tableView.topAnchor.constraint(equalTo: monthNavigationView.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor), // 변경된 부분
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            emptyStateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emptyStateLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    private func createMonthBtn(title: String, action: Selector) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: action, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    private func updateEmptyState() {
        emptyStateLabel.isHidden = viewModel.filteredMatches.count != 0
    }
}

extension MatchInfoView: UITableViewDelegate, UITableViewDataSource {
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
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let matchInfo = viewModel.filteredMatches[indexPath.row]
        if matchInfo.finished == true {
            navigationController?.pushViewController(MatchInfoDetailView(matchInfo: matchInfo), animated: true)
        }
    }
}
