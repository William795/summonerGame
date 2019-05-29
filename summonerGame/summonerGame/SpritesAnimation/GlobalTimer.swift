//
//  GlobalTimer.swift
//  summonerGame
//
//  Created by William Moody on 5/27/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import Foundation

class timer: NSObject {

    var timer: Timer?
    
    func timerStart() {

        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (_) in
//            NotificationCenter.default.post(name: "timerInterval", object: nil)
        })
    }
}
