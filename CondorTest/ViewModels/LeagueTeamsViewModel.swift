//
//  LeagueTeamsViewModels.swift
//  CondorTest
//
//  Created by Mario Rúa on 2/8/19.
//  Copyright © 2019 Mario Rúa. All rights reserved.
//

import Foundation

public class LeagueTeamsViewModel
{
    let cellViewModels = Observable<[TeamViewModel]>(value: [])
    let repository: SportRepository
    let isLoading = Observable<Bool>(value: false)
    let isTableViewHidden = Observable<Bool>(value: false)
    
    init(repository: SportRepository)
    {
        self.repository = repository
    }
    
    var numberOfCells: Int {
        return cellViewModels.value.count
    }
    
    func getLeague(league: String = "English Premier League")
    {
        repository.fetchLeagueTeams(league: league, complete: {[weak self] (teams) in
            self?.isLoading.value = false
            self?.isTableViewHidden.value = false
            self?.buildCellViewModels(teams: teams)
        })
    }
    
    private func buildCellViewModels(teams: [Team]) {
        var viewModels = [TeamViewModel]()
        for team in teams {
            let cellViewModel: TeamViewModel = TeamViewModel(name: team.name, stadium: team.stadium, teamBadge: team.teamBadge, description: team.description, webPage: team.webPage, foundation: team.foundation)
                viewModels.append(cellViewModel)
        }
        
        cellViewModels.value = viewModels
    }
}
