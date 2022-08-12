//
//  Int + Extensions.swift
//  FirstApp04.04_Process
//
//  Created by Егор Филиппов on 11.05.2022.
//

import Foundation

extension Int {
    func convertSeconds() -> (Int, Int) {
        let min = self / 60
        let sec = self % 60
        
        return (min, sec)
    }
    
    func setZeroForSecond() -> String {
        return (Double(self) / 10.0 < 1 ? "0\(self)" : "\(self)")
    }
}
