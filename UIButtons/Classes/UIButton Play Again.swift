//
//  UIButton + animateColour.swift
//  UIButtons
//
//  Created by James Tapping on 03/03/2021.
//

import Foundation
import UIKit

class PlayAgain: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initButton()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initButton()
    }
    
    var highlightDuration: TimeInterval = 0.15
    var highlightedBackgroundColor: UIColor = .black
    var normalBackgroundColor: UIColor = .white
    
    override var isHighlighted: Bool {
        didSet {
            if oldValue == false && isHighlighted {
                highlight()
            } else if oldValue == true && !isHighlighted {
                unHighlight()
            }
        }
    }
    
    func initButton(){
        
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = 15
        setTitleColor(.white, for: .highlighted)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.5
        layer.masksToBounds = false
        layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        
    }

    func highlight() {
        animateBackground(to: highlightedBackgroundColor, duration: highlightDuration)
    }

    func unHighlight() {
        animateBackground(to: normalBackgroundColor, duration: highlightDuration)
    }
    
    private func animateBackground(to color: UIColor?, duration: TimeInterval) {
        guard let color = color else { return }
        UIView.animate(withDuration: highlightDuration) {
            self.backgroundColor = color
        }
    }
}
