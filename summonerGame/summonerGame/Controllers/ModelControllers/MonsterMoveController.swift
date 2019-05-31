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
    
    var explosiveArrorReady = true
    
    func moveSelector(monster: Monster) {
        
        switch monster.moveSetNumber {
        case 1:
            sillyWarriorMoves()
        case 2:
            ArcherCaptain()
        case 3:
            crusadingPalidin()
        case 4:
            regalMage()
        case 5:
            drunkenBrawler()
        default:
            return
        }
    }

    func sillyWarriorMoves() {
        let warrior = MonsterController.sharedMonster.sillyWarrior
        
        if warrior.health > 40 {
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
            warrior.attackDamage = 5
        }
        warrior.moveNumber += 1
        warrior.moveNumber == 4 ? warrior.moveNumber = 1 : nil
    }
    
    func ArcherCaptain() {
        let archer = MonsterController.sharedMonster.ArcherCaptain
        
        if archer.health > 50  {
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
            default:
                return
            }
        }else if explosiveArrorReady {
            archer.attackSize = 10
            archer.attackDamage = 5
        }else {
            explosiveArrorReady = true
        }
    }
    
    func crusadingPalidin() {
        
    }
    
    func regalMage() {
        
    }
    
    func drunkenBrawler() {
        
    }
}
