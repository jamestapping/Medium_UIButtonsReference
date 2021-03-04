//
//  ViewController.swift
//  UIButtons
//
//  Created by James Tapping on 03/03/2021.
//

import UIKit
import Lottie
import PassKit

class ViewController: UIViewController {
    
    var applePayButton = PKPaymentButton(paymentButtonType: .buy, paymentButtonStyle: .whiteOutline)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpAnimatedFramesButton()
        setUpLottieButton()
        setupHeartButton()
        
        playButton.setBackgroundColor(.black, for: .highlighted)
        animatedButton.startAnimatingPressActions()
        animatedButton.layer.cornerRadius = 15
        
        soundToggleButton.setSoundButtonInitialState()
        
        applePayButton.center = applePayView.center
        
        applePayButton.frame = CGRect(x: 0 , y: 0, width: 350, height: 45)
        
        applePayView.addSubview(applePayButton)

    }
    
    @objc private func handleHeartButtonTap(_ sender: UIButton) {
        guard let button = sender as? HeartButton else { return }
        button.flipLikedState()
    }
    
    func setupHeartButton() {
        
        let buttonFrame = CGRect(x: view.frame.midX - 25,
                                 y: view.frame.midY - 25,
                                 width: 50,
                                 height: 50)
        let heartButton = HeartButton(frame: buttonFrame)
        heartButton.addTarget(
            self, action: #selector(handleHeartButtonTap(_:)), for: .touchUpInside)
        
        bottomStackView.addArrangedSubview(heartButton)
        
    }
    
    
    func setUpAnimatedFramesButton() {
        
        var imagesListArray :[UIImage] = []
        
        for position in 0...27
        {
            let strImageName : String = "icons8-cancel-\(position)"
            let image  = UIImage(named:strImageName)
            imagesListArray.append(image!)
        }
            animatedFramesButton.setImage(imagesListArray[0], for: .normal)
            animatedFramesButton.imageView?.animationImages = imagesListArray
            animatedFramesButton.imageView?.animationDuration = 1.0
            animatedFramesButton.imageView?.startAnimating()
        
    }
    
    func setUpLottieButton() {
        
        // Show marker information
        
        let jsonName = "heart"
        let animation = Animation.named(jsonName)!
        let markerNames = animation.markerNames
        for name in markerNames {
            print("Marker: \(name)")
            print("Frame: \(String(describing: animation.frameTime(forMarker: name)))")
            print("Progress: \(String(describing: animation.progressTime(forMarker: name)))")
            print("")
        }
        
        // Setup the button
        
        lottieViewButton.animation = Animation.named("heart")

        lottieViewButton.clipsToBounds = false

        lottieViewButton.setPlayRange(fromMarker: "touchDownStart",
                                   toMarker: "touchDownEnd",
                                   event: .touchDown)

        lottieViewButton.setPlayRange(fromMarker: "touchDownEnd",
                                   toMarker: "touchUpCancel",
                                   event: .touchUpOutside)

        lottieViewButton.setPlayRange(fromMarker: "touchDownEnd",
                                   toMarker: "touchUpEnd",
                                   event: .touchUpInside)
        
    }

    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var animatedFramesButton: UIButton!
    
    @IBOutlet weak var animatedFramesAlt: UIButton!
    
    
    @IBOutlet weak var animatedButton: UIButton!
    @IBOutlet weak var addMOneyButton: UIButton!
    @IBOutlet weak var soundToggleButton: SoundToggle!
    @IBOutlet weak var lottieViewButton: AnimatedButton!
    
    @IBOutlet weak var bottomStackView: UIStackView!
    
    @IBOutlet weak var applePayView: UIView!
    
    
}

