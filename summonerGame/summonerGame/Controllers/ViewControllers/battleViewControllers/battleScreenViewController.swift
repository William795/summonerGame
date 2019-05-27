//
//  battleScreenViewController.swift
//  summonerGame
//
//  Created by William Moody on 5/27/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import UIKit

class battleScreenViewController: UIViewController {

    //monster UI
    
    @IBOutlet weak var monsterImageView: UIImageView!
    @IBOutlet weak var monsterHealthLabel: UILabel!
    @IBOutlet weak var monsterDamageLabel: UILabel!
    @IBOutlet weak var monsterSizeLabel: UILabel!
    
    
    //player UI
    
    @IBOutlet weak var playerHealthLabel: UILabel!
    @IBOutlet weak var playerManaLabel: UILabel!
    @IBOutlet weak var playerSummonLabel: UILabel!
    
    
    //summon UI
    //summon 1
    @IBOutlet weak var firstSummonImageView: UIImageView!
    @IBOutlet weak var firstSummonHealthLabel: UILabel!
    @IBOutlet weak var firstSummonDamageLabel: UILabel!
    @IBOutlet weak var firstSummonSizeLabel: UILabel!
    
    //summon 2
    @IBOutlet weak var secondSummonImageView: UIImageView!
    @IBOutlet weak var secondSummonHealthLabel: UILabel!
    @IBOutlet weak var secondSummonDamageLabel: UILabel!
    @IBOutlet weak var secondSummonSizeLabel: UILabel!
    
    //summon 3
    @IBOutlet weak var thirdSummonImageView: UIImageView!
    @IBOutlet weak var thirdSummonHealthLabel: UILabel!
    @IBOutlet weak var thirdSummonDamageLabel: UILabel!
    @IBOutlet weak var thirdSummonSizeLabel: UILabel!
    
    //summon 4
    @IBOutlet weak var fourthSummonImageView: UIImageView!
    @IBOutlet weak var fourthSummonHealthLabel: UILabel!
    @IBOutlet weak var fourthSummonDamageLabel: UILabel!
    @IBOutlet weak var fourthSummonSizeLabel: UILabel!
    
    //summon 5
    @IBOutlet weak var fithSummonImageView: UIImageView!
    @IBOutlet weak var fithSummonHealthLabel: UILabel!
    @IBOutlet weak var fithSummonDamageLabel: UILabel!
    @IBOutlet weak var fithSummonSizeLabel: UILabel!
    
    //stack Views
    @IBOutlet weak var summonOneStackView: UIStackView!
    @IBOutlet weak var summonTwoStackView: UIStackView!
    @IBOutlet weak var summonThreeStackView: UIStackView!
    @IBOutlet weak var summonFourStackView: UIStackView!
    @IBOutlet weak var summonFiveStackView: UIStackView!

    //MARK: current instances of what i'm working with
    var currentSummon = SummonController.sharedSummon.golblin
    var currentMonster = MonsterController.sharedMonster.sillyWarrior
    var currentPlayer = PlayerController.sharedPlayer.currentPlayer
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        //setting up player
        updatePlayer(player: currentPlayer)
        
        //setting up monster
        updateMonster(monster: currentMonster)
        
        //hiding stack views
        summonOneStackView.isHidden = true
        summonTwoStackView.isHidden = true
        summonThreeStackView.isHidden = true
        summonFourStackView.isHidden = true
        summonFiveStackView.isHidden = true
        
