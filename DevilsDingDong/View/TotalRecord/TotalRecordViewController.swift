//
//  TotalRecordViewController.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 8/21/24.
//

import UIKit

class TotalRecordViewController: UIViewController {
    private let viewModel = TotalRecordViewModel()
    private let totalRecordView = TotalRecordView()
    
    override func loadView() {
        view = totalRecordView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        registerCell()
        
        viewModel.viewUpdateCloser = { [weak self] in
            DispatchQueue.main.async {
                self?.totalRecordView.collectionView.reloadData()
            }
        }
    }
}

extension TotalRecordViewController {
    private func setUI() {
        navigationItem.title = "리그 순위"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        
        totalRecordView.collectionView.dataSource = self
        totalRecordView.collectionView.delegate = self
    }
    
    private func registerCell() {
        totalRecordView.collectionView.register(TotalRecordCell.self, forCellWithReuseIdentifier: TotalRecordCell.id)
    }
}

// MARK: - Delegate
extension TotalRecordViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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

