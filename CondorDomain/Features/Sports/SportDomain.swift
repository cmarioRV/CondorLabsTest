//
//  SportDomain.swift
//  CondorTest
//
//  Created by Mario Rúa on 2/8/19.
//  Copyright © 2019 Mario Rúa. All rights reserved.
//

import Foundation

class SportDomain {
    let sportRepository: SportRepository
    
    init(repository: SportRepository) {
        self.sportRepository = repository
    }
    
    func fetchLeagueTeams(league: String) {
        self.sportRepository.fetchLeagueTeams(league: league)
    }
    
    func fetch(team: String) {
        self.sportRepository.fetchTeamInformation(team: team)
    }
}
