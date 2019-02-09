//
//  RealSportRepository.swift
//  CondorTest
//
//  Created by Mario Rúa on 2/8/19.
//  Copyright © 2019 Mario Rúa. All rights reserved.
//

import Foundation
import Moya

public class RealSportRepository : SportRepository
{
    let provider = MoyaProvider<CondorLabs>()
    
    func fetchLeagueTeams(league: String, complete: @escaping (([Team]) -> Void)) {
        DispatchQueue.global().async {
            self.provider.request(.fetchTeams(league: league)) { result in
                switch result {
                case let .success(response):
                    do {
                        let json = try response.map(Teams.self) as Teams
                        complete(json.teams)
                    } catch {
                        print(error)
                    }
                case let .failure(error):
                        print(error)
                }
            }
        }
    }
    
    func fetchTeamInformation(team: String, complete: @escaping ((Team) -> Void)) {
        
    }
}
