import UIKit

class MatchInfoView: UIViewController {
    
    var isRedirected: Bool = false
    var selectedMatchID: Int?
    var filteredMatches: [Match] = []
    var monthButtons: [UIButton] = []
    var filterButtons: [UIButton] = []
    lazy var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var scrollContainer: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.layer.borderColor = UIColor.black.cgColor
        scrollView.layer.borderWidth = 0.5
        scrollView.backgroundColor = .black
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
    var selectedMonth: String? {
        didSet {
            updateTableSelectedMonth()
        }
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        filteredMatches = Match.data
        tableView.register(MatchInfoCell.self, forCellReuseIdentifier: MatchInfoCell.id)
        tableView.delegate = self
        tableView.dataSource = self
        setNotification()
        notificationRedirected()
        tableView.separatorStyle = .none
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
    
    private func addMonthBtn() {
        for month in Month.months {
            let monthBtn = createMonthBtn(title: month, action: #selector(tappedMonthBtn))
            let boldFont = UIFont.boldSystemFont(ofSize: monthBtn.titleLabel?.font.pointSize ?? 17)
            let attributes: [NSAttributedString.Key: Any] = [
                .font: boldFont,
                .foregroundColor: UIColor.white
            ]
            let attributedTitle = NSAttributedString(string: month, attributes: attributes)
            
            // Set the attributed title for the normal state
            monthBtn.setAttributedTitle(attributedTitle, for: .normal)
            dateContainer.addArrangedSubview(monthBtn)
            monthButtons.append(monthBtn)
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
    
    private func updateTableSelectedMonth() {
        guard let month = selectedMonth else {
            filteredMatches = Match.data
            tableView.reloadData()
            return
        }
        filteredMatches = Match.data.filter{$0.date.contains(month)}
        tableView.reloadData()
    }
    
    @objc private func tappedMonthBtn(sender: UIButton) {
        if let month = sender.title(for: .normal) {
            print("selected: \(month)")
            selectedMonth = month
            for button in monthButtons {
                button.isSelected = false
                button.setTitleColor(.white, for: .normal)
            }
            sender.isSelected = true
            sender.setTitleColor(.accentColor, for: .normal)
        }
    }
    
    private func setNotification() {
        let center = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        content.title = "DevilsDingDong"
        content.body = "맨체스터유나이티드 VS 크리스탈펠리스"
        content.sound = .default
        content.badge = 1
        content.userInfo = ["MatchID" : Match.data[0].id]
        
        let fireDate = Calendar.current.dateComponents([.day, .month, .year, .hour, .minute, .second], from: Date().addingTimeInterval((3)))
        let trigger = UNCalendarNotificationTrigger(dateMatching: fireDate, repeats: false)
        let request = UNNotificationRequest(identifier: "MatchInfo", content: content, trigger: trigger)
        center.add(request) { error in
            if let error = error {
                print("Error = \(error.localizedDescription)")
            }
        }
    }
    
    private func notificationRedirected() {
        if isRedirected {
            guard navigationController != nil else {
                print("네비게이션 nil")
                return
            }
            
            if let matchID = selectedMatchID, let index = filteredMatches.firstIndex(where: { $0.id == matchID }) {
                let indexPath = IndexPath(row: index, section: 0)
                tableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
                self.tableView(tableView, didSelectRowAt: indexPath)
            } else {
                print("해당 경기를 찾을 수 없다.")
            }
        }else {
            print("화면전환 실행되지 않음")
        }
    }
}

extension MatchInfoView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredMatches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MatchInfoCell.id, for: indexPath) as? MatchInfoCell else { return UITableViewCell() }
        let matchInfo = filteredMatches[indexPath.row]
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
