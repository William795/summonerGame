//
//  Monster.swift
//  summonerGame
//
//  Created by William Moody on 5/27/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import UIKit

class Monster {
    var health: Int
    let maxHealth: Int
    var attackSize: Int
    var attackDamage: Int
    let monsterImage: UIImage
    let defeted: Bool
    
    init(health: Int, maxHealth: Int, attackSize: Int, attackDamage: Int, monsterImage: UIImage, defeted: Bool = false) {
        self.health = health
        self.maxHealth = maxHealth
        self.attackSize = attackSize
        self.attackDamage = attackDamage
        self.monsterImage = monsterImage
        self.defeted = defeted
    }
}
