import UIKit
import SnapKit

class TotalRecordCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let id = "TotalRecordCell"
    private lazy var topDivider = createDivider()
    private lazy var bottomDivider = createDivider()
    
    private lazy var rankLabel = createLabel()
    private lazy var teamLabel = createLabel()
    private lazy var roundLabel = createLabel()
    private lazy var pointLabel = createLabel()
    private lazy var winLabel = createLabel()
    private lazy var drawLabel = createLabel()
    private lazy var lossLabel = createLabel()
    private lazy var gdLabel = createLabel()
    
    private lazy var logoImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var teamView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var scoreDBStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            rankLabel, teamView, roundLabel, winLabel, drawLabel, lossLabel, pointLabel, gdLabel
        ])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    // MARK: - Life Cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UI
extension TotalRecordCell {
    private func setUI() {
        let contentViewItems = [topDivider, scoreDBStackView, bottomDivider]
        contentViewItems.forEach { contentView.addSubview($0) }
       
        let teamViewItems = [logoImage, teamLabel]
        teamViewItems.forEach { teamView.addSubview($0) }
    }
    
    private func setAutoLayout() {
        topDivider.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(contentView.snp.top).offset(5)
        }
        
        scoreDBStackView.snp.makeConstraints {
            $0.top.equalTo(topDivider.snp.bottom).offset(10)
            $0.bottom.equalTo(bottomDivider.snp.top).offset(-10)
            $0.leading.trailing.equalToSuperview()
        }
        
        bottomDivider.snp.makeConstraints {
            $0.bottom.equalTo(contentView.snp.bottom).offset(-5)
            $0.leading.trailing.equalToSuperview()
        }
        
        logoImage.snp.makeConstraints {
            $0.width.height.equalTo(30)
            $0.centerX.equalTo(teamView.snp.centerX)
            $0.top.equalTo(teamView.snp.top)
        }
        
        teamLabel.snp.makeConstraints {
            $0.top.equalTo(logoImage.snp.bottom).offset(5)
            $0.bottom.equalTo(teamView.snp.bottom)
            $0.centerX.equalTo(teamView.snp.centerX)
        }
        
        teamView.snp.makeConstraints {
            $0.centerY.equalTo(scoreDBStackView.snp.centerY)
        }
    }
    
    private func createLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        return label
    }
    
    private func createDivider() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        view.isHidden = false
        return view
    }
    
    func configure(rankLabel: String, teamLabel: String, roundLabel: String, winLabel: String, drawLabel: String, lossLabel: String, pointLabel: String, gdLabel: String, logoURL: String, isFirstCell: Bool, isLastCell: Bool) {
        self.rankLabel.text = rankLabel
        self.teamLabel.text = teamLabel
        self.roundLabel.text = roundLabel
        self.winLabel.text = winLabel
        self.drawLabel.text = drawLabel
        self.lossLabel.text = lossLabel
        self.pointLabel.text = pointLabel
        self.gdLabel.text = gdLabel
        self.logoImage.image = UIImage(named: teamLabel)
        
        self.topDivider.isHidden = isFirstCell
        self.bottomDivider.isHidden = isLastCell
        
        self.rankLabel.font = .systemFont(ofSize: 16, weight: .bold)
        switch rankLabel {
        case "1", "2", "3", "4":
            self.rankLabel.textColor = .rank14
        case "5", "6":
            self.rankLabel.textColor = .rank56
        case "18", "19", "20":
            self.rankLabel.textColor = .lightGray
        default:
            self.rankLabel.textColor = .black
        }
    }
}
