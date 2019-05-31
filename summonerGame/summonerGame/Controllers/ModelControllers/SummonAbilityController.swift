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
                summonChange.attack += 1
                summonArray.append(summonChange)
            }
            player.summonArray = summonArray
            
        case 2:
            //MARK: Archer ability
            monster.health -= summon.attack * 2
            
        case 3:
            //MARK: Dogo ability
            monster.attackDamage -= 1
            if monster.attackDamage < 1 {
                monster.attackDamage = 1
            }
            
        case 4:
            //MARK: Slime ability
            monster.attackSize -= 1
            if monster.attackSize < 0 {
                monster.attackSize = 0
            }
        case 5:
            var summonArray: [Summon] = []
            for summon in player.summonArray {
                var summonChange = summon
                summonChange.health += 1
                summonChange.health > summonChange.maxHealth ? summonChange.health = summonChange.maxHealth : nil
                summonArray.append(summonChange)
            }
            player.currentHealth < player.maxHealth ? player.currentHealth += 1 : nil
            player.summonArray = summonArray
            
        case 6:
            player.currentMana < player.maxMana ? player.currentMana += 1 : nil
            
        default:
            return
        }
    }
}
