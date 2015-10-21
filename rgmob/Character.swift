//
//  Character.swift
//  rgmob
//
//  Created by Jim Aven on 10/21/15.
//  Copyright © 2015 Jim Aven. All rights reserved.
//

import Foundation

class Character {
    
    private var _hp:Int = 100
    private var _attackPwr:Int = 12
    
    var attackPwr:Int {
        get {
            return _attackPwr
        }
    }
    
    var hp:Int {
        get {
            return _hp
        }
    }
    
    var isAlive: Bool {
        get{
            if hp <= 0 {
                return false
            }
            else {
                return true
            }
        }
    }
    
    init(startingHp:Int, attackPwr:Int) {
        self._hp = startingHp
        self._attackPwr = attackPwr
    }
    
    func attemptAccack(attackPwr: Int) -> Bool {
        self._hp -= attackPwr
        return true
    }
    
    
}
