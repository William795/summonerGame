//
//  SummonController.swift
//  summonerGame
//
//  Created by William Moody on 5/27/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import UIKit

class SummonController {
    
    static let sharedSummon = SummonController()
    
    
    var availableSummonArray: [Summon]? = []
    
    //array of upgraded summons
   // var upgradedSummonsArray: [Summon]? = []
    
    //Adding new summons to summons to choose from
    func addToAvailablePool(summon: Summon) {
        availableSummonArray?.append(summon)
    }
    
    // summoning summons onto battle field
    func createSummon(summon: Summon) -> Summon{
        
        let newSummon = summon
        return newSummon
    }
    
    func takeDamage(amount: Int, summon: Summon) -> Summon{
        var changedSummon = summon
        changedSummon.health -= amount
        return changedSummon
    }
    
    //activating abilitys of summons
    func UpgradeSummon(summon: Summon) {
        var indexInt = 0
        for summons in upgradedSummonsArray {
            if summon.name == summons.name {
                availableSummonArray?.insert(summons, at: indexInt + 1)
                availableSummonArray?.remove(at: indexInt)
            }
            indexInt += 1
        }
    }
    
    var upgradedSummonsArray: [Summon]{
        let goblinPlus = Summon(health: 5, maxHealth: 7, size: 1, attack: 3, cost: 1, summonImage: UIImage(named: "Goblin")!, name: "Goblin", ability: "Buff attack of all summons", abilityActive: true, abilityCost: 1, abilityCoolDown: 0, abilityImage: UIImage(named: "Goblin")!, abilityNumber: 1, abilityLevel: 1, abilityCoolDownRemaining: 0)
        
        let archerPlus = Summon(health: 3, maxHealth: 4, size: 1, attack: 6, cost: 1, summonImage: UIImage(named: "Archer")!, name: "Archer", ability: "deals damage", abilityActive: true, abilityCost: 1, abilityCoolDown: 0, abilityImage: UIImage(named: "Archer")!, abilityNumber: 2, abilityLevel: 1, abilityCoolDownRemaining: 0)
        
        let doggoPlus = Summon(health: 8, maxHealth: 10, size: 3, attack: 4, cost: 2, summonImage: UIImage(named: "Dog")!, name: "Doggo", ability: "Decrease Monster damage", abilityActive: true, abilityCost: 1, abilityCoolDown: 0, abilityImage: UIImage(named: "Dog")!, abilityNumber: 3, abilityLevel: 1, abilityCoolDownRemaining: 0)
        
        let slimaPlus = Summon(health: 7, maxHealth: 10, size: 2, attack: 1, cost: 1, summonImage: UIImage(named: "Slime")!, name: "Slime", ability: "decrease Monster attack size", abilityActive: true, abilityCost: 2, abilityCoolDown: 1, abilityImage: UIImage(named: "Slime")!, abilityNumber: 4, abilityLevel: 1, abilityCoolDownRemaining: 0)
        
        return [goblinPlus, archerPlus, doggoPlus, slimaPlus]
    }
    
    
    //MARK: all summons

    var golblin = Summon(health: 4, maxHealth: 5, size: 1, attack: 2, cost: 1, summonImage: UIImage(named: "Goblin")!, name: "Goblin", ability: "Buff attack of all summons", abilityActive: false, abilityCost: 1, abilityCoolDown: 0, abilityImage: UIImage(named: "Goblin")!, abilityNumber: 1, abilityLevel: 1, abilityCoolDownRemaining: 0)

    var archer = Summon(health: 2, maxHealth: 3, size: 1, attack: 4, cost: 1, summonImage: UIImage(named: "Archer")!, name: "Archer", ability: "Snipe", abilityActive: false, abilityCost: 1, abilityCoolDown: 0, abilityImage: UIImage(named: "Archer")!, abilityNumber: 2, abilityLevel: 1, abilityCoolDownRemaining: 0)
    
    var doggo = Summon(health: 6, maxHealth: 7, size: 2, attack: 2, cost: 2, summonImage: UIImage(named: "Dog")!, name: "Doggo", ability: "decrease monster damage", abilityActive: false, abilityCost: 1, abilityCoolDown: 1, abilityImage: UIImage(named: "Dog")!, abilityNumber: 3, abilityLevel: 1, abilityCoolDownRemaining: 0)
 
    var slima = Summon(health: 5, maxHealth: 8, size: 1, attack: 1, cost: 1, summonImage: UIImage(named: "Slime")!, name: "Slime", ability: "decrease monster attack szie", abilityActive: false, abilityCost: 1, abilityCoolDown: 1, abilityImage: UIImage(named: "Slime")!, abilityNumber: 4, abilityLevel: 1, abilityCoolDownRemaining: 0)
}

