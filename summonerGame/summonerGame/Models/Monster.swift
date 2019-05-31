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
    var defeted: Bool
    let name: String
    let title: String
    let flavorText: String
    var battleText: String
    let difficulty: Int
    let difficultyImage: UIImage
    
    let moveSetNumber: Int
    var moveNumber: Int
    
    init(health: Int, maxHealth: Int, attackSize: Int, attackDamage: Int, monsterImage: UIImage, defeted: Bool = false, name: String, title: String,flavorText: String, battleText: String, difficulty: Int, difficultyImage: UIImage, moveSetNumber: Int, moveNumber: Int) {
        self.health = health
        self.maxHealth = maxHealth
        self.attackSize = attackSize
        self.attackDamage = attackDamage
        self.monsterImage = monsterImage
        self.defeted = defeted
        self.name = name
        self.title = title
        self.flavorText = flavorText
        self.battleText = battleText
        self.difficulty = difficulty
        self.difficultyImage = difficultyImage
        self.moveSetNumber = moveSetNumber
        self.moveNumber = moveNumber
    }
}
