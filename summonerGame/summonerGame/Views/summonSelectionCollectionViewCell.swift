//
//  summonSelectionCollectionViewCell.swift
//  summonerGame
//
//  Created by William Moody on 5/28/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import UIKit

class summonSelectionCollectionViewCell: UICollectionViewCell {
    
    var summon: Summon? {
        didSet{
            updateView()
        }
    }
    
    @IBOutlet weak var summonImageView: UIImageView!
    @IBOutlet weak var summonHealthLabel: UILabel!
    @IBOutlet weak var summonAttackLabel: UILabel!
    @IBOutlet weak var summonAbilityLabel: UILabel!
    @IBOutlet weak var summonSizeLabel: UILabel!
    @IBOutlet weak var summonManaCostLabel: UILabel!
    
    
    func updateView(){
        guard let summon = summon else {return}
        summonImageView.image = summon.summonImage
        summonHealthLabel.text = "\(summon.health)"
        summonAttackLabel.text = "\(summon.attack)"
        summonAbilityLabel.text = summon.ability
        summonSizeLabel.text = "\(summon.size)"
        summonManaCostLabel.text = "\(summon.cost)"
    }
}
