//
//  TotalRecordViewController.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 8/21/24.
//

import UIKit
import RxSwift

class TotalRecordViewController: UIViewController {
    
    // MARK: - Properties
    
    private let viewModel = TotalRecordViewModel()
    private let disposeBag = DisposeBag()
    private var currentScores: [Score] = []

    // MARK: - Componets
    
    private let totalRecordView = TotalRecordView()
    
    //MARK: - Life Cycle

    override func loadView() {
        view = totalRecordView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        registerCell()
        bindViewModel()
    }

    // MARK: - UI
    
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
    
    // MARK: - Bind
    
    private func bindViewModel() {
        let input = TotalRecordViewModel.Input(fetchTrigger: Observable.just(()))
        let output = viewModel.transform(input: input, disposeBag: disposeBag)
        
        output.scores
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] scores in
                self?.currentScores = scores
                self?.totalRecordView.collectionView.reloadData()
            })
            .disposed(by: disposeBag)
        
        output.error
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { error in
                if let error = error {
                    print("Error: \(error)")
                }
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - Delegate

extension TotalRecordViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentScores.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TotalRecordCell.id, for: indexPath) as? TotalRecordCell else { return UICollectionViewCell() }
        let score = currentScores[indexPath.row]
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

