//
//  TickCrossToggle.swift
//  UIButtons
//
//  Created by James Tapping on 04/03/2021.
//

import Foundation
import UIKit

class TickCrossToggle: UIButton {
    
    var imagesListArray :[UIImage] = []
    var firstImagesListArray :[UIImage] = []
    var secondImagesListArray :[UIImage] = []
    
    let key = "tick"
    
    let startImage = UIImage(named: "icons8-cancel-0")
    let endImage = UIImage(named: "icons8-cancel-15")
    
    let impactGenerator = UIImpactFeedbackGenerator()
    
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
        
        setButtonInitialState()
        setUpAllFrames()
        setUpAnimatedFramesToTick()
        setUpAnimatedFramesToCross()
        
        adjustsImageWhenHighlighted = false
        
        addTarget(self, action: #selector(activateButton), for: .touchUpInside)
        
    }
    
    func setButtonInitialState() {
        
        if userDefaults.bool(forKey: key) {
            
            setImage(endImage, for: .normal)
            
        } else {
            
            setImage(startImage, for: .normal)
            
        }
    }
    
    func setUpAllFrames() {
        
        for position in 0...27
        {
            let strImageName : String = "icons8-cancel-\(position)"
            let image  = UIImage(named:strImageName)
            imagesListArray.append(image!)
        }
        
    }
    
    func setUpAnimatedFramesToTick() {
        
        for position in 0...14
        {
            let image = imagesListArray[position]
            firstImagesListArray.append(image)
        }
        
    }
    
    func setUpAnimatedFramesToCross() {
        
        for position in 15...27
        {
            let image  = imagesListArray[position]
            secondImagesListArray.append(image)
        }
        
    }
    
    @objc func activateButton(){
        
        impactGenerator.impactOccurred()
        
        if userDefaults.object(forKey: key) == nil || !userDefaults.bool(forKey: key) {
            
            imageView?.animationImages = firstImagesListArray
            imageView?.animationDuration = 0.5
            imageView?.animationRepeatCount = 1
            imageView?.startAnimating()
            setImage(endImage, for: .normal)
            
            userDefaults.setValue(true, forKey: key)
            
        } else {
            
            imageView?.animationImages = secondImagesListArray
            imageView?.animationDuration = 0.5
            imageView?.animationRepeatCount = 1
            imageView?.startAnimating()
            setImage(startImage, for: .normal)
            
            userDefaults.setValue(false, forKey: key)
            
        }
    }
}
