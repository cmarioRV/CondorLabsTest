//
//  CondorLabs.swift
//  CondorTest
//
//  Created by Mario Rúa on 2/9/19.
//  Copyright © 2019 Mario Rúa. All rights reserved.
//

import Foundation
import Moya

enum CondorLabs {
    case fetchTeams(league: String)
    case fetchTeamInfo(team: String)
}

extension CondorLabs: TargetType {
    var baseURL: URL {
        return URL(string: "https://www.thesportsdb.com/api/v1/json/1")!
    }
    
    var path: String {
        switch self {
        case .fetchTeams(_):
            return "/search_all_teams.php"
        case .fetchTeamInfo(_):
            return "/searchteams.php"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        switch self {
        case .fetchTeams(_):
            return "{{\"id\": \"1\", \"language\": \"Swift\", \"url\": \"https://api.github.com/repos/mjacko/Router\"}}".data(using: .utf8)!
        case .fetchTeamInfo(_):
            return "Half measures are as bad as nothing at all.".data(using: String.Encoding.utf8)!
        }
    }
    
    var task: Task {
//        switch self {
//        case .fetchTeamInfo(_):
//            return .requestParameters(parameters: parameters!, encoding: URLEncoding.default)
//        case .fetchTeams(_):
            return .requestParameters(parameters: parameters!, encoding: URLEncoding.default)
//        default:
//            return .requestPlain
//        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .fetchTeamInfo(team: let team):
            var parameters = [String: Any]()
            parameters["t"] = team
            return parameters
        case .fetchTeams(league: let league):
            var parameters = [String: Any]()
            parameters["l"] = league
            return parameters
        }
    }
}
