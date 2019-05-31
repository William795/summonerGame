//
//  battleScreenViewController.swift
//  summonerGame
//
//  Created by William Moody on 5/27/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import UIKit

class battleScreenViewController: UIViewController {
    
    //MARK: outlets
    @IBOutlet weak var defeatImageView: UIImageView!
    @IBOutlet weak var defeatSegueButtonTapped: UIButton!
    
    @IBOutlet weak var rewardsSegueButtonTapped: UIButton!
    @IBOutlet weak var victoryUIImage: UIImageView!
    //monster UI
    
    @IBOutlet weak var monsterImageView: UIImageView!
    @IBOutlet weak var monsterHealthLabel: UILabel!
    @IBOutlet weak var monsterDamageLabel: UILabel!
    @IBOutlet weak var monsterSizeLabel: UILabel!
    @IBOutlet weak var monsterTextImageView: UIImageView!
    @IBOutlet weak var monsterBattleTextLabel: UILabel!
    
    
    //player UI
    
    @IBOutlet weak var playerHealthLabel: UILabel!
    @IBOutlet weak var playerManaLabel: UILabel!
    @IBOutlet weak var playerSummonLabel: UILabel!
    
    @IBOutlet weak var playerAbilityOne: UIImageView!
    @IBOutlet weak var playerAbilityTwo: UIImageView!
    @IBOutlet weak var playerAbilityThree: UIImageView!
    @IBOutlet weak var playerAbilityFour: UIImageView!
    
    @IBOutlet weak var abilityCoolDownLabelOne: UILabel!
    @IBOutlet weak var abilityCoolDownLabelTwo: UILabel!
    @IBOutlet weak var abilityCooldownLabelThree: UILabel!
    @IBOutlet weak var abilityCoolDownLabelFour: UILabel!
    
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
    
    //MARK: calling the player, summons, and monster
    var currentMonster = MonsterController.sharedMonster.currentMonster
    var currentPlayer = PlayerController.sharedPlayer.currentPlayer
    
    
    var chosenSummon: Summon?
    
    //array landing pad that holds the chosen summons
    var chosenSummonArray: [Summon]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        defeatImageView.isHidden = true
        defeatSegueButtonTapped.isHidden = true
        victoryUIImage.isHidden = true
        rewardsSegueButtonTapped.isHidden = true
        
        //setting up player
        currentPlayer.currentHealth = currentPlayer.maxHealth
        currentPlayer.currentMana = currentPlayer.maxMana
        updatePlayer(player: currentPlayer)
        
        playerAbilityOne.image = chosenSummonArray?[0].abilityImage
        playerAbilityTwo.image = chosenSummonArray?[1].abilityImage
        playerAbilityThree.image = chosenSummonArray?[2].abilityImage
        playerAbilityFour.image = chosenSummonArray?[3].abilityImage
        
        
        abilityCoolDownLabelOne.isHidden = true
        abilityCoolDownLabelTwo.isHidden = true
        abilityCooldownLabelThree.isHidden = true
        abilityCoolDownLabelFour.isHidden = true
        
        //setting up monster
        monsterTextImageView.isHidden = true
        monsterBattleTextLabel.isHidden = true
        currentMonster?.health = currentMonster!.maxHealth
        currentMonster?.moveNumber = 1
        MonsterMoveController.sharedMove.moveSelector(monster: currentMonster!)
        MonsterMoveController.sharedMove.resetBossVariables()
        updateMonster(monster: currentMonster!)
        
        //hiding stack views
        summonOneStackView.isHidden = true
        summonTwoStackView.isHidden = true
        summonThreeStackView.isHidden = true
        summonFourStackView.isHidden = true
        summonFiveStackView.isHidden = true
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func summonChooserButtonTapped(_ sender: Any) {
        
        presentAlertController()
    }
    
    @IBAction func summonButtonTapped(_ sender: Any) {
        guard let summon = chosenSummon else {return}
        placeSummon(player: currentPlayer, summon: summon)
    }
    
