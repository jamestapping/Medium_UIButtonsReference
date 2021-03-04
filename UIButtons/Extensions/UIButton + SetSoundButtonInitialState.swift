//
//  UIButton + SetSoundButtonInitialState.swift
//  UIButtons
//
//  Created by James Tapping on 03/03/2021.
//

import Foundation
import UIKit

extension UIButton {
    
    func setSoundButtonInitialState() {
        
        let key = "muted"
        let userDefaults = UserDefaults.standard
        let button = self
        let mute = UIImage(named: "mute")
        
        if userDefaults.bool(forKey: key) {
            
            button.setBackgroundImage(mute, for: .normal)
            
        }
    }
    
}
