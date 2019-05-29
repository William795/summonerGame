//
//  Summon.swift
//  summonerGame
//
//  Created by William Moody on 5/27/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import UIKit

struct Summon {
    var health: Int
    let maxHealth: Int
    let size: Int
    var attack: Int
    let cost: Int
    var abilityActive: Bool = false
    let ability: String? 
    let summonImage: UIImage
    let name: String
    
}
//    init(health: Int, size: Int, attack: Int, cost: Int, ability: String?, summonImage: UIImage) {
//        self.health = health
//        self.size = size
//        self.attack = attack
//        self.cost = cost
//        self.ability = ability
//        self.summonImage = summonImage
//    }
