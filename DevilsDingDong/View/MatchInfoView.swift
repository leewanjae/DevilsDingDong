import UIKit

// TODO: - 경기의 일정 임박에 따른 위계부여 회색, 파랑, 빨강
// TODO: - 오늘의 달로 포커싱 되도록
// TODO: - 위의 달력이 수평 휠처럼 보일 수 있게 왼쪽 오른쪽은 Opacity, 현재 달인 가운데만 뚜렷하게
class MatchInfoView: UIViewController {
    let matchInfoViewModel = MatchInfoViewModel()
    
    lazy var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var scrollContainer: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = .bgColor
        return scrollView
    }()
    lazy var dateContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .bgColor
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MatchInfoCell.self, forCellReuseIdentifier: MatchInfoCell.id)
        notificationRedirected()
        matchInfoViewModel.updateTableView = { [weak self] in
            self?.tableView.reloadData()
        }
        NotificationManger.shared.setNotification()
    }
    
    private func setUI() {
        view.backgroundColor = .bgColor
        self.navigationItem.title = PageElement.matchInfoNavTitle
        navigationItem.largeTitleDisplayMode = .never
        Addview()
        setAutoLayout()
    }
    
    private func Addview() {
        view.addSubview(container)
        container.addSubview(scrollContainer)
        scrollContainer.addSubview(dateContainer)
        addMonthBtn()
        view.addSubview(tableView)
    }
    
    private func setAutoLayout() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            container.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            container.topAnchor.constraint(equalTo: safeArea.topAnchor),
            container.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05),
            
            scrollContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollContainer.heightAnchor.constraint(equalTo: container.heightAnchor),
            
            dateContainer.topAnchor.constraint(equalTo: scrollContainer.topAnchor),
            dateContainer.bottomAnchor.constraint(equalTo: scrollContainer.bottomAnchor),
            dateContainer.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor),
            dateContainer.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 15),
            dateContainer.centerYAnchor.constraint(equalTo: scrollContainer.centerYAnchor),
            
            tableView.topAnchor.constraint(equalTo: container.bottomAnchor, constant: 10),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}

extension MatchInfoView {
    private func addMonthBtn() {
        for month in Month.months {
            let monthBtn = createMonthBtn(title: month, action: #selector(tappedMonthButton))
            dateContainer.addArrangedSubview(monthBtn)
            matchInfoViewModel.monthButtons.append(monthBtn)
        }
    }
    
    private func createMonthBtn(title: String, action: Selector) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: action, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    @objc private func tappedMonthButton(_ sender: UIButton) {
        matchInfoViewModel.tappedMonthBtn(sender: sender)
    }
    
    private func notificationRedirected() {
        if matchInfoViewModel.isRedirected {
            guard navigationController != nil else {
                print("네비게이션 nil")
                return
            }
            
            if let matchID = matchInfoViewModel.selectedMatchID, let index = matchInfoViewModel.filteredMatches.firstIndex(where: { $0.id == matchID }) {
                let indexPath = IndexPath(row: index, section: 0)
                tableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
                self.tableView(tableView, didSelectRowAt: indexPath)
            } else {
                print("해당 경기를 찾을 수 없다.")
            }
        } else {
            print("화면전환 실행되지 않음")
        }
    }
}

extension MatchInfoView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matchInfoViewModel.filteredMatches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MatchInfoCell.id, for: indexPath) as? MatchInfoCell else { return UITableViewCell() }
        let matchInfo = matchInfoViewModel.filteredMatches[indexPath.row]
        let state = matchInfo.finished ?? false ? "종료" : "예정"
        cell.configure(matchDate: matchInfo.date, matchTime: matchInfo.time, stadium: matchInfo.stadium, state: state, enemy: matchInfo.enemy, round: "\(matchInfo.round ?? 0)R")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(MatchInfoDetailView(), animated: true)
    }
}
