import UIKit
import WebKit
import SnapKit

class MatchInfoDetailView: UIViewController {
    private var matchInfo: MatchInfo?
    
    private lazy var scrollView: UIScrollView = createScrollView()
    private lazy var resultTitleLabel: UILabel = createLabel(text: "경기결과", fontSize: 20, fontWeight: .bold)
    private lazy var resultContainer: UIView = createContainerView()
    private lazy var matchType: UILabel = createLabel(text: matchInfo?.matchType ?? "")
    private lazy var matchDate: UILabel = createLabel(text: matchInfo?.date ?? "")
    //
    private lazy var scoreBox = createContainerView()
    private lazy var score: UILabel = createLabel(text: matchInfo?.score ?? "", fontSize: 30, fontWeight: .bold)
    private lazy var manUtdStack = createTeamStackView(teamName: "맨유", logoName: "맨유", fontSize: 24)
    private lazy var enemyStack = createTeamStackView(teamName: matchInfo?.enemy ?? "", logoName: matchInfo?.enemy ?? "", fontSize: 24)

    private lazy var separatorHBar: UIView = createSeparatorView(color: .darkGray.withAlphaComponent(0.5), borderWidth: 1)
    private lazy var separatorVBar: UIView = createSeparatorView(color: .darkGray.withAlphaComponent(0.3), borderWidth: 1)
    private lazy var manUtdGoalsView = createGoalsView(goals: matchInfo?.manUtdGoal, textAlign: .right)
    private lazy var enemyGoalsView = createGoalsView(goals: matchInfo?.enemyGoal, textAlign: .left)
    private lazy var highlightTitleLabel: UILabel = createLabel(text: "하이라이트", fontSize: 20, fontWeight: .bold)
    private lazy var highlightContainerView: UIView = createContainerView(cornerRadius: 20)
    private lazy var highlightView: WKWebView = createWebView(urlString: matchInfo?.highlight)
 
    init(matchInfo: MatchInfo) {
        self.matchInfo = matchInfo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setAutoLayout()
    }
}

// MARK: - UI Methods
extension MatchInfoDetailView {
    private func setUI() {
        view.backgroundColor = UIColor.bg
        
        view.addSubview(scrollView)
        
        let scrollViewItems = [resultTitleLabel, resultContainer, highlightTitleLabel, highlightContainerView]
        scrollViewItems.forEach { scrollView.addSubview($0) }
        
        let resultContainerItems = [matchType, matchDate, scoreBox, separatorHBar, separatorVBar, manUtdGoalsView, enemyGoalsView]
        resultContainerItems.forEach { resultContainer.addSubview($0) }
        
        let scoreBoxItems = [manUtdStack, score, enemyStack]
        scoreBoxItems.forEach { scoreBox.addSubview($0) }
        
        highlightContainerView.addSubview(highlightView)
    }
    
