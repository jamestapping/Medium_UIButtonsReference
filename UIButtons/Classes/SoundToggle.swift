//
//  SoundToggle.swift
//  UIButtons
//
//  Created by James Tapping on 03/03/2021.
//

import Foundation
import UIKit

class SoundToggle: UIButton {
    
    let impactGenerator = UIImpactFeedbackGenerator()
    let mute = UIImage(named: "mute")
    let unmute = UIImage(named: "unmute")
    let key = "muted"
    let userDefaults = UserDefaults.standard
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initButton()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initButton()
    }
    
    deinit {
    
    }
    
    func initButton() {
        
        adjustsImageWhenHighlighted = false
        addTarget(self, action: #selector(activateButton), for: .touchUpInside)

    }
    
    @objc func activateButton(){
        
        impactGenerator.impactOccurred()
        
        if userDefaults.object(forKey: key) == nil || !userDefaults.bool(forKey: key) {

            setBackgroundImage(mute, for: .normal)
            
            userDefaults.setValue(true, forKey: key)
            
        } else {

            setBackgroundImage(unmute, for: .normal)
            userDefaults.setValue(false, forKey: key)
            
        }
        
   }
}
