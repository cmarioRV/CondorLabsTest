//
//  DependencyRegister.swift
//  CondorTest
//
//  Created by Mario Rúa on 2/9/19.
//  Copyright © 2019 Mario Rúa. All rights reserved.
//

import Foundation
import Swinject

public class DependencyRegister
{
    static func registerTypes(container: Container) {
        
        if (ProcessInfo.processInfo.environment["MOCKS"] != nil) {
            container.register(SportRepository.self) {_ in MockSportRepository()}.inObjectScope(.container)
        }
        else {
            container.register(SportRepository.self) {_ in RealSportRepository()}.inObjectScope(.container)
        }
        
        container.register(SportsDomain.self) {r in
            SportsDomain(sportsRepository: r.resolve(SportRepository.self)!)
        }
    }
}
