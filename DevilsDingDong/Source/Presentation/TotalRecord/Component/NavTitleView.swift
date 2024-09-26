//
//  NavTitleView.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 9/25/24.
//

import UIKit
import SnapKit

class NavTitleView: UIView {
    
    // MARK: - Properties
    
    let navTitle = UILabel()
    let divider = UIView()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUI() {
        navTitle.text = "리그 순위"
        navTitle.textColor = .black
        navTitle.font = .systemFont(ofSize: 16, weight: .bold)
        divider.backgroundColor = .lightGray
        
        addSubview(navTitle)
        addSubview(divider)
    }
    
    private func setAutoLayout() {
        navTitle.snp.makeConstraints {
            $0.top.equalTo(snp.top)
            $0.leading.equalTo(16)
        }
        
        divider.snp.makeConstraints {
            $0.top.equalTo(navTitle.snp.bottom).offset(10)
            $0.height.equalTo(1)
            $0.width.equalToSuperview()
        }
    }
}
