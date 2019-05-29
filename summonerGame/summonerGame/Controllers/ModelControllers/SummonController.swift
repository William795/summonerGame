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
        let goblinPlus = Summon(health: 5, maxHealth: 7, size: 1, attack: 3, cost: 1, abilityActive: true, ability: "Buff attack of all summons", summonImage: UIImage(named: "Goblin")!, name: "Goblin")
        
        let archerPlus = Summon(health: 3, maxHealth: 4, size: 1, attack: 6, cost: 1, abilityActive: true, ability: "Snipe Monster", summonImage: UIImage(named: "Archer")!, name: "Archer")
        
        let doggoPlus = Summon(health: 8, maxHealth: 10, size: 3, attack: 4, cost: 3, abilityActive: true, ability: "decrease monster attack damage", summonImage: UIImage(named: "Dog")!, name: "Doggo")
        
        let slimaPlus = Summon(health: 7, maxHealth: 10, size: 2, attack: 1, cost: 1, abilityActive: true, ability: "decrease monster attack size", summonImage: UIImage(named: "Slime")!, name: "Slime")
        
        return [goblinPlus, archerPlus, doggoPlus, slimaPlus]
    }
    
    
    //MARK: all summons

    var golblin = Summon(health: 4, maxHealth: 5, size: 1, attack: 2, cost: 1, abilityActive: false, ability: "Buff attack of all summons", summonImage: UIImage(named: "Goblin")!, name: "Goblin")

    var archer = Summon(health: 2, maxHealth: 3, size: 1, attack: 4, cost: 1, abilityActive: false, ability: "Snipe Monster", summonImage: UIImage(named: "Archer")!, name: "Archer")
    
    var doggo = Summon(health: 6, maxHealth: 6, size: 2, attack: 2, cost: 2, abilityActive: false, ability: "decrease monster attack damage", summonImage: UIImage(named: "Dog")!, name: "Doggo")
 
    var slima = Summon(health: 5, maxHealth: 8, size: 1, attack: 1, cost: 1, abilityActive: false, ability: "decrease monster attack size", summonImage: UIImage(named: "Slime")!, name: "Slime")
}


extension SummonController {
    

}
