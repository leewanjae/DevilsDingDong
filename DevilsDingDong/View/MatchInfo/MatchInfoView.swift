//
//  MatchInfoView.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 5/12/24.
//

import UIKit
import SnapKit

// TODO: - 경기의 일정 임박에 따른 위계부여 회색, 파랑, 빨강
class MatchInfoView: UIViewController {
    private let viewModel = MatchInfoViewModel()
    private lazy var monthNavigationView: MonthNavigationView = {
        let view = MonthNavigationView(viewModel: viewModel)
        return view
    }()
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .bgColor
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(MatchInfoCell.self, forCellReuseIdentifier: MatchInfoCell.id)
        return tableView
    }()
    private lazy var emptyCharacter: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "ch")
        image.contentMode = .scaleAspectFit
        return image
    }()
    private lazy var emptyStateLabel: UILabel = {
        let label = UILabel()
        label.text = "경기 일정이 없습니다"
        label.textColor = .gray
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setAutoLayout()
        bindViewModel()
    }
}

// MARK: - UI Methods
extension MatchInfoView {
    private func setUI() {
        view.backgroundColor = .bgColor
        
        self.navigationItem.title = "경기 일정"
        navigationItem.largeTitleDisplayMode = .never
        
        let viewItems = [monthNavigationView, tableView, emptyStateLabel, emptyCharacter]
        viewItems.forEach { view.addSubview($0) }
    }
    
    private func bindViewModel() {
        viewModel.viewUpdateCloser = { [weak self] in
            self?.tableView.reloadData()
            self?.updateEmptyState()
        }
    }
    
    private func setAutoLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        monthNavigationView.snp.makeConstraints {
            $0.top.equalTo(safeArea.snp.top).offset(-20)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalToSuperview().multipliedBy(0.1)
            $0.centerX.equalToSuperview()
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(monthNavigationView.snp.bottom)
            $0.bottom.equalTo(safeArea.snp.bottom)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        emptyCharacter.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.height.equalTo(200)
        }
        
        emptyStateLabel.snp.makeConstraints {
            $0.top.equalTo(emptyCharacter.snp.bottom).offset(50)
            $0.centerX.equalTo(emptyCharacter.snp.centerX)
        }
    }
    
    private func updateEmptyState() {
        emptyCharacter.isHidden = viewModel.filteredMatches.count != 0
        emptyStateLabel.isHidden = viewModel.filteredMatches.count != 0
    }
}

// MARK: - Delegate Methods
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
        if UIDevice.current.userInterfaceIdiom == .phone {
            return 170
        } else {
            return 250
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let matchInfo = viewModel.filteredMatches[indexPath.row]
        if matchInfo.finished == true {
            navigationController?.pushViewController(MatchInfoDetailView(matchInfo: matchInfo), animated: true)
        }
    }
}
