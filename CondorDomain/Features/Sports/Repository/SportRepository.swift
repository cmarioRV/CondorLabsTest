//
//  SportRepository.swift
//  CondorTest
//
//  Created by Mario Rúa on 2/8/19.
//  Copyright © 2019 Mario Rúa. All rights reserved.
//

import Foundation

protocol SportRepository {
    func fetchLeagueTeams(league: String, complete: @escaping (([Team]) -> Void))
    func fetchTeamInformation(team: String, complete: @escaping ((Team) -> Void))
}
