//
//  Gradient.swift
//  RandomNum
//
//  Created by Caner Kaya on 04.01.20.
//  Copyright © 2020 lll. All rights reserved.
//

import UIKit

extension UIView {

    func setGradient(FirstColor: UIColor, SecondColor: UIColor)
    {
        let gradientLayer = CAGradientLayer()
          
        gradientLayer.frame = bounds
          
        gradientLayer.colors = [FirstColor.cgColor, SecondColor.cgColor]
          
        gradientLayer.locations = [0.0, 1.0]
          
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.0)
          
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
          
        layer.insertSublayer(gradientLayer, at: 0)
      }
}
