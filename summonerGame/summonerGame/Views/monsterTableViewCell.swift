//
//  monsterTableViewCell.swift
//  summonerGame
//
//  Created by William Moody on 5/29/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import UIKit

class monsterTableViewCell: UITableViewCell {

    var monster: Monster? {
        didSet{
            updateCell()
        }
    }
    
    @IBOutlet weak var monsterImageView: UIImageView!
    @IBOutlet weak var xMarkImageView: UIImageView!
    @IBOutlet weak var monsterHealthLabel: UILabel!
    @IBOutlet weak var monsterNameLabel: UILabel!
 
    func updateCell() {
        guard let monster = monster else {return}
        monsterImageView.image = monster.monsterImage
        monsterNameLabel.text = monster.name
        monsterHealthLabel.text = "\(monster.maxHealth)"
        if monster.defeted == true{
            xMarkImageView.isHidden = false
        }
    }
}
