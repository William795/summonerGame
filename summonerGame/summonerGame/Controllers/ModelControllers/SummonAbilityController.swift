//
//  SummonAbilityController.swift
//  summonerGame
//
//  Created by William Moody on 5/30/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import Foundation


class SummonAbilityController {
    
    static let sharedAbility = SummonAbilityController()
    
    func useAbility(summon: Summon, player: Player, monster: Monster) {
        
        switch summon.abilityNumber {
        case 1:
            //MARK: Goblin Bard ability
            var summonArray: [Summon] = []
            for summon in player.summonArray {
                var summonChange = summon
                summonChange.attack += summon.abilityLevel
                summonArray.append(summonChange)
            }
            player.summonArray = summonArray
            
        case 2:
            //MARK: Archer ability
            monster.health -= summon.abilityLevel * 10
            
        case 3:
            //MARK: Dogo ability
            monster.attackDamage -= summon.abilityLevel
            if monster.attackDamage < 1 {
                monster.attackDamage = 1
            }
            
        case 4:
            //MARK: Slime ability
            monster.attackSize -= summon.abilityLevel
            if monster.attackSize < 0 {
                monster.attackSize = 0
            }
            
        default:
            return
        }
    }
}
