import UIKit
import SnapKit

class TotalRecordCell: UITableViewCell {
    
    // MARK: - Properties
    static let id = "TotalRecordCell"

    let rankLabel = UILabel()
    let teamLabel = UILabel()
    let roundLabel = UILabel()
    let winLabel = UILabel()
    let drawLabel = UILabel()
    let lossLabel = UILabel()
    let pointLabel = UILabel()
    let gdLabel = UILabel()
    let logoImage = UIImageView()

    // MARK: - Life Cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setAutoLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UI

    private func setUI() {
        [rankLabel, teamLabel, roundLabel, winLabel, drawLabel, lossLabel, pointLabel, gdLabel, logoImage].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }

        logoImage.contentMode = .scaleAspectFit

        teamLabel.textAlignment = .center

        [rankLabel, roundLabel, winLabel, drawLabel, lossLabel, pointLabel, gdLabel].forEach {
            $0.textAlignment = .center
            $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            $0.adjustsFontSizeToFitWidth = true
            $0.minimumScaleFactor = 0.5
        }
    }

    private func setAutoLayout() {
        rankLabel.snp.makeConstraints {
            $0.centerY.equalTo(snp.centerY)
            $0.leading.equalToSuperview().offset(16)
            $0.width.height.equalTo(22)
        }

        logoImage.snp.makeConstraints {
            $0.top.equalTo(snp.top).offset(12)
            $0.centerX.equalTo(teamLabel.snp.centerX)
            $0.width.height.equalTo(26)
        }

        teamLabel.snp.makeConstraints {
            $0.leading.equalTo(rankLabel.snp.trailing).offset(11)
            $0.top.equalTo(logoImage.snp.bottom)
            $0.bottom.equalTo(snp.bottom).offset(-4)
            $0.width.equalTo(61)
            $0.height.equalTo(26)
        }
      
        roundLabel.snp.makeConstraints {
            $0.top.equalTo(rankLabel.snp.top)
            $0.leading.equalTo(teamLabel.snp.trailing).offset(20)
            $0.width.height.equalTo(22)
        }

        winLabel.snp.makeConstraints {
            $0.top.equalTo(rankLabel.snp.top)
            $0.leading.equalTo(roundLabel.snp.trailing).offset(16)
            $0.width.height.equalTo(22)
        }

        drawLabel.snp.makeConstraints {
            $0.top.equalTo(rankLabel.snp.top)
            $0.leading.equalTo(winLabel.snp.trailing).offset(16)
            $0.width.height.equalTo(22)
        }

        lossLabel.snp.makeConstraints {
            $0.top.equalTo(rankLabel.snp.top)
            $0.leading.equalTo(drawLabel.snp.trailing).offset(16)
            $0.width.height.equalTo(22)
        }

        pointLabel.snp.makeConstraints {
            $0.top.equalTo(rankLabel.snp.top)
            $0.leading.equalTo(lossLabel.snp.trailing).offset(16)
            $0.width.height.equalTo(22)
        }

        gdLabel.snp.makeConstraints {
            $0.top.equalTo(rankLabel.snp.top)
            $0.leading.equalTo(pointLabel.snp.trailing).offset(16)
            $0.width.height.equalTo(22)
        }
    }

    func configure(rank: String, team: String, round: String, win: String, draw: String, loss: String, point: String, gd: String, logoImageName: String) {
        rankLabel.text = rank
        teamLabel.text = team
        roundLabel.text = round
        winLabel.text = win
        drawLabel.text = draw
        lossLabel.text = loss
        pointLabel.text = point
        gdLabel.text = gd
        logoImage.image = UIImage(named: logoImageName)

        rankLabel.font = .systemFont(ofSize: 20, weight: .bold)
        rankLabel.textColor = .accent
        
        teamLabel.font = .systemFont(ofSize: 14, weight: .medium)
        roundLabel.font = .systemFont(ofSize: 16, weight: .medium)
        winLabel.font = .systemFont(ofSize: 16, weight: .medium)
        drawLabel.font = .systemFont(ofSize: 16, weight: .medium)
        lossLabel.font = .systemFont(ofSize: 16, weight: .medium)
        pointLabel.font = .systemFont(ofSize: 16, weight: .medium)
        gdLabel.font = .systemFont(ofSize: 16, weight: .medium)
    }
}
