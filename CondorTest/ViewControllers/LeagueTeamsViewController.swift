//
//  LeagueTeamsTableViewController.swift
//  CondorTest
//
//  Created by Mario Rúa on 2/9/19.
//  Copyright © 2019 Mario Rúa. All rights reserved.
//

import Foundation
import UIKit

class LeagueTeamsViewController : UIViewController
{
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let viewModel: LeagueTeamsViewModel
    
    public init(viewModel: LeagueTeamsViewModel)
    {
        self.viewModel = viewModel
        super.init(nibName: String(describing: LeagueControllerView.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        initBinding()
        initTableView()
        viewModel.getLeague(league: "English Premier League")
    }

    private func initTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 40
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: TeamTableViewCell.cellIdentifier(), bundle: nil), forCellReuseIdentifier: TeamTableViewCell.cellIdentifier())
    }
    
    private func initBinding() {
        viewModel.cellViewModels.valueChanged = { [weak self] (_) in
            self?.tableView.reloadData()
        }
        
        self.tableView.isHidden = viewModel.isTableViewHidden.value
        viewModel.isTableViewHidden.valueChanged = { [weak self] (isHidden) in
            self?.tableView.isHidden = isHidden
        }
        
        viewModel.isLoading.valueChanged = { [weak self] (isLoading) in
            self?.setLoading(isLoading: isLoading)
        }
    }
    
    private func setLoading(isLoading: Bool) {
        if isLoading {
            self.activityIndicator.startAnimating()
        }
        else {
            self.activityIndicator.stopAnimating()
        }
    }
}

extension LeagueTeamsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cellViewModels.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let rowViewModel = viewModel.cellViewModels.value[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier(for: rowViewModel), for: indexPath)
        
        if let cell = cell as? CellConfigurable {
            cell.setup(viewModel: rowViewModel)
        }
        
        cell.layoutIfNeeded()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rowViewModel = viewModel.cellViewModels.value[indexPath.row]
        
        let detailViewController = TeamDetailViewController(viewModel: rowViewModel)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func cellIdentifier(for viewModel: CellViewModel) -> String {
        switch viewModel {
        case is TeamViewModel:
            return TeamTableViewCell.cellIdentifier()
        default:
            fatalError("Unexpected view model type: \(viewModel)")
        }
    }
}
