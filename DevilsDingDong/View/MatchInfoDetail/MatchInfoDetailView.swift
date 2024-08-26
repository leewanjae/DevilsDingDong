//
//  MatchInfoDetailView.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 8/22/24.
//

import UIKit
import WebKit
import SnapKit

class MatchInfoDetailView: UIView {
    var matchResultView = MatchResultView()
    var highlightContainerView = UIView()
    var highlightTitleLabel = UILabel()
    var highlightView = WKWebView()
 
    init() {
        super.init(frame: .zero)
        setUI()
        setAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UI Methods
extension MatchInfoDetailView {
    private func setUI() {
        backgroundColor = UIColor.bg
        
        highlightContainerView = createContainerView(cornerRadius: 20)
        highlightTitleLabel = createLabel(text: "하이라이트", fontSize: 20, fontWeight: .bold)
        highlightView = createWebView(urlString: nil)
        
        addSubview(matchResultView)
        addSubview(highlightTitleLabel)
        addSubview(highlightContainerView)
        highlightContainerView.addSubview(highlightView)
    }
    
    private func setAutoLayout() {
        matchResultView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.5)
        }
        
        highlightTitleLabel.snp.makeConstraints {
            $0.top.equalTo(matchResultView.snp.bottom).offset(30)
            $0.leading.equalTo(matchResultView.snp.leading).offset(20)
        }
        
        if UIDevice.current.userInterfaceIdiom == .phone {
            highlightContainerView.snp.makeConstraints {
                $0.centerX.equalToSuperview()
                $0.height.equalTo(snp.height).multipliedBy(0.26)
                $0.width.equalToSuperview().offset(-30)
                $0.top.equalTo(highlightTitleLabel.snp.bottom).offset(20)
            }
            
            highlightView.snp.makeConstraints {
                $0.edges.equalTo(highlightContainerView)
            }
        } else {
            highlightContainerView.snp.makeConstraints {
                $0.centerX.equalToSuperview()
                $0.width.equalToSuperview().offset(-30)
                $0.height.equalToSuperview().multipliedBy(0.4)
                $0.top.equalTo(highlightTitleLabel.snp.bottom).offset(20)
            }
            
            highlightView.snp.makeConstraints {
                $0.edges.equalTo(highlightContainerView)
            }
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
    
    private func createWebView(urlString: String?) -> WKWebView {
        let webView = WKWebView()
        if let urlString = urlString, let url = URL(string: urlString) {
            webView.load(URLRequest(url: url))
        }
        webView.layer.shadowOpacity = 0.2
        return webView
    }
}
