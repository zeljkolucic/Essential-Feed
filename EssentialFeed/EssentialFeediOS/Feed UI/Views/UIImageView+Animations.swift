//
//  UIImageView+Animations.swift
//  EssentialFeediOS
//
//  Created by Zeljko Lucic on 9.11.22..
//

import UIKit

extension UIImageView {
    func setImageAnimated(_ newImage: UIImage?) {
        image = newImage
        
        guard newImage != nil else { return }
        
        alpha = 0
        UIView.animate(withDuration: 0.25) {
            self.alpha = 1
        }
    }
}