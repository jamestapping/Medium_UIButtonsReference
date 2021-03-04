//
//  UIButton + ColourOnHighlight.swift
//  UIButtons
//
//  Created by James Tapping on 03/03/2021.
//

import Foundation
import UIKit

extension UIButton {

    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {

        layer.masksToBounds = true
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        UIGraphicsGetCurrentContext()!.setFillColor(color.cgColor)
        UIGraphicsGetCurrentContext()!.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        setBackgroundImage(colorImage, for: state)
    }
}
