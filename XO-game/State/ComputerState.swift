//
//  ComputerState.swift
//  XO-game
//
//  Created by Федор Филимонов on 12.11.2020.
//  Copyright © 2020 plasmon. All rights reserved.
//

import Foundation

class ComputerState: GameState {
    var isMoveCompleted: Bool = false
    
    public let player: Player
    private weak var gameViewController: GameViewController?
    private weak var gameBoard: Gameboard?
    private weak var gameBoardView: GameboardView?
    
    public let markViewPrototype: MarkView
    
    let fieldFillingCounter: Int
    
    init(player: Player, gameViewController: GameViewController,
         gameBoard: Gameboard, gameBoardView: GameboardView, markViewPrototype: MarkView, fieldFillingCounter: Int) {
        self.player = player
        self.gameViewController = gameViewController
        self.gameBoard = gameBoard
        self.gameBoardView = gameBoardView
        self.markViewPrototype = markViewPrototype
        self.fieldFillingCounter = fieldFillingCounter
    }
    
    func begin() {
        switch player {
        case .first:
            gameViewController?.firstPlayerTurnLabel.isHidden = false
            gameViewController?.secondPlayerTurnLabel.isHidden = true
        case .second:
            gameViewController?.firstPlayerTurnLabel.isHidden = true
            gameViewController?.secondPlayerTurnLabel.isHidden = false
        }
        
        gameViewController?.winnerLabel.isHidden = true
    }
    
    func addMark(at position: GameboardPosition) {
        var computerPosition = position
        Log(action: .playerSetMark(player: player, position: computerPosition))
        
        guard let gameBoardView = gameBoardView else {
            return
        }
        
        while !gameBoardView.canPlaceMarkView(at: computerPosition), fieldFillingCounter < 9 { computerPosition.setRandom() }
        
        gameBoard?.setPlayer(player, at: computerPosition)
        gameBoardView.placeMarkView(markViewPrototype.copy(), at: computerPosition)
        isMoveCompleted = true
    }
}

