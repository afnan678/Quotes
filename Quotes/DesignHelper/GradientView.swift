//
//  GradientView.swift
//  Quotes
//
//  Created by apple on 07/12/2023.
//

import Foundation
import UIKit



@IBDesignable
class GradientView: UIView {
    
    // Define the colors for the gradient
    @IBInspectable var startColor: UIColor = UIColor.red {
        didSet {
            updateGradient()
        }
    }
    @IBInspectable var endColor: UIColor = UIColor.yellow {
        didSet {
            updateGradient()
        }
    }
    
    @IBInspectable var corner: CGFloat = 0.0 {
        didSet {
            updateGradient()
        }
    }
    // Create gradient layer
    let gradientLayer = CAGradientLayer()
    
    override func draw(_ rect: CGRect) {
        // Set the gradient frame
        gradientLayer.frame = rect
        
        // Set the colors
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        // Gradient is linear from left to right
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
        
        // Add gradient layer into the button
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func updateGradient() {
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        layer.cornerRadius = corner
        layer.masksToBounds = true
    }
}


//class GradientView: UIView {
//
//    override class var layerClass: AnyClass {
//        return CAGradientLayer.self
//    }
//
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        if let gradientLayer = layer as? CAGradientLayer {
//            // Define your colors for the gradient
//            
//            
////            let leftColor = UIColor(red: 165.0, green: 83.0, blue: 255.0, alpha: 1.0)
////            let rightColor = UIColor(red: 86.0, green: 33.0, blue: 255.0, alpha: 1.0)
//            let leftColor = UIColor.red.cgColor
//            let rightColor = UIColor.blue.cgColor
//
//            // Set the colors for the gradient layer
//            gradientLayer.colors = [leftColor, rightColor]
//
//            // Set the start and end points of the gradient (left to right)
//            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
//            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
//        }
//    }
//}