    //MARK: Ability Buttons Tapped
    
    
    @IBAction func abilityOneTapped(_ sender: Any) {
        guard let summonAbility = chosenSummonArray?[0] else {return}
        let coolDownCheck = summonAbilityCheck(summonAbility)
        if coolDownCheck > 0 {
            if summonAbility.abilityCoolDown > 0 {
                abilityCoolDownLabelOne.isHidden = false
                abilityCoolDownLabelOne.text = "\(summonAbility.abilityCoolDown)"
            }
        }
        
    }
    @IBAction func abilityTwoTapped(_ sender: Any) {
        guard let summonAbility = chosenSummonArray?[1] else {return}
        let coolDownCheck = summonAbilityCheck(summonAbility)
        if coolDownCheck > 0 {
            if summonAbility.abilityCoolDown > 0 {
                abilityCoolDownLabelTwo.isHidden = false
                abilityCoolDownLabelTwo.text = "\(summonAbility.abilityCoolDown)"
            }
        }
        
    }
    @IBAction func abilityThreeTapped(_ sender: Any) {
        guard let summonAbility = chosenSummonArray?[2] else {return}
        let coolDownCheck = summonAbilityCheck(summonAbility)
        if coolDownCheck > 0 {
            if summonAbility.abilityCoolDown > 0 {
                abilityCooldownLabelThree.isHidden = false
                abilityCooldownLabelThree.text = "\(summonAbility.abilityCoolDown)"
            }
        }
        
    }
    @IBAction func abilityFourTapped(_ sender: Any) {
        guard let summonAbility = chosenSummonArray?[3] else {return}
        let coolDownCheck = summonAbilityCheck(summonAbility)
        if coolDownCheck > 0 {
            if summonAbility.abilityCoolDown > 0 {
                abilityCoolDownLabelFour.isHidden = false
                abilityCoolDownLabelFour.text = "\(summonAbility.abilityCoolDown)"
            }
        }
    }
    
    func summonAbilityCheck(_ summonAbility: Summon) -> Int {
        var didGoOff = 0
        var chosenSumonArrayCoolDown: [Summon] = []
        
        if summonAbility.abilityActive == false || summonAbility.abilityCoolDownRemaining > 0 || currentPlayer.currentMana < summonAbility.abilityCost {
            return 0
            //add error text block
        }
        for summon in currentPlayer.summonArray {
            if summon.abilityNumber == summonAbility.abilityNumber {
                SummonAbilityController.sharedAbility.useAbility(summon: summon, player: currentPlayer, monster: currentMonster!)
                didGoOff += 1
            }
        }
        if didGoOff < 1 {
            return 0
        }else {
            currentPlayer.currentMana -= summonAbility.abilityCost
            for summon in chosenSummonArray! {
                var setSummonAbilityCoolDown = summon
                if setSummonAbilityCoolDown.abilityNumber == summonAbility.abilityNumber {
                    setSummonAbilityCoolDown.abilityCoolDownRemaining = summonAbility.abilityCoolDown
                }
                chosenSumonArrayCoolDown.append(setSummonAbilityCoolDown)
            }
        }
        chosenSummonArray = chosenSumonArrayCoolDown
        updateBattleField(player: currentPlayer, monster: currentMonster!)
        return didGoOff
    }
    
    //MARK: Battle logic
    
    @IBAction func turnEndButtonTapped(_ sender: Any) {
        if currentMonster!.health < 1 || currentPlayer.currentHealth < 1 {
            return
        }
        
        PlayerController.sharedPlayer.newPlayerTurn(player: currentPlayer)
        abilityCoolDownTick()
        
        summonAttack(monster: currentMonster!, player: currentPlayer)
        updateMonster(monster: currentMonster!)
        if currentMonster!.health > 0 {
            monsterAttack(monster: currentMonster!, player: currentPlayer)
            MonsterMoveController.sharedMove.moveSelector(monster: currentMonster!)
            updateMonster(monster: currentMonster!)
        }
    }
    
    @IBAction func rewardsButtonTapped(_ sender: Any) {
        currentPlayer.summonArray = []
        currentPlayer.currentSummons = 0
    }
    
    //MARK: button functions
    
    func placeSummon(player: Player, summon: Summon) {
        
        switch player.currentSummons {
        case 0:
            let summonOne = SummonController.sharedSummon.createSummon(summon: summon)
            guard let summon = PlayerController.sharedPlayer.createMinion(summon: summonOne, player: currentPlayer) else {return}
            updateFirstSummon(summon: summon)
            
            updatePlayer(player: currentPlayer)
        case 1:
            let summonTwo = SummonController.sharedSummon.createSummon(summon: summon)
            guard let summon = PlayerController.sharedPlayer.createMinion(summon: summonTwo, player: currentPlayer) else {return}
            updateSecondSummon(summon: summon)
            
            updatePlayer(player: currentPlayer)
        case 2:
            let summonThree = SummonController.sharedSummon.createSummon(summon: summon)
            guard let summon = PlayerController.sharedPlayer.createMinion(summon: summonThree, player: currentPlayer) else {return}
            updateThirdSummon(summon: summon)
            
            updatePlayer(player: currentPlayer)
        case 3:
            let goblin = SummonController.sharedSummon.createSummon(summon: summon)
            guard let summon = PlayerController.sharedPlayer.createMinion(summon: goblin, player: currentPlayer) else {return}
            updateFourthSummon(summon: summon)
            
            updatePlayer(player: currentPlayer)
        case 4:
            let goblin = SummonController.sharedSummon.createSummon(summon: summon)
            guard let summon = PlayerController.sharedPlayer.createMinion(summon: goblin, player: currentPlayer) else {return}
            updateFithSummon(summon: summon)
            
            updatePlayer(player: currentPlayer)
        default:
            return
        }
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
        updateBattleField(player: player, monster: monster)
    }
    
