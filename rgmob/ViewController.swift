//
//  ViewController.swift
//  rgmob
//
//  Created by Jim Aven on 10/21/15.
//  Copyright © 2015 Jim Aven. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var printLabel: UILabel!
    
    @IBOutlet weak var playerHpLabel: UILabel!
    
    @IBOutlet weak var enemyHpLabel: UILabel!
    
    @IBOutlet weak var btnChest: UIButton!
    
    @IBOutlet weak var playerImg: UIImageView!
    
    @IBOutlet weak var enemyImg: UIImageView!
    
    var player:Player!
    var enemy:Enemy!
    var chestMessage:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.player = Player(name: "Avenious", hp: 110, attackPwr: 20)
        self.playerHpLabel.text = "\(player.hp) HP"
        
        self.generateRandomEnemy()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ctnChestPressed(sender: UIButton) {
        self.btnChest.hidden = true
        self.printLabel.text = chestMessage
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "generateRandomEnemy", userInfo: nil, repeats: false)
    }
    
    @IBAction func btnAttackPressed(sender: UIButton) {
        
        if self.enemy.attemptAccack(self.player.attackPwr){
            self.printLabel.text = "Attacked \(self.enemy.type) for \(self.player.attackPwr) HP"
            self.enemyHpLabel.text = "\(self.enemy.hp) HP"
        }
        else {
            printLabel.text = "Attack unsuccessful"
        }
        
        print(self.enemy.dropLoot())
        
        if let loot = self.enemy.dropLoot() {
            self.player.addItemToInventory(loot)
            self.chestMessage = "\(self.player.name) found \(loot)"
            self.btnChest.hidden = false
        }
        
        if !self.enemy.isAlive {
            self.enemyHpLabel.text = ""
            self.printLabel.text = "Killed \(self.enemy.type)"
            self.enemyImg.hidden = true
        }
        
    }
    func generateRandomEnemy() {
        let rand = Int(arc4random_uniform(2))
        
        if rand == 0 {
            self.enemy = Kimara(startingHp:50, attackPwr:12)
        }
        else {
            self.enemy = DevilWizard(startingHp: 60, attackPwr:15)
        }
        
        self.enemyImg.hidden = false
    }

}

