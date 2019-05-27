//
//  Player.swift
//  summonerGame
//
//  Created by William Moody on 5/27/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import UIKit

class Player {
    var currentHealth: Int
    var maxHealth: Int
    var currentMana: Int
    var maxMana: Int
    var currentSummons: Int
    var maxSummons: Int
    let playerImage: UIImage?
    var summonArray: [Summon]
    
    init(currentHealth: Int, maxHealth: Int, currentMana: Int, maxMana: Int, currentSummons: Int, maxSummons: Int, playerImage: UIImage, summonArray: [Summon]) {
        self.currentHealth = currentHealth
        self.maxHealth = maxHealth
        self.currentMana = currentMana
        self.maxMana = maxMana
        self.currentSummons = currentSummons
        self.maxSummons = maxSummons
        self.playerImage = playerImage
        self.summonArray = summonArray
    }
}
