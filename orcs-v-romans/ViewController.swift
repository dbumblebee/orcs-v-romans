//
//  ViewController.swift
//  orcs-v-romans
//
//  Created by Brian Bresen on 11/4/16.
//  Copyright © 2016 BeeHive Productions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLbl: UILabel!
    
    @IBOutlet weak var player1AtkBtn: UIButton!
    
    @IBOutlet weak var player2AtkBtn: UIButton!
    
    var game = Game()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        restartGame()
    }

    @IBAction func doPlayer1Attack(_ sender: AnyObject) {
        if !game.isGameOver {
            game.doAttack(attacker: game.player1, target: game.player2)
            updateLbl()

            //disable other attack button for 3 secs
            player2AtkBtn.isEnabled = false
            Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: "attackDelay", userInfo: nil, repeats: false)
            if game.isGameOver {
                declareWinner()
            }
        } else {
            //game was over when we clicked button
            restartGame()
        }
    }
    
    @IBAction func doPlayer2Attack(_ sender: AnyObject) {
        if !game.isGameOver {
            game.doAttack(attacker: game.player2, target: game.player1)
            updateLbl()
            
            //disable other attack button for 3 secs
            player1AtkBtn.isEnabled = false
            Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: "attackDelay", userInfo: nil, repeats: false)
            if game.isGameOver {
                declareWinner()
            }
            
        } else {
            //game was over when we clicked button
            restartGame()
        }
    }
    
    func declareWinner() {
        if game.player1.isAlive {
            displayLbl.text = "\(game.player1.name) defeated \(game.player2.name)!"
        } else if game.player2.isAlive {
            displayLbl.text = "\(game.player2.name) defeated \(game.player1.name)!"
        }
    }
    
    func attackDelay() {
        player1AtkBtn.isEnabled = true
        player2AtkBtn.isEnabled = true
    }
    
    func updateLbl() {
        displayLbl.text = game.displayMessage
    }

    func restartGame() {
        game = Game()
        displayLbl.text = "Press attack to attack"
    }
}

