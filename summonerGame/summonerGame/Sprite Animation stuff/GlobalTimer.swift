//
//  GlobalTimer.swift
//  summonerGame
//
//  Created by William Moody on 5/27/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import Foundation

//class timer: NSObject {
//
//    var timeRemaining: TimeInterval?
//    var timer: Timer?
//    
//    func secondTick() {
//        guard let UnwrappedTimeRemaining = timeRemaining else {return}
//        if UnwrappedTimeRemaining > 0 {
//            timeRemaining = UnwrappedTimeRemaining - 1
//            print(timeRemaining ?? 0)
//            NotificationCenter.default.post(name: "timerInterval", object: nil)
//
//        } else {
//            timer?.invalidate()
//            self.timeRemaining = nil
//        }
//    }
//
//    func timerStart(time: TimeInterval) {
//
//        timeRemaining = time
//        DispatchQueue.main.async {
//            self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (_) in
//                self.secondTick()
//            })
//        }
//    }
//}
