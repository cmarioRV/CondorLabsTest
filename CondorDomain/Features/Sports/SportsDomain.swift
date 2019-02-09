//
//  SportsDomain.swift
//  CondorTest
//
//  Created by Mario Rúa on 2/9/19.
//  Copyright © 2019 Mario Rúa. All rights reserved.
//

import Foundation

class SportsDomain
{
    let sportsRepository: SportRepository
    
    init(sportsRepository: SportRepository) {
        self.sportsRepository = sportsRepository
    }
    
    func fetchLeagueTeams(league: String, complete: @escaping ([Team]) -> Void) {
        sportsRepository.fetchLeagueTeams(league: league, complete: {(teams) in
            complete(teams)
        })
    }
    
    func fetchTeamInformation(team: String, complete: @escaping (Team) -> Void) {
        sportsRepository.fetchTeamInformation(team: team, complete: {(team) in
            complete(team)
        })
    }
}
