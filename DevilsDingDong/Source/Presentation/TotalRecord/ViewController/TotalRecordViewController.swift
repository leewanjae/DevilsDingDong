//
//  TotalRecordViewController.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 8/21/24.
//

import UIKit
import RxSwift
import RxCocoa

class TotalRecordViewController: UIViewController {
    
    // MARK: - Properties
    
    private let viewModel = TotalRecordViewModel()
    private let disposeBag = DisposeBag()

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
            .bind(to: totalRecordView.collectionView.rx.items(cellIdentifier: TotalRecordCell.id, cellType: TotalRecordCell.self)) { index, score, cell in
                let isFirstCell = index == 0
                let isLastCell = index == (try! output.scores.value().count) - 1
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
            }
            .disposed(by: disposeBag)
    }
}

// MARK: - Delegate

extension TotalRecordViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        return CGSize(width: width, height: 80)
    }
}

