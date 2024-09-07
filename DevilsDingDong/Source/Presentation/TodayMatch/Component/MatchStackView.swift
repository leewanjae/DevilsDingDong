//
//  MatchStackView.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 8/21/24.
//

import UIKit
import SnapKit

class MatchStackView: UIStackView {
    
    // MARK: - Properties

    private var manLabel: UILabel?
    private var enemyLabel: UILabel?
    private var logoImageView: UIImageView?
    
    // MARK: - Life Cycle
    
    init(teamName: String, enemyName: String) {
        super.init(frame: .zero)
        setUI(teamName: "맨유", enemyName: enemyName)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI

    private func setUI(teamName: String, enemyName: String) {
        axis = .horizontal
        spacing = 20
        alignment = .center
        
        let manLogoStackView = createTeamStackView(teamName: teamName)
        let vsLabel = createLabel(size: 17, weight: .regular, text: "VS")
        let enemyLogoStackView = createTeamStackView(teamName: enemyName)
        
        manLabel = manLogoStackView.arrangedSubviews.last as? UILabel
        enemyLabel = enemyLogoStackView.arrangedSubviews.last as? UILabel
        
        addArrangedSubview(manLogoStackView)
        addArrangedSubview(vsLabel)
        addArrangedSubview(enemyLogoStackView)
    }
    
    func update(teamName: String, enemyName: String) {
        manLabel?.text = teamName
        enemyLabel?.text = enemyName
        logoImageView?.image = UIImage(named: enemyName)
    }
    
    private func createLabel(size: CGFloat, weight: UIFont.Weight, text: String) -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: size, weight: weight)
        label.text = text
        label.textColor = .black
        return label
    }

    private func createTeamStackView(teamName: String) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10
        
        logoImageView = createImage(url: teamName)
        let teamLabel = createLabel(size: 24, weight: .semibold, text: teamName)
        logoImageView?.snp.makeConstraints {
            $0.width.height.equalTo(70)
        }
        
        stackView.addArrangedSubview(logoImageView ?? UIImageView())
        stackView.addArrangedSubview(teamLabel)
        
        return stackView
    }
    
    private func createImage(url: String) -> UIImageView {
        let image = UIImageView()
        image.image = UIImage(named: url)
        image.contentMode = .scaleAspectFit
        return image
    }
}
