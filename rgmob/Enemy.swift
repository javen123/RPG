//
//  Enemy.swift
//  rgmob
//
//  Created by Jim Aven on 10/21/15.
//  Copyright © 2015 Jim Aven. All rights reserved.
//

import Foundation

class Enemy:Character {
    
    var loot:[String] {
        return ["Rusty Dagger", "Cracked Buckler"]
    }
    
    var type:String {
        return "Grunt"
    }
    
    func dropLoot() -> String? {
        if !isAlive {
            let rand = Int(arc4random_uniform(UInt32(loot.count)))
            return loot[rand]
        }
        
        return nil
    }
    
}
