//
//  summonSelectViewController.swift
//  summonerGame
//
//  Created by William Moody on 5/27/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import UIKit

private let resuseIdentifier = "summonSelectCell"

class summonSelectViewController: UIViewController {
    
    
    @IBOutlet weak var startBattleButton: UIButton!
    @IBOutlet weak var firstSummonImage: UIImageView!
    @IBOutlet weak var secondSummonImage: UIImageView!
    @IBOutlet weak var thirdSummonImage: UIImageView!
    @IBOutlet weak var fourthSumonImage: UIImageView!
    
    @IBOutlet weak var summonSelectorColletionView: UICollectionView!
    
    var availableSummons = SummonController.sharedSummon.availableSummonArray
    var selectedSummons: [Summon] = []
    
    //keeping track of selected cell
    var selectedSummon: IndexPath? {
        didSet {
            //when property changes didset runs
            var indexPaths: [IndexPath] = []
            if let selectedUpgrade = selectedSummon {
                indexPaths.append(selectedUpgrade)
            }
            
            if let oldValue = oldValue {
                indexPaths.append(oldValue)
            }
            // animating the view
            summonSelectorColletionView.performBatchUpdates({
                self.summonSelectorColletionView.reloadItems(at: indexPaths)
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startBattleButton.isHidden = true
        
        // Do any additional setup after loading the view.
    }
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toBattleSegue" {
            let selectedSummons = self.selectedSummons
            let destinationVC = segue.destination as? battleScreenViewController
            destinationVC?.chosenSummonArray = selectedSummons
        }
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
    
}


extension summonSelectViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return availableSummons?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: resuseIdentifier, for: indexPath) as? summonSelectionCollectionViewCell
        
        let summon = availableSummons?[indexPath.row]
        cell?.summon = summon
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        shouldSelectItemAt indexPath: IndexPath) -> Bool {
        if selectedSummon == indexPath {
            selectedSummon = nil
        } else {
            selectedSummon = indexPath
            guard let summon = availableSummons?[indexPath.row] else { return false }
            if selectedSummons.count < 4 {
                selectedSummons.append(summon)
                selectedSummons.count == 1 ? firstSummonImage.image = summon.summonImage : nil
                selectedSummons.count == 2 ? secondSummonImage.image = summon.summonImage : nil
                selectedSummons.count == 3 ? thirdSummonImage.image = summon.summonImage : nil
                if selectedSummons.count == 4 {
                    fourthSumonImage.image = summon.summonImage
                    startBattleButton.isHidden = false
                }
            }
        }
        return false
    }
}
