//
//  StartScreenViewController.swift
//  XO-game
//
//  Created by Федор Филимонов on 12.11.2020.
//  Copyright © 2020 plasmon. All rights reserved.
//

import UIKit

class StartScreenViewController: UIViewController {
    
    private var gameMode = GameModeSingleton.shared.mode

    @IBAction func startGameVsFriendButtonTapped(_ sender: Any) {
        gameMode = .pvc
        performSegue(withIdentifier: "StartGameSegue", sender: nil)
    }
    
    @IBAction func startGameVsComputerButtonTapped(_ sender: Any) {
        gameMode = .pvp
        performSegue(withIdentifier: "StartGameSegue", sender: nil)
    }

}
