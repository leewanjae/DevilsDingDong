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
        registerCell()
        totalRecordView.tableView.rowHeight = 67
        totalRecordView.tableView.estimatedRowHeight = 67

        bindViewModel()
    }
    
    // MARK: - UI
    
    private func registerCell() {
        totalRecordView.tableView.register(TotalRecordCell.self, forCellReuseIdentifier: TotalRecordCell.id)
    }
    
    // MARK: - Bind
    
    private func bindViewModel() {
        let input = TotalRecordViewModel.Input(fetchTrigger: Observable.just(()))
        let output = viewModel.transform(input: input, disposeBag: disposeBag)
        
        output.scores
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: {[weak self] scores in
                guard let self = self else { return }
                if scores.count >= 3 {
                    self.totalRecordView.rankerView1.configure(rank: "\(scores[0].rank)위", team: scores[0].team, logo: scores[0].team)
                    self.totalRecordView.rankerView2.configure(rank: "\(scores[1].rank)위", team: scores[1].team, logo: scores[1].team)
                    self.totalRecordView.rankerView3.configure(rank: "\(scores[2].rank)위", team: scores[2].team, logo: scores[2].team)
                }
            })
            .disposed(by: disposeBag)
        
        output.scores
            .observe(on: MainScheduler.instance)
            .bind(to: totalRecordView.tableView.rx.items(cellIdentifier: TotalRecordCell.id, cellType: TotalRecordCell.self)) { row, item, cell in
                cell.configure(
                    rank: "\(item.rank)",
                    team: item.team,
                    round: item.round,
                    win: "\(item.win)",
                    draw: "\(item.draw)",
                    loss: "\(item.loss)", point: "\(item.point)", gd: "\(item.gd)", logoImageName: item.team)
            }
            .disposed(by: disposeBag)
    }
}
