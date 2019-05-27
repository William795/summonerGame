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
    var attackSize: Int
    var attackDamage: Int
    let monsterImage: UIImage
    
    init(health: Int, attackSize: Int, attackDamage: Int, monsterImage: UIImage) {
        self.health = health
        self.attackSize = attackSize
        self.attackDamage = attackDamage
        self.monsterImage = monsterImage
    }
}
