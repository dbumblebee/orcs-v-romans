//
//  Game.swift
//  orcs-v-romans
//
//  Created by Brian Bresen on 11/4/16.
//  Copyright © 2016 BeeHive Productions. All rights reserved.
//

import Foundation


class Game {
    private var _player1: Character
    private var _player2: Character
    
    var player1: Character {
        get {
            return _player1
        }
    }
    var player2: Character {
        get {
            return _player2
        }
    }
    
    var displayMessage: String?
    
    var isGameOver: Bool {
        if _player1.isAlive && _player2.isAlive {
            return false
        } else {
            return true
        }
    }
    
    init() {
        //aka LoadGame being called from ViewController viewDidLoad?
        // newGame()
        
        _player1 = Character(name: "Orc", startingHp: 30, attackPwr: 10)
        _player2 = Character(name: "Soldier", startingHp: 30, attackPwr: 10)
        
    }
    
    func doAttack(attacker: Character, target: Character) {
        if target.attemptAttack(attackPwr: attacker.attackPwr) {
            displayMessage = "\(attacker.name) attacks \(target.name) for \(attacker.attackPwr) damage"
        }
    }    
}
