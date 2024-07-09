import UIKit

class TotalRecordCell: UICollectionViewCell {
    static let id = "TotalRecordCell"
    private lazy var rankLabel = createScoreDBLabel()
    private lazy var teamLabel = createScoreDBLabel()
    private lazy var roundLabel = createScoreDBLabel()
    private lazy var pointLabel = createScoreDBLabel()
    private lazy var winLabel = createScoreDBLabel()
    private lazy var drawLabel = createScoreDBLabel()
    private lazy var lossLabel = createScoreDBLabel()
    private lazy var gdLabel = createScoreDBLabel()
    private lazy var logoImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var teamView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var scoreDBStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            rankLabel, teamView, roundLabel, winLabel, drawLabel, lossLabel, pointLabel, gdLabel
        ])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var horizontalDivider: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TotalRecordCell {
    private func setUI() {
        addView()
        setAutoLayout()
    }

    private func addView() {
        contentView.addSubview(scoreDBStackView)
        contentView.addSubview(horizontalDivider)
        
        teamView.addSubview(logoImage)
        teamView.addSubview(teamLabel)
    }

    private func setAutoLayout() {
        NSLayoutConstraint.activate([
            scoreDBStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            scoreDBStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            scoreDBStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            scoreDBStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

            horizontalDivider.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            horizontalDivider.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            horizontalDivider.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            logoImage.widthAnchor.constraint(equalToConstant: 30),
            logoImage.heightAnchor.constraint(equalToConstant: 30),
            logoImage.centerXAnchor.constraint(equalTo: teamView.centerXAnchor),
            logoImage.topAnchor.constraint(equalTo: teamView.topAnchor, constant: 10),
            teamLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: -5),
            teamLabel.centerXAnchor.constraint(equalTo: teamView.centerXAnchor),
            teamLabel.bottomAnchor.constraint(equalTo: teamView.bottomAnchor),
        ])
    }
}

extension TotalRecordCell {
    private func createScoreDBLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        return label
    }

    func configure(rankLabel: String, teamLabel: String, roundLabel: String, winLabel: String, drawLabel: String, lossLabel: String, pointLabel: String, gdLabel: String, logoURL: String) {
        self.rankLabel.text = rankLabel
        self.teamLabel.text = teamLabel
        self.roundLabel.text = roundLabel
        self.winLabel.text = winLabel
        self.drawLabel.text = drawLabel
        self.lossLabel.text = lossLabel
        self.pointLabel.text = pointLabel
        self.gdLabel.text = gdLabel
        self.logoImage.image = UIImage(named: teamLabel)
        
    }
}
