//
//  PlayerController.swift
//  summonerGame
//
//  Created by William Moody on 5/27/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import UIKit

class PlayerController {
    
    //base player stats
    var currentPlayer = Player(currentHealth: 20, maxHealth: 20, currentMana: 5, maxMana: 5, currentSummons: 0, maxSummons: 4, playerImage: UIImage(named: "placeHolder")!, summonArray: [])
    
    static let sharedPlayer = PlayerController()
    
    //CRUD
    //implement this later with cutom characters
//    func createPlayer (){
//        //set player stats
//        let newPlayer = Player(currentHealth: 20, maxHealth: 20, currentMana: 5, maxMana: 5, currentSummons: 0, maxSummons: 3, playerImage: UIImage(named: "placeHolder")!)
//        currentPlayer = newPlayer
//    }
    
    func newPlayerTurn (player: Player) {
        
        if player.currentMana < player.maxMana {
            player.currentMana += player.maxMana / 5
        }
        updatePlayer(player: player)
        //update stats based on upkeep gains and losses
    }
    
    func updatePlayer(player: Player){
        //determine current players health, mana, summon count
        currentPlayer.currentHealth = player.currentHealth
        currentPlayer.currentSummons = player.currentSummons
        currentPlayer.currentMana = player.currentMana
        currentPlayer.summonArray = player.summonArray
    }
    
    func createMinion(summon: Summon, player: Player) ->Summon? {
        
        //check summon count
        if player.currentSummons > player.maxSummons {
            return nil
        }
        //check summon cost
        if summon.cost > player.currentMana {
            return nil
        }
        player.currentMana -= summon.cost
        player.currentSummons += 1
        
        player.summonArray.append(summon)
        
        updatePlayer(player: player)
        //place summon on board
        return summon
    }
    
    func takeDamage (amount: Int, player: Player){
        //reduce health by amount taken
        player.currentHealth -= amount
        
        updatePlayer(player: player)
    }
}
