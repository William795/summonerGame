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
    

    
    let golblin = Summon(health: 4, size: 1, attack: 2, cost: 1, ability: nil, summonImage: UIImage(named: "placeHolder")!)
    
    func createSummon(summon: Summon) -> Summon{
        
        let newSummon = summon
        return newSummon
    }
    
    func takeDamage(amount: Int, summon: Summon) -> Summon{
        var changedSummon = summon
        changedSummon.health -= amount
        return changedSummon
    }
    
    
    
//    func updateSummon(summon:Summon) -> Summon {
//    }
    
    
}
