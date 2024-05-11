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
    lazy var testBtn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Test", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(setNotification), for: .touchUpInside)
        return button
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
    }
    
    func setUI() {
        view.backgroundColor = .white
        view.addSubview(testBtn)
        NSLayoutConstraint.activate([
            testBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            testBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            testBtn.heightAnchor.constraint(equalToConstant: 200),
            testBtn.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func notificationRedirected() {
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
    
    @objc func setNotification() {
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
}
