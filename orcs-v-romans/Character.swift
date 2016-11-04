//
//  Character.swift
//  orcs-v-romans
//
//  Created by Brian Bresen on 11/4/16.
//  Copyright © 2016 BeeHive Productions. All rights reserved.
//

import Foundation

class Character {
    private var _hp: Int = 30
    private var _attackPwr: Int = 10
    private var _name: String = "Player"

    var hp: Int {
        get {
            return _hp
        }
    }
    
    var attackPwr: Int {
        get {
            return _attackPwr
        }
    }
    
    var name: String {
        get {
            return _name
        }
    }
    
    var isAlive: Bool {
        get {
            if hp <= 0 {
                return false
            } else {
                return true
            }
        }
    }
    
    init(name: String, startingHp: Int, attackPwr: Int) {
        self._name = name
        self._hp = startingHp
        self._attackPwr = attackPwr
    }

    func attemptAttack(attackPwr: Int) -> Bool {
        self._hp -= attackPwr

        return true
    }
    
}
