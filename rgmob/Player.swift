//
//  Player.swift
//  rgmob
//
//  Created by Jim Aven on 10/21/15.
//  Copyright © 2015 Jim Aven. All rights reserved.
//

import Foundation

class Player:Character {
    
    private var _name = "Player"
    
    var name:String {
        get {
            return _name
        }
    }
    
    
    private var _inventory = [String]()
    
    var inventory:[String] {
        return _inventory
    }
    
    convenience init (name:String, hp:Int, attackPwr:Int){
        self.init(startingHp:hp, attackPwr:attackPwr)
        
        _name = name
    }
    
    func addItemToInventory(item:String){
        _inventory.append(item)
    }
    
}
