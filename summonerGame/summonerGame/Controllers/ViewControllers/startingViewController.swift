//
//  startingViewController.swift
//  summonerGame
//
//  Created by William Moody on 5/27/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import UIKit

class startingViewController: UIViewController {
    
    @IBOutlet weak var torchOneImageView: UIImageView!
    @IBOutlet weak var torchTwoImageView: UIImageView!
    
    var torchImagePhase = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        torchOneImageView.image = UIImage(named: "Torch1")
        torchTwoImageView.image = UIImage(named: "Torch1")
        
        NotificationCenter.default.addObserver(self, selector: #selector(torchPhase), name: NSNotification.Name(rawValue: "timerInterval"), object: nil)
        // Do any additional setup after loading the view.
    }
    
    @objc func torchPhase(){
        if torchImagePhase > 6 {
            torchImagePhase = 1
        }
        torchOneImageView.image = UIImage(named: "Torch\(torchImagePhase)")
        torchTwoImageView.image = UIImage(named: "Torch\(torchImagePhase)")
        torchImagePhase += 1
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
