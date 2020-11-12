//
//  GameModeSingleton.swift
//  XO-game
//
//  Created by Федор Филимонов on 12.11.2020.
//  Copyright © 2020 plasmon. All rights reserved.
//

import Foundation

class GameModeSingleton {
    static let shared = GameModeSingleton()
    var mode: GameModeTypes = .pvc
}

enum GameModeTypes {
    case pvp, pvc
}
