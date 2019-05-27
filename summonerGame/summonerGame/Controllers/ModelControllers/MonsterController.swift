//
//  MonsterController.swift
//  summonerGame
//
//  Created by William Moody on 5/27/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import UIKit

class MonsterController {
    
    static let sharedMonster = MonsterController()
    
    //CRUD
    
    
    
    var sillyWarrior = Monster(health: 100, attackSize: 2, attackDamage: 3, monsterImage: UIImage(named: "Monster")!)
    
    
    func createMonster(){
        
        //set monster stats
        
    }
    
    func updateMonster(){
        //check if its dead
        
        //check for hidden conditions
        
        //move to next attack
    }
    
    func takeDamage(amount: Int) {
        sillyWarrior.health -= amount
    }
    
}
