//
//  MonsterMoveController.swift
//  summonerGame
//
//  Created by William Moody on 5/29/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import UIKit

//NotificationCenter.default.addObserver(self, selector: #selector, name: "Silly Warrior", object: nil)

class MonsterMoveController {
    
    static let sharedMove = MonsterMoveController()
    
    //MARK: boss variables
    var explosiveArrorReady = true
    
    var palidinHeal = true
    
    var brawlerDrunkeness = 0
    
    func resetBossVariables() {
        explosiveArrorReady = true
        palidinHeal = true
        brawlerDrunkeness = 0
    }
    
    func moveSelector(monster: Monster) {

        switch monster.moveSetNumber {
        case 1:
            sillyWarriorMoves()
        case 2:
            ArcherCaptain()
        case 3:
            crusadingPalidin()
        case 4:
            fireMage()
        case 5:
            drunkenBrawler()
        default:
            return
        }
    }
    
    //MARK: bosses
    
    func sillyWarriorMoves() {
        let warrior = MonsterController.sharedMonster.sillyWarrior
        warrior.battleText = ""
        if warrior.health > 30 {
            switch warrior.moveNumber {
            case 1:
                warrior.attackSize = 5
                warrior.attackDamage = 1
            case 2:
                warrior.attackSize = 1
                warrior.attackDamage = 8
            case 3:
                warrior.attackSize = 2
                warrior.attackDamage = 3
            default:
                return
            }
        }else {
            warrior.attackSize = 5
            warrior.attackDamage = 4
            warrior.battleText = "why wont you DIE"
        }
        warrior.moveNumber += 1
        warrior.moveNumber == 4 ? warrior.moveNumber = 1 : nil
    }
    
    func ArcherCaptain() {
        let archer = MonsterController.sharedMonster.ArcherCaptain
        archer.moveNumber += 1
        archer.battleText = ""
        
        if archer.health > 70  {
            switch archer.moveNumber {
            case 1:
                archer.attackSize = 1
                archer.attackDamage = 8
            case 2:
                archer.attackSize = 3
                archer.attackDamage = 3
            case 3:
                archer.attackSize = 2
                archer.attackDamage = 5
                archer.moveNumber = 0
            default:
                return
            }
        }else if explosiveArrorReady {
            archer.attackSize = 10
            archer.attackDamage = 5
            explosiveArrorReady = false
            archer.battleText = "'huff' fine TAKE THIS"
        }else {
            archer.attackSize = 0
            archer.attackDamage = 0
            explosiveArrorReady = true
            archer.battleText = "now where is that spare"
        }
    }
    
    func crusadingPalidin() {
        let palidin = MonsterController.sharedMonster.crusadingPalidin
        palidin.battleText = ""
        
        if palidin.health < 100 && palidinHeal {
            palidin.health = palidin.maxHealth
            palidin.battleText = "HEAL CRITICAL WOUNDS"
            palidinHeal = false
        }else {
            palidin.moveNumber += 1
        switch palidin.moveNumber {
        case 1:
            palidin.attackSize = 2
            palidin.attackDamage = 4
        case 2:
            palidin.attackSize = 4
            palidin.attackDamage = 2
        case 3:
            palidin.attackSize = 3
            palidin.attackDamage = 3
        case 4:
            palidin.attackSize = 4
            palidin.attackDamage = 10
            palidin.moveNumber = 1
            palidin.battleText = "DIVINE SMITE"
        default:
            return
            }
        }
    }
    
    func fireMage() {
        let mage = MonsterController.sharedMonster.fireMage
        mage.battleText = ""
        
        switch mage.moveNumber {
        case 1:
            mage.attackSize = 8
            mage.attackDamage = 2
        case 2:
            mage.attackSize = 6
            mage.attackDamage = 14
            mage.battleText = "burn, Burn, BURN!"
        case 3:
            mage.attackSize = 8
            mage.attackDamage = 6
        case 4:
            mage.attackSize = 7
            mage.attackDamage = 7
        case 5:
            mage.attackSize = 8
            mage.attackDamage = 4
        case 6:
            mage.attackSize = 4
            mage.attackDamage = 6
        case 7:
            mage.attackSize = 4
            mage.attackDamage = 4
        case 8:
            mage.attackSize = 4
            mage.attackDamage = 8
        case 9:
            mage.attackSize = 1
            mage.attackDamage = 1
            mage.battleText = "no more fire?..."
        default:
            return
        }
        mage.moveNumber += 1
    }
    
    func drunkenBrawler() {
        let brawler = MonsterController.sharedMonster.drunkenBrawler
        brawler.battleText = ""
        
        switch brawler.moveNumber {
            
        case 1:
            brawler.attackSize = 6 + brawlerDrunkeness
            brawler.attackDamage = 2 + brawlerDrunkeness
        case 2:
            brawler.attackSize = 3 + brawlerDrunkeness
            brawler.attackDamage = 5 + brawlerDrunkeness
        case 3:
            brawler.attackSize = 4 + brawlerDrunkeness
            brawler.attackDamage = 5 + brawlerDrunkeness
        case 4:
            brawlerDrunkeness += 1
            brawler.health += 30
            brawler.moveNumber = 0
            brawler.battleText = "I need a drink 'Gulp'"
        default:
            return
        }
        brawler.moveNumber += 1
    }
}
