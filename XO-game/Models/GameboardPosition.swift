//
//  GameBoardPosition.swift
//  XO-game
//
//  Created by Evgeny Kireev on 26/02/2019.
//  Copyright © 2019 plasmon. All rights reserved.
//

import Foundation

public struct GameboardPosition: Hashable {
    
    public var column: Int
    public var row: Int
    
    mutating func setRandom() {
        column = Int.random(in: 0...2)
        row = Int.random(in: 0...2)
    }
}
