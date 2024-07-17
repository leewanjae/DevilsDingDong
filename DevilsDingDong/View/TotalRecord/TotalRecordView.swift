//
//  TotalRecordView.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 6/11/24.
//

import UIKit
import SnapKit

class TotalRecordView: UIViewController {
    private let viewModel = TotalRecordViewModel()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TotalRecordCell.self, forCellWithReuseIdentifier: TotalRecordCell.id)
        collectionView.backgroundColor = .white
        collectionView.layer.cornerRadius = 12
        collectionView.showsVerticalScrollIndicator = false
        collectionView.layer.shadowOpacity = 0.1
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()

    private lazy var scoreTitleStackView: UIStackView = {
        let titles = ["순위", "팀", "경기", "승", "무", "패", "승점", "득실"]
        let labels = titles.map { createTitleLabel(text: $0) }
        let stackView = UIStackView(arrangedSubviews: labels)
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setAutoLayout()
        bindViewModel()
    }
}

// MARK: - UI Methods
extension TotalRecordView {
    private func setUI() {
        view.backgroundColor = .bgColor
        navigationItem.title = "리그 순위"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(scoreTitleStackView)
        view.addSubview(collectionView)
    }
    
    private func setAutoLayout() {
        let safeArea = view.safeAreaLayoutGuide
        scoreTitleStackView.snp.makeConstraints {
            $0.top.equalTo(safeArea.snp.top).offset(20)
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(scoreTitleStackView.snp.bottom).offset(10)
            $0.bottom.equalTo(safeArea.snp.bottom)
            $0.leading.trailing.equalTo(scoreTitleStackView)
        }
    }
    
    private func bindViewModel() {
        viewModel.fetchScoreData()
        viewModel.viewUpdateCloser = { [ weak self] in
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
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

// MARK: - Delegate
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
        let isFirstCell = indexPath.item == 0
        let isLastCell = indexPath.item == collectionView.numberOfItems(inSection: indexPath.section) - 1
        cell.configure(
            rankLabel: "\(score.rank)",
            teamLabel: score.team,
            roundLabel: "\(score.round)",
            winLabel: "\(score.win)",
            drawLabel: "\(score.draw)",
            lossLabel: "\(score.loss)",
            pointLabel: "\(score.point)",
            gdLabel: "\(score.gd )",
            logoURL: score.team, 
            isFirstCell: isFirstCell,
            isLastCell: isLastCell
            
        )
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          let width = collectionView.bounds.width
          return CGSize(width: width, height: 80)
      }
}
