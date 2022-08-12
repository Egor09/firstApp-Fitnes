//
//  UIView + Extensions.swift
//  FirstApp04.04_Process
//
//  Created by Егор Филиппов on 10.04.2022.
//

import UIKit

extension UIView {
    func addShadowOnView() {
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        layer.shadowOpacity = 0.7
        layer.shadowRadius = 1.0
    }
}
