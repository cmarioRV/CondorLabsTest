//
//  Team.swift
//  CondorTest
//
//  Created by Mario Rúa on 2/9/19.
//  Copyright © 2019 Mario Rúa. All rights reserved.
//

import Foundation
import Mapper

struct Team: Mappable, Decodable {
    let name: String
    let stadium: String
    let description: String
    let foundation: String
    let teamBadge: String
    let webPage: String
    
    public enum CodingKeys: String, CodingKey {
        case name = "strTeam"
        case stadium = "strStadium"
        case teamBadge = "strTeamBadge"
        case description = "strStadiumDescription"
        case webPage = "strWebsite"
        case foundation = "intFormedYear"
    }
    
    init(map: Mapper) throws {
        try name = map.from("strTeam")
        try stadium = map.from("strStadium")
        try teamBadge = map.from("strTeamBadge")
        try description = map.from("strStadiumDescription")
        try webPage = map.from("strWebsite")
        try foundation = map.from("intFormedYear")
    }
}
