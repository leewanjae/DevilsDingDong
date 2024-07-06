//
//  TotalRecordView.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 6/11/24.
//

import UIKit

class TotalRecordView: UIViewController {
    private let viewModel = TotalRecordViewModel()
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(TotalRecordCell.self, forCellWithReuseIdentifier: TotalRecordCell.id)
        collectionView.backgroundColor = .bgColor
        return collectionView
    }()
    private lazy var titleLabel: [UILabel] = {
        var labels = [UILabel()]
        let rankTitle = createTitleLabel(text: "순위")
        let teamLabel = createTitleLabel(text: "팀")
        let roundLabel = createTitleLabel(text: "경기")
        let winLabel = createTitleLabel(text: "승")
        let drawLabel = createTitleLabel(text: "무")
        let lossLabel = createTitleLabel(text: "패")
        let pointLabel = createTitleLabel(text: "승점")
        let gfLabel = createTitleLabel(text: "득")
        let gaLabel = createTitleLabel(text: "실")
        let gdLabel = createTitleLabel(text: "득실")
        return [rankTitle, teamLabel, roundLabel, winLabel, drawLabel, lossLabel, pointLabel, gfLabel, gaLabel, gdLabel]
    }()
    private lazy var scoreTitleStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: titleLabel)
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        viewModel.fetchScoreData()
        viewModel.viewUpdateCloser = { [ weak self] in
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
}

extension TotalRecordView {
    private func setUI() {
        view.backgroundColor = .bgColor
        navigationItem.title = "리그 순위"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        addView()
        setAutoLayout()
    }
    
    private func addView() {
        view.addSubview(scoreTitleStackView)
        view.addSubview(collectionView)
    }
    
    private func setAutoLayout() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            scoreTitleStackView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20),
            scoreTitleStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            scoreTitleStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            collectionView.topAnchor.constraint(equalTo: scoreTitleStackView.bottomAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: scoreTitleStackView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: scoreTitleStackView.trailingAnchor),
            collectionView.centerXAnchor.constraint(equalTo: scoreTitleStackView.centerXAnchor),
        ])
    }
    
    private func createTitleLabel(text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.text = text
        return label
    }
}

extension TotalRecordView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.scores.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TotalRecordCell.id, for: indexPath) as? TotalRecordCell else { return UICollectionViewCell() }
        let score = viewModel.scores[indexPath.row]
        cell.configure(
            rankLabel: "\(score.rank)",
            teamLabel: score.team,
            roundLabel: "\(score.round)",
            winLabel: "\(score.win)",
            drawLabel: "\(score.draw)",
            lossLabel: "\(score.loss)",
            pointLabel: "\(score.point)",
            gfLabel: "\(score.gf)",
            gaLabel: "\(score.ga)",
            gdLabel: "\(score.gd)"
        )
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          let width = collectionView.bounds.width
          return CGSize(width: width, height: 40)
      }
}
