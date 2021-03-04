//
//  HeartButton.swift
//  UIButtons
//
//  Created by James Tapping on 04/03/2021.
//

import UIKit

class HeartButton: UIButton {
  private var isLiked = false
  
  private let unlikedImage = UIImage(named: "heart")
  private let likedImage = UIImage(named: "heart.fill")
  
  private let unlikedScale: CGFloat = 0.7
  private let likedScale: CGFloat = 1.3

  override public init(frame: CGRect) {
    super.init(frame: frame)

    setImage(unlikedImage, for: .normal)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  public func flipLikedState() {
    isLiked = !isLiked
    animate()
  }

  private func animate() {
    UIView.animate(withDuration: 0.1, animations: {
      let newImage = self.isLiked ? self.likedImage : self.unlikedImage
      let newScale = self.isLiked ? self.likedScale : self.unlikedScale
      self.transform = self.transform.scaledBy(x: newScale, y: newScale)
      self.setImage(newImage, for: .normal)
    }, completion: { _ in
      UIView.animate(withDuration: 0.1, animations: {
        self.transform = CGAffineTransform.identity
      })
    })
  }
}
