//
//  TeamCellViewModel.swift
//  CondorTest
//
//  Created by Mario Rúa on 2/8/19.
//  Copyright © 2019 Mario Rúa. All rights reserved.
//

import Foundation

struct TeamViewModel: CellViewModel {
    let name: String
    let stadium: String
    let teamBadge: String
    
    let description: String
    let foundation: String
    let webPage: String?
    
    var cellPressed: (()->Void)?
    
    init(name: String, stadium: String, teamBadge: String, description: String, webPage: String?, foundation: String) {
        self.name = name
        self.stadium = stadium
        self.teamBadge = teamBadge
        self.description = description
        self.webPage = webPage
        self.foundation = foundation
    }
}