    private func setAutoLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(safeArea)
        }
        
        resultTitleLabel.snp.makeConstraints {
            $0.top.equalTo(scrollView.snp.top).offset(30)
            $0.leading.equalTo(scrollView.snp.leading).offset(20)
        }
        
        resultContainer.snp.makeConstraints {
            $0.centerX.equalTo(view.snp.centerX)
            $0.width.equalTo(view.snp.width).offset(-30)
            $0.top.equalTo(resultTitleLabel.snp.bottom).offset(20)
        }
        
        matchType.snp.makeConstraints {
            $0.centerX.equalTo(resultContainer.snp.centerX)
            $0.top.equalTo(resultContainer.snp.top).offset(10)
        }
        
        matchDate.snp.makeConstraints {
            $0.centerX.equalTo(resultContainer.snp.centerX)
            $0.top.equalTo(matchType.snp.bottom).offset(10)
        }
        
        scoreBox.snp.makeConstraints {
            $0.centerX.equalTo(resultContainer.snp.centerX)
            $0.top.equalTo(matchDate.snp.bottom).offset(25)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        manUtdStack.snp.makeConstraints {
            $0.trailing.equalTo(score.snp.leading).offset(-30)
            $0.bottom.equalTo(separatorHBar.snp.top).offset(-20)
            $0.top.equalTo(matchDate.snp.bottom).offset(5)
        }
        
        enemyStack.snp.makeConstraints {
            $0.leading.equalTo(score.snp.trailing).offset(30)
            $0.bottom.equalTo(separatorHBar.snp.top).offset(-20)
            $0.top.equalTo(matchDate.snp.bottom).offset(5)
        }
        
        score.snp.makeConstraints {
            $0.centerX.equalTo(resultContainer.snp.centerX)
            $0.centerY.equalTo(scoreBox.snp.centerY)
        }
        
        separatorHBar.snp.makeConstraints {
            $0.top.equalTo(scoreBox.snp.bottom).offset(50)
            $0.leading.trailing.equalTo(resultContainer)
            $0.height.equalTo(1)
        }
        
        separatorVBar.snp.makeConstraints {
            $0.top.equalTo(separatorHBar.snp.bottom)
            $0.centerX.equalTo(resultContainer.snp.centerX)
            $0.width.equalTo(1)
            $0.bottom.equalTo(resultContainer.snp.bottom).offset(-10)
        }
        
        manUtdGoalsView.snp.makeConstraints {
            $0.top.equalTo(separatorHBar.snp.bottom).offset(5)
            $0.trailing.equalTo(separatorVBar.snp.leading).offset(-10)
            $0.width.equalTo(resultContainer.snp.width).multipliedBy(0.5).offset(-20)
        }
        
        enemyGoalsView.snp.makeConstraints {
            $0.top.equalTo(separatorHBar.snp.bottom).offset(5)
            $0.leading.equalTo(separatorVBar.snp.trailing).offset(10)
            $0.width.equalTo(resultContainer.snp.width).multipliedBy(0.5).offset(-20)
        }
        
        highlightTitleLabel.snp.makeConstraints {
            $0.top.equalTo(separatorVBar.snp.bottom).offset(100)
            $0.leading.equalTo(resultTitleLabel.snp.leading)
        }
        
        highlightContainerView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.height.equalTo(view.snp.height).multipliedBy(0.26)
            $0.width.equalToSuperview().offset(-30)
            $0.top.equalTo(highlightTitleLabel.snp.bottom).offset(20)
        }
        
        highlightView.snp.makeConstraints {
            $0.edges.equalTo(highlightContainerView)
        }
    }
    
    private func createLabel(text: String, fontSize: CGFloat = 14, fontWeight: UIFont.Weight = .regular, textColor: UIColor = .black, textAlign: NSTextAlignment = .left) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
        label.textColor = textColor
        label.textAlignment = textAlign
        return label
    }
    
    private func createContainerView(backgroundColor: UIColor = .clear, cornerRadius: CGFloat = 0) -> UIView {
        let view = UIView()
        view.backgroundColor = backgroundColor
        view.layer.cornerRadius = cornerRadius
        return view
    }
    
    private func createSeparatorView(color: UIColor, borderWidth: CGFloat = 0) -> UIView {
        let view = UIView()
        view.backgroundColor = color
        view.layer.borderWidth = borderWidth
        return view
    }
    
    private func createGoalsView(goals: [String]?, textAlign: NSTextAlignment = .left ) -> UIView {
        let view = UIView()
        if let goals = goals?.filter({ !$0.isEmpty }) {
            var previousLabel: UILabel?
            for goal in goals {
                let label = createLabel(text: goal, fontWeight: .semibold, textAlign: textAlign)
                view.addSubview(label)
                label.snp.makeConstraints {
                    $0.leading.trailing.equalTo(view)
                    $0.height.equalTo(20)
                    if let previousLabel = previousLabel {
                        $0.top.equalTo(previousLabel.snp.bottom)
                    } else {
                        $0.top.equalTo(view.snp.top)
                    }
                }
                previousLabel = label
            }
            if let previousLabel = previousLabel {
                previousLabel.snp.makeConstraints {
                    $0.bottom.equalTo(view.snp.bottom)
                }
            }
        }
        return view
    }
    
    private func createScrollView() -> UIScrollView {
        let scrollView = UIScrollView()
        return scrollView
    }
    
    private func createWebView(urlString: String?) -> WKWebView {
        let webView = WKWebView()
        if let urlString = urlString, let url = URL(string: urlString) {
            webView.load(URLRequest(url: url))
        }
        webView.layer.shadowOpacity = 0.2
        return webView
    }
    
    private func createLogoImage(url: String) -> UIImageView {
        let image = UIImageView()
        image.image = UIImage(named: url)
        image.contentMode = .scaleAspectFit
        return image
    }
    
    private func createTeamStackView(teamName: String, logoName: String, fontSize: CGFloat) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10
        let logoImageView = createLogoImage(url: logoName)
        let teamLabel = createLabel(text: teamName, fontSize: fontSize)
        
        logoImageView.snp.makeConstraints {
            $0.width.height.equalTo(70)
        }
        
        stackView.addArrangedSubview(logoImageView)
        stackView.addArrangedSubview(teamLabel)
        
        return stackView
    }
}
