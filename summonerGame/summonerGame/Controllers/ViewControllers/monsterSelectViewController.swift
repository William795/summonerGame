//
//  monsterSelectViewController.swift
//  summonerGame
//
//  Created by William Moody on 5/27/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import UIKit

class monsterSelectViewController: UIViewController {

    let monsterArray = MonsterController.sharedMonster.availableMonsterArray
    
    @IBOutlet weak var monsterNameLabel: UILabel!
    @IBOutlet weak var monsterTitleLabel: UILabel!
    @IBOutlet weak var monsterImageView: UIImageView!
    @IBOutlet weak var monsterHealthLabel: UILabel!
    @IBOutlet weak var monsterFlavorLabel: UILabel!
    @IBOutlet weak var monsterDifficultyImage: UIImageView!
    
    @IBOutlet weak var monsterTableView: UITableView!
    
    @IBOutlet weak var toSummonSelectButtonSegue: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        monsterNameLabel.text = ""
        monsterImageView.isHidden = true
        monsterTitleLabel.text = ""
        monsterHealthLabel.text = ""
        monsterDifficultyImage.isHidden = true
        monsterFlavorLabel.text = ""
        toSummonSelectButtonSegue.isHidden = true
        // Do any additional setup after loading the view.
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

extension monsterSelectViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return monsterArray?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "monsterCell", for: indexPath) as? monsterTableViewCell
        
        let monster = monsterArray?[indexPath.row]
        cell?.monster = monster
        
        return cell ?? UITableViewCell()
    }
    //checking for selected cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = monsterTableView.indexPathForSelectedRow
        let setMonster = monsterArray![indexPath!.row]
        
        
        monsterNameLabel.text = setMonster.name
        monsterTitleLabel.text = setMonster.title
        monsterImageView.image = setMonster.monsterImage
        monsterHealthLabel.text = "\(setMonster.maxHealth)"
        monsterFlavorLabel.text = setMonster.flavorText
        monsterDifficultyImage.image = setMonster.difficultyImage
        
        monsterImageView.isHidden = false
        monsterDifficultyImage.isHidden = false
        
        MonsterController.sharedMonster.currentMonster = setMonster
        toSummonSelectButtonSegue.isHidden = false
    }
}
