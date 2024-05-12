//
//  MatchInfoView.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 5/7/24.
//


// TODO: Push 알람 클릭시 MatchInfoDetail로 뷰 이동
/**
 푸쉬 알람을 클릭하면 메인화면인 MatchInfoView로 도착 -> Appdelegate에 있는 userNotificationCenter의 didReceive에서 isRedirected를 true로 변경 -> MatchInfoView의 notificationRedirected 함수 실행 -> 화면 전환 성공
 문제  -> notificationRedirected 함수에서 네비게이션 nil이 발생.
 */
// TODO: Push 알림 경기 일정에 매핑하기
// TODO: MatchInfoDeail 뷰로 이동 시 경기 데이터 함께 넘겨주기
import UIKit

class MatchInfoView: UIViewController {
    var buttons: [UIButton] = []
    lazy var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var season: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = PageElement.season
        label.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        return label
    }()
    
    lazy var scrollContainer: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
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
        return tableView
    }()
    
    var isRedirected: Bool = false {
        didSet { // 변경 확인
            print("isRedirected가 변경되었습니다.: \(isRedirected)")
            notificationRedirected()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        tableView.register(MatchInfoCell.self, forCellReuseIdentifier: MatchInfoCell.id)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setUI() {
        view.backgroundColor = UIColor.bgColor
        self.navigationItem.title = PageElement.matchInfoNavTitle
        navigationItem.largeTitleDisplayMode = .never
        
        Addview()
        setAutoLayout()
    }
    
    private func Addview() {
        view.addSubview(container)
        
        container.addSubview(season)
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
            container.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2),
            
            season.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            
            scrollContainer.topAnchor.constraint(equalTo: season.bottomAnchor, constant: 10),
            scrollContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollContainer.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: 0.5),
            
            dateContainer.topAnchor.constraint(equalTo: scrollContainer.topAnchor),
            dateContainer.bottomAnchor.constraint(equalTo: scrollContainer.bottomAnchor),
            dateContainer.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor),
            dateContainer.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor),
            dateContainer.centerYAnchor.constraint(equalTo: scrollContainer.centerYAnchor),
            
            tableView.topAnchor.constraint(equalTo: container.bottomAnchor, constant: 20),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func notificationRedirected() {
        if isRedirected {
            if let navigationController = navigationController {
                let targetView = MatchInfoDetailView()
                navigationController.pushViewController(targetView, animated: true)
            } else {
                print("네비게이션 nil")
            }
        } else {
            print("화면전환 실행되지 않음")
        }
    }
    
    private func setNotification() {
        let center = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        content.title = "DevilsDingDong"
        content.body = "맨체스터유나이티드 VS 크리스탈펠리스"
        content.sound = .default
        content.badge = 1
        let fireDate = Calendar.current.dateComponents([.day, .month, .year, .hour, .minute, .second], from: Date().addingTimeInterval((3)))
        let trigger = UNCalendarNotificationTrigger(dateMatching: fireDate, repeats: false)
        let request = UNNotificationRequest(identifier: "MatchInfo", content: content, trigger: trigger)
        center.add(request) { error in
            if let error = error {
                print("Error = \(error.localizedDescription)")
            }
        }
    }
    
    private func addMonthBtn() {
        for month in Month.months {
            let createBtn = createMonthBtn(month: month)
            dateContainer.addArrangedSubview(createBtn)
            buttons.append(createBtn)
        }
    }
    
    private func createMonthBtn(month: String) -> UIButton {
        let button = UIButton()
        button.setTitle(month, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(tappedMonthBtn), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    @objc func tappedMonthBtn(sender: UIButton) {
        if let month = sender.title(for: .normal) {
            print("selected: \(month)")
            for button in buttons {
                button.isSelected = false
                button.setTitleColor(.black, for: .normal)
            }
            sender.isSelected = true
            sender.setTitleColor(.accentColor, for: .normal)
        }
    }
}

extension MatchInfoView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Match.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MatchInfoCell.id, for: indexPath) as? MatchInfoCell else { return UITableViewCell() }
        
        let matchInfo = Match.data[indexPath.row]
        let state = matchInfo.finished ?? false ? "종료" : "예정"
        cell.configure(matchDate: matchInfo.date, matchTime: matchInfo.time, stadium: matchInfo.stadium, state: state, enemy: matchInfo.enemy, round: "\(matchInfo.round ?? 0)R")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
