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
    var size: Int
    var attack: Int
    let cost: Int
    let summonImage: UIImage
    let name: String
    
    let ability: String?
    var abilityActive: Bool = false
    let abilityCost: Int
    let abilityCoolDown: Int
    let abilityImage: UIImage
    let abilityNumber: Int
    var abilityLevel: Int
    var abilityCoolDownRemaining: Int
    
}
//    init(health: Int, size: Int, attack: Int, cost: Int, ability: String?, summonImage: UIImage) {
//        self.health = health
//        self.size = size
//        self.attack = attack
//        self.cost = cost
//        self.ability = ability
//        self.summonImage = summonImage
//    }
