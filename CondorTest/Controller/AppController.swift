//
//  AppController.swift
//  CondorTest
//
//  Created by Mario Rúa on 2/9/19.
//  Copyright © 2019 Mario Rúa. All rights reserved.
//

import Foundation
import UIKit

public class AppController
{
    let leagueViewController: LeagueTeamsViewController
    let leagueTeamsViewModel: LeagueTeamsViewModel
    let navigationController: UINavigationController
    
    public init(navigationController: UINavigationController)
    {
        let repository: SportRepository! = AppDelegate.diContainer.resolve(SportRepository.self);
        
        self.leagueTeamsViewModel = LeagueTeamsViewModel(repository: repository!)
        self.navigationController = navigationController
        self.leagueViewController = LeagueTeamsViewController(viewModel: leagueTeamsViewModel)
    }
    
    func start() {
        leagueTeamsViewModel.isLoading.value = true
        leagueTeamsViewModel.isTableViewHidden.value = true
        navigationController.pushViewController(leagueViewController, animated: true)
    }
}
