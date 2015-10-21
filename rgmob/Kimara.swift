//
//  Kimara.swift
//  rgmob
//
//  Created by Jim Aven on 10/21/15.
//  Copyright © 2015 Jim Aven. All rights reserved.
//

import Foundation

class Kimara:Enemy {
    
    let IMMUNE_MAX = 15
    
    override var loot:[String] {
        return ["Tough Hide", "Kimara venom", "Rare Trident"]
    }
    
    override var type:String {
        return "Kimara"
    }
    
    override func attemptAccack(attackPwr: Int) -> Bool {
        if attackPwr >= IMMUNE_MAX {
            return super.attemptAccack(attackPwr)
        }
        else {
            return false
        }
    }
    
}
