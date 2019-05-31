//
//  rewardsCollectionViewCell.swift
//  summonerGame
//
//  Created by William Moody on 5/28/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import UIKit

class rewardsCollectionViewCell: UICollectionViewCell {
    
    var summonsUsed: Summon? {
        didSet{
            updateCell()
        }
    }
    
    @IBOutlet weak var summonImageView: UIImageView!
    @IBOutlet weak var summonAbilityLabel: UILabel!
    
    func updateCell() {
        guard let summonsUsed = summonsUsed else {return}
        
        if summonsUsed.abilityLevel < 1 {
            summonImageView.image = UIImage(named: "Torch")
            summonAbilityLabel.text = ""
        }else {
        summonImageView.image = summonsUsed.summonImage
        summonAbilityLabel.text = ""
        }
    }
}
