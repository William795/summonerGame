//
//  rewardsScreenViewController.swift
//  summonerGame
//
//  Created by William Moody on 5/27/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import UIKit

private let reuseIdentifier = "upgradeCell"

class rewardsScreenViewController: UIViewController {

    var summonArray: [Summon]?
    

    @IBOutlet weak var rewardsCollectionView: UICollectionView!
    @IBOutlet weak var continueOnButton: UIButton!
    @IBOutlet weak var upgradeInstructionsLabel: UILabel!
    @IBOutlet weak var plusManaLabel: UILabel!
    
    //keeping track of selected cell
    var selectedUpgrade: IndexPath? {
        didSet {
            //when property changes didset runs
            var indexPaths: [IndexPath] = []
            if let selectedUpgrade = selectedUpgrade {
                indexPaths.append(selectedUpgrade)
            }
            
            if let oldValue = oldValue {
                indexPaths.append(oldValue)
            }
            // animating the view
            rewardsCollectionView.performBatchUpdates({
                self.rewardsCollectionView.reloadItems(at: indexPaths)
            })
        }
    }
    
    //var to disable all upgrades after one is chosen
    var canUpgrade = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if PlayerController.sharedPlayer.currentPlayer.maxMana % 3 == 2 {
            plusManaLabel.text = "+1 mana and regen"
        }else{
            plusManaLabel.text = "+1 mana"
        }
            
        
        if MonsterController.sharedMonster.currentMonster?.defeted == false {
            canUpgrade = true
            continueOnButton.isHidden = true
            upgradeInstructionsLabel.text = "Select Desired Upgrade"
            MonsterController.sharedMonster.currentMonster?.defeted = true
        }else {
            canUpgrade = false
            upgradeInstructionsLabel.text = "Upgrade Already Aquired"
            continueOnButton.isHidden = false
        }
        
       //self.rewardsCollectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    
    @IBAction func bonusOneButtonTapped(_ sender: Any) {
        if canUpgrade == true {
            PlayerController.sharedPlayer.currentPlayer.maxMana += 1
            continueOnButton.isHidden = false
            canUpgrade = false
            upgradeInstructionsLabel.text = "Upgrade Already Aquired"
        }
    }
    
    @IBAction func bonusTwoButtonTapped(_ sender: Any) {
        if canUpgrade == true {
            PlayerController.sharedPlayer.currentPlayer.maxHealth += 10
            continueOnButton.isHidden = false
            canUpgrade = false
            upgradeInstructionsLabel.text = "Upgrade Already Aquired"
        }
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

extension rewardsScreenViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return summonArray?.count ?? 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? rewardsCollectionViewCell
        
        
        let summon = summonArray?[indexPath.row]
        cell?.summonsUsed = summon
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView,
                                 shouldSelectItemAt indexPath: IndexPath) -> Bool {
        if selectedUpgrade == indexPath {
            selectedUpgrade = nil
        } else {
            if canUpgrade == true {
                
                selectedUpgrade = indexPath
                let summon = summonArray?[indexPath.row]
                SummonController.sharedSummon.UpgradeSummon(summon: summon!)
                canUpgrade = false
                continueOnButton.isHidden = false
                upgradeInstructionsLabel.text = "Upgrade Already Aquired"
            }
        }
        return false
    }
}
