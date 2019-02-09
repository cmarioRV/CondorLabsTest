//
//  File.swift
//  CondorTest
//
//  Created by Mario Rúa on 2/9/19.
//  Copyright © 2019 Mario Rúa. All rights reserved.
//

import Foundation
import Mapper

struct Teams: Mappable, Decodable {
    let teams: [Team]
    
    init(map: Mapper) throws {
        try teams = map.from("teams")
    }
}