    func presentAlertController() {
        let alertController = UIAlertController(title: "Choose Desired Minion", message: "Spend mana to put a summon on the battle field", preferredStyle: .alert)
        
        
        let summonOne = UIAlertAction(title: "\(chosenSummonArray?[0].name ?? "")", style: .default) { (_) in
            self.chosenSummon = self.chosenSummonArray?[0]
        }
        let summonTwo = UIAlertAction(title: "\(chosenSummonArray?[1].name ?? "")", style: .default) { (_) in
            self.chosenSummon = self.chosenSummonArray?[1]
        }
        let summonThree = UIAlertAction(title: "\(chosenSummonArray?[2].name ?? "")", style: .default) { (_) in
            self.chosenSummon = self.chosenSummonArray?[2]
        }
        let summonFour = UIAlertAction(title: "\(chosenSummonArray?[3].name ?? "")", style: .default) { (_) in
            self.chosenSummon = self.chosenSummonArray?[3]
        }
        
        
        alertController.addAction(summonOne)
        alertController.addAction(summonTwo)
        alertController.addAction(summonThree)
        alertController.addAction(summonFour)
        self.present(alertController, animated: true, completion: nil)
        
        return
    }
    
    //MARK: update battlefield functions
    
    
    func updateBattleField(player: Player, monster: Monster) {
        
        updatePlayer(player: player)
        updateMonster(monster: monster)
        
        updateSummonPosition(player)
    }
    
    func updateSummonPosition(_ player: Player) {
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
        currentPlayer.currentHealth < 1 ? defeatDisplay() : nil
    }
    
    func updateMonster(monster: Monster) {
        monsterImageView.image = currentMonster?.monsterImage
        monsterSizeLabel.text = "\(currentMonster?.attackSize ?? 0)"
        monsterDamageLabel.text = "\(currentMonster?.attackDamage ?? 0)"
        monsterHealthLabel.text = "\(currentMonster?.health ?? 0)"
        monster.health < 1 ? victoryDisplay() : nil
        
        if monster.battleText.count > 3 {
            monsterBattleTextLabel.text = monster.battleText
            monsterBattleTextLabel.isHidden = false
            monsterTextImageView.isHidden = false
            
            let dismiss = DispatchTime.now() + 3
            DispatchQueue.main.asyncAfter(deadline: dismiss){
                self.monsterBattleTextLabel.isHidden = true
                self.monsterTextImageView.isHidden = true
            }
        }
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
    //MARK: displays/abilitycooldowntick
    
    func victoryDisplay() {
        victoryUIImage.isHidden = false
        rewardsSegueButtonTapped.isHidden = false
    }
    
    func defeatDisplay() {
        defeatSegueButtonTapped.isHidden = false
        defeatImageView.isHidden = false
    }
    
    func abilityCoolDownTick() {
        var summonArrayTick: [Summon] = []
        for summon in  chosenSummonArray! {
            var coolDownChange = summon
            if coolDownChange.abilityCoolDownRemaining > 0 {
                coolDownChange.abilityCoolDownRemaining -= 1
            }
            summonArrayTick.append(coolDownChange)
        }
        chosenSummonArray = summonArrayTick
        
        //replace all this with custom images?
        abilityCoolDownLabelOne.text = "\(summonArrayTick[0].abilityCoolDownRemaining)"
        abilityCoolDownLabelTwo.text = "\(summonArrayTick[1].abilityCoolDownRemaining)"
        abilityCooldownLabelThree.text = "\(summonArrayTick[2].abilityCoolDownRemaining)"
        abilityCoolDownLabelFour.text = "\(summonArrayTick[3].abilityCoolDownRemaining)"
        
        if summonArrayTick[0].abilityCoolDownRemaining == 0 {
            abilityCoolDownLabelOne.isHidden = true
        }
        if summonArrayTick[1].abilityCoolDownRemaining == 0 {
            abilityCoolDownLabelTwo.isHidden = true
        }
        if summonArrayTick[2].abilityCoolDownRemaining == 0 {
            abilityCooldownLabelThree.isHidden = true
        }
        if summonArrayTick[3].abilityCoolDownRemaining == 0 {
            abilityCoolDownLabelFour.isHidden = true
        }
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toRewardsSegue" {
            guard let summonArray = chosenSummonArray else {return}
            let destinationVC = segue.destination as? rewardsScreenViewController
            destinationVC?.summonArray = summonArray
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}
