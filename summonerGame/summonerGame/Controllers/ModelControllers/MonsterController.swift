//
//  MonsterController.swift
//  summonerGame
//
//  Created by William Moody on 5/27/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import UIKit

class MonsterController {
    
    static let sharedMonster = MonsterController()
    
    var availableMonsterArray: [Monster]? = []
    
    var currentMonster: Monster?
    //CRUD
    
    
    var sillyWarrior = Monster(health: 11, maxHealth: 10, attackSize: 2, attackDamage: 2, monsterImage: UIImage(named: "Goblin")!, defeted: false, name: "Silly Warrior", title: "The Silly", flavorText: "A buffoon who happened to near a felled Great Dragon and subsequently got all the gloy for the deed", battleText: "", difficulty: 1, difficultyImage: UIImage(named: "Monster")!, moveSetNumber: 1, moveNumber: 1)
    
    var ArcherCaptain = Monster(health: 200, maxHealth: 200, attackSize: 1, attackDamage: 8, monsterImage: UIImage(named: "Goblin")!, defeted: false, name: "Archer Captain", title: "The Perfect Archer", flavorText: "Each shot made he endlessly praises himself for while 'conviently' forgetting every miss", battleText: "", difficulty: 2, difficultyImage: UIImage(named: "Goblin")!, moveSetNumber: 2, moveNumber: 1)
    
    var crusadingPalidin = Monster(health: 100, maxHealth: 200, attackSize: 2, attackDamage: 2, monsterImage: UIImage(named: "Goblin")!, defeted: false, name: "Crusading Palidin", title: "The bloodthirty 'saint'", flavorText: "'I SHAL REMOVE YOU FOUL BEINGS FROM THIS PLACE' said the palidin as he slew the peaceful goblin elder", battleText: "", difficulty: 3, difficultyImage: UIImage(named: "Goblin")!, moveSetNumber: 3, moveNumber: 1)
    
    var regalMage = Monster(health: 100, maxHealth: 200, attackSize: 4, attackDamage: 2, monsterImage: UIImage(named: "Goblin")!, defeted: false, name: "Regal Mage", title: "The Fancily Snobbish", flavorText: "After being jumped on by a large dirty dog they decreed that all dogs be executed", battleText: "", difficulty: 4, difficultyImage: UIImage(named: "Goblin")!, moveSetNumber: 4, moveNumber: 1)
    
    var drunkenBrawler = Monster(health: 100, maxHealth: 300, attackSize: 2, attackDamage: 6, monsterImage: UIImage(named: "Goblin")!, defeted: false, name: "Drunken Brawler", title: "The Drunkest of Punchers", flavorText: "Was declared a hero after brutally murddering a peaceful company of slimes wandering new a small village", battleText: "", difficulty: 5, difficultyImage: UIImage(named: "Goblin")!, moveSetNumber: 5, moveNumber: 1)
    
    func addToMonsterPool(monster: Monster){
        availableMonsterArray?.append(monster)
    }
    
    func takeDamage(amount: Int, monster: Monster) {
        monster.health -= amount
    }
    
    func decideAttack(monster: Monster) {
        for monsters in availableMonsterArray! {
            if monster.name == monsters.name {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "\(monster.name)"), object: nil)
            }
        }
    }
    
}