        // Do any additional setup after loading the view.
    }
    
    //MARK: button functions
    
    @IBAction func summonButtonTapped(_ sender: Any) {
        switch currentPlayer.currentSummons {
        case 0:
            let goblin = SummonController.sharedSummon.createSummon(summon: currentSummon)
            guard let summon = PlayerController.sharedPlayer.createMinion(summon: goblin, player: currentPlayer) else {return}
            updateFirstSummon(summon: summon)
            
            updatePlayer(player: currentPlayer)
        case 1:
            let goblin = SummonController.sharedSummon.createSummon(summon: currentSummon)
            guard let summon = PlayerController.sharedPlayer.createMinion(summon: goblin, player: currentPlayer) else {return}
            updateSecondSummon(summon: summon)
            
            updatePlayer(player: currentPlayer)
        case 2:
            let goblin = SummonController.sharedSummon.createSummon(summon: currentSummon)
            guard let summon = PlayerController.sharedPlayer.createMinion(summon: goblin, player: currentPlayer) else {return}
            updateThirdSummon(summon: summon)
            
            updatePlayer(player: currentPlayer)
        case 3:
            let goblin = SummonController.sharedSummon.createSummon(summon: currentSummon)
            guard let summon = PlayerController.sharedPlayer.createMinion(summon: goblin, player: currentPlayer) else {return}
            updateFourthSummon(summon: summon)
            
            updatePlayer(player: currentPlayer)
        case 4:
            let goblin = SummonController.sharedSummon.createSummon(summon: currentSummon)
            guard let summon = PlayerController.sharedPlayer.createMinion(summon: goblin, player: currentPlayer) else {return}
            updateFithSummon(summon: summon)
            
            updatePlayer(player: currentPlayer)
        default:
            return
        }
    }
    
    @IBAction func turnEndButtonTapped(_ sender: Any) {
        summonAttack(monster: currentMonster, player: currentPlayer)
        updateMonster(monster: currentMonster)
        if currentMonster.health > 0 {
            monsterAttack(monster: currentMonster, player: currentPlayer)
        }
        
        PlayerController.sharedPlayer.newPlayerTurn(player: currentPlayer)
    }
    
    //MARK: Battle Logic
    
    func summonAttack(monster: Monster, player: Player){
        for summon in player.summonArray {
            monster.health -= summon.attack
        }
    }
    
    func monsterAttack(monster: Monster, player: Player){
        var monsterAttckSize = monster.attackSize
        var newSummonArray: [Summon] = []
        
        for summon in player.summonArray{
            var changedSummon = summon
            
            if monsterAttckSize > 0 {
                changedSummon.health -= monster.attackDamage
                monsterAttckSize -= summon.size
            }
            if changedSummon.health > 0 {
                newSummonArray.append(changedSummon)
            } else {
                player.currentSummons -= 1
            }
        }
        if monsterAttckSize > 0 {
            player.currentHealth -= monster.attackDamage
        }
        player.summonArray = newSummonArray
        updateBattleField(player: player)
    }
    
    //MARK: update battlefield functions
    
    func updateBattleField(player: Player) {
        
        updatePlayer(player: player)
        
        summonOneStackView.isHidden = true
        summonTwoStackView.isHidden = true
        summonThreeStackView.isHidden = true
        summonFourStackView.isHidden = true
        summonFiveStackView.isHidden = true
        
        var arrayCount = 0
        for summon in player.summonArray {
            arrayCount += 1
            switch arrayCount {
            case 1:
                updateFirstSummon(summon: summon)
            case 2:
                updateSecondSummon(summon: summon)
            case 3:
                updateThirdSummon(summon: summon)
            case 4:
                updateFourthSummon(summon: summon)
            case 5:
                updateFithSummon(summon: summon)
            default:
                return
            }
        }
    }
    
    func updatePlayer(player: Player) {
        playerHealthLabel.text = "\(currentPlayer.currentHealth)"
        playerManaLabel.text = "\(currentPlayer.currentMana)"
        playerSummonLabel.text = "\(currentPlayer.currentSummons)"
    }
    
    func updateMonster(monster: Monster) {
        monsterImageView.image = currentMonster.monsterImage
        monsterSizeLabel.text = "\(currentMonster.attackSize)"
        monsterDamageLabel.text = "\(currentMonster.attackDamage)"
        monsterHealthLabel.text = "\(currentMonster.health)"
    }
    
    func updateSummons(summon: Summon) {
        

    }

    func updateFirstSummon(summon: Summon) {
        firstSummonHealthLabel.text = "\(summon.health)"
        firstSummonSizeLabel.text = "\(summon.size)"
        firstSummonDamageLabel.text = "\(summon.attack)"
        firstSummonImageView.image = summon.summonImage
        
        summonOneStackView.isHidden = false
    }
    
    func updateSecondSummon(summon: Summon){
        secondSummonHealthLabel.text = "\(summon.health)"
        secondSummonSizeLabel.text = "\(summon.size)"
        secondSummonDamageLabel.text = "\(summon.attack)"
        secondSummonImageView.image = summon.summonImage
        
        summonTwoStackView.isHidden = false
    }
    
    func updateThirdSummon(summon: Summon) {
        thirdSummonHealthLabel.text = "\(summon.health)"
        thirdSummonSizeLabel.text = "\(summon.size)"
        thirdSummonDamageLabel.text = "\(summon.attack)"
        thirdSummonImageView.image = summon.summonImage
        
        summonThreeStackView.isHidden = false
    }
    
    func updateFourthSummon(summon: Summon) {
        fourthSummonHealthLabel.text = "\(summon.health)"
        fourthSummonSizeLabel.text = "\(summon.size)"
        fourthSummonDamageLabel.text = "\(summon.attack)"
        fourthSummonImageView.image = summon.summonImage
        
        summonFourStackView.isHidden = false
    }
    
    func updateFithSummon(summon: Summon) {
        fithSummonHealthLabel.text = "\(summon.health)"
        fithSummonSizeLabel.text = "\(summon.size)"
        fithSummonDamageLabel.text = "\(summon.attack)"
        fithSummonImageView.image = summon.summonImage
        
        summonFiveStackView.isHidden = false
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
