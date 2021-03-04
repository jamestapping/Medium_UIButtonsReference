//
//  UIButton Scan.swift
//  UIButtons
//
//  Created by James Tapping on 03/03/2021.
//

import Foundation
import UIKit

class Scan: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initButton()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initButton()
    }
    
    func initButton(){
        
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = self.frame.width/2
        setTitleColor(.white, for: .highlighted)
        setTitleColor(.black, for: .normal)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 2
        layer.shadowOpacity = 0.5
        layer.masksToBounds = false
        layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        
    }
    
    var highlightDuration: TimeInterval = 0.15
    var highlightedBackgroundColor: UIColor = .black
    var normalBackgroundColor: UIColor = .clear
    
    override var isHighlighted: Bool {
        didSet {
            if oldValue == false && isHighlighted {
                highlight()
            } else if oldValue == true && !isHighlighted {
                unHighlight()
            }
        }
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
