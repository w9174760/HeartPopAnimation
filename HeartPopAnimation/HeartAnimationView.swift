//
//  HeartAnimationView.swift
//  HeartPopAnimation
//
//  Created by Jang DongHyun on 2018. 3. 23..
//  Copyright © 2018년 Jang Dong-Hyun. All rights reserved.
//

import UIKit

class HeartAnimationView: UIView {
    public var heartImageLayerArray : NSMutableArray = [CALayer()]
    public var scaleBackGroundLayer : CALayer?
    public var animationEndTimer: Timer?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        heartImageLayerArray = [CALayer ()]
        
        generateBackgroundImage()
        
    }
    
    func destroyBackGroundLayerAndAnimation() {
        if self.scaleBackGroundLayer != nil {
            self.scaleBackGroundLayer?.removeAllAnimations()
            self.scaleBackGroundLayer?.removeFromSuperlayer()
            self.scaleBackGroundLayer = nil
        }
    }
    
    func degrees(toRadians degrees: CGFloat) -> CGFloat {
        return degrees * .pi / 180
    }
    
    func generateBackgroundImage() {
        destroyBackGroundLayerAndAnimation()
        scaleBackGroundLayer = CALayer()
        
        self.scaleBackGroundLayer!.backgroundColor = UIColor.orange.cgColor
        self.layer.addSublayer(self.scaleBackGroundLayer!)
    }
    
    override var frame: CGRect {
        willSet {
            //use 'frame' and 'newValue' to access the current and soon-to-be-current frames
            print("\(frame) is about to be replaced by \(newValue)")
            //do stuff here
        }
        didSet {
            //use 'frame' and 'oldValue' to access the current and just-was-current frames
            print("\(frame) just replaced \(oldValue)")
            
            //do stuff here
        }
    }
    
    override var bounds: CGRect {
        willSet {
            //use 'bounds' and 'newValue' to access the current and soon-to-be-current bounds
            print("\(bounds) is about to be replaced by \(newValue)")
            self.scaleBackGroundLayer?.frame = newValue
            generateHeartImage()
            //do stuff here
        }
        didSet {
            //use 'bounds' and 'oldValue' to access the current and just-was-current bounds
            print("\(bounds) just replaced \(oldValue)")
            
            //do stuff here
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func createLayer(with image: UIImage?) -> CALayer? {
        let layer = CALayer()
        if let aWidth = image?.size.width, let aHeight = image?.size.height {
            layer.frame = CGRect(x: 0, y: 0, width: aWidth, height: aHeight)
        }
        layer.contents = image?.cgImage
        return layer
    }
    
    func generateHeartImage() {
        if self.heartImageLayerArray.count > 0 {
            self.heartImageLayerArray.removeAllObjects()
        }
        
        
        let imageArray : NSArray = [UIImage(named: "heart")!,
                                    UIImage(named: "heart")!,
                                    UIImage(named: "heart")!,
                                    UIImage(named: "heart")!,
                                    UIImage(named: "heart")!,
                                    UIImage(named: "heart")!,
                                    UIImage(named: "heart")!]
        
        for(idx, image) in imageArray.enumerated() {
            let layer: CALayer! = self.createLayer(with: image as? UIImage)
            var heartPoint = CGPoint.zero
            var angle: CGFloat = 0
            
            switch idx {
            case 0:
                heartPoint = CGPoint(x: (self.scaleBackGroundLayer?.frame.size.width)! - 187, y:  (self.scaleBackGroundLayer?.frame.size.height)! - 141)
                angle = degrees(toRadians: 0)
                layer.frame = CGRect(x: 0, y: 0, width:layer.frame.size.width, height:layer.frame.size.height)
                break
            case 1:
                heartPoint = CGPoint(x:  (self.scaleBackGroundLayer?.frame.size.width)! - 234, y:  (self.scaleBackGroundLayer?.frame.size.height)! - 156)
                angle = degrees(toRadians: -37)
                layer.frame = CGRect(x: 0, y: 0, width:layer.frame.size.width * 0.81, height:layer.frame.size.height * 0.81)
                break
            case 2:
                heartPoint = CGPoint(x:  (self.scaleBackGroundLayer?.frame.size.width)! - 152, y:  (self.scaleBackGroundLayer?.frame.size.height)! - 179)
                angle = degrees(toRadians: 9)
                layer.frame = CGRect(x: 0, y: 0, width:layer.frame.size.width * 0.5, height:layer.frame.size.height * 0.5)
                break
            case 3:
                heartPoint = CGPoint(x:  (self.scaleBackGroundLayer?.frame.size.width)! - 225, y:  (self.scaleBackGroundLayer?.frame.size.height)! - 117)
                angle = degrees(toRadians: -33)
                self.layer.frame = CGRect(x: 0, y: 0, width:layer.frame.size.width * 0.62, height:layer.frame.size.height * 0.62)
                break
            case 4:
                heartPoint = CGPoint(x:  (self.scaleBackGroundLayer?.frame.size.width)! - 178, y:  (self.scaleBackGroundLayer?.frame.size.height)! - 175)
                angle = degrees(toRadians: 4)
                layer.frame = CGRect(x: 0, y: 0, width:layer.frame.size.width * 0.37, height:layer.frame.size.height * 0.37)
                break
            case 5:
                heartPoint = CGPoint(x:  (self.scaleBackGroundLayer?.frame.size.width)! - 135, y:  (self.scaleBackGroundLayer?.frame.size.height)! - 143)
                angle = degrees(toRadians: 27)
                layer.frame = CGRect(x: 0, y: 0, width:layer.frame.size.width * 0.84, height:layer.frame.size.height * 0.84)
                break
            case 6:
                heartPoint = CGPoint(x:  (self.scaleBackGroundLayer?.frame.size.width)! - 204, y:  (self.scaleBackGroundLayer?.frame.size.height)! - 187)
                angle = degrees(toRadians: -9)
                layer.frame = CGRect(x: 0, y: 0, width:layer.frame.size.width * 0.61, height:layer.frame.size.height * 0.61)
                break
            default:
                heartPoint = CGPoint(x: (self.scaleBackGroundLayer?.frame.size.width)! - 187, y: (self.scaleBackGroundLayer?.frame.size.height)! - 141)
                angle = degrees(toRadians: 0)
                break
            }
            
            layer.transform = CATransform3DMakeRotation(angle, 0, 0, 1)
            layer.position = heartPoint
            layer.opacity = 0.0
            heartImageLayerArray.add(layer)
            scaleBackGroundLayer?.addSublayer(layer)
        }
    }
    
    public func showBubbleHeart() {
        
        for(idx, layer) in heartImageLayerArray.enumerated() {
            if (layer as! CALayer).animationKeys() == nil {
                let scale1 = CABasicAnimation()
                scale1.keyPath = "transform.scale"
                scale1.fromValue = 0.5
                scale1.toValue = 1.5
                scale1.duration = 0.1
                
                let scale2 = CABasicAnimation()
                scale2.keyPath = "transform.scale"
                scale2.fromValue = 1.5
                scale2.toValue = 1
                scale2.beginTime = 0.1
                scale2.duration = 0.5
                
                let alpha1 = CABasicAnimation()
                alpha1.keyPath = "opacity"
                alpha1.fromValue = 0.0
                alpha1.toValue = 1
                alpha1.duration = 0.001
                alpha1.beginTime = 0
                
                let alpha2 = CABasicAnimation()
                alpha2.keyPath = "opacity"
                alpha2.fromValue = 1
                alpha2.toValue = 1
                alpha2.duration = 0.599
                alpha2.beginTime = 0.001
                
                let alpha3 = CABasicAnimation()
                alpha3.keyPath = "opacity"
                alpha3.fromValue = 1
                alpha3.toValue = nil
                alpha3.duration = 0.001
                alpha3.beginTime = 1
                
                let group = CAAnimationGroup()
                group.animations = [scale1, scale2, alpha1, alpha2, alpha3]
                group.duration = 0.601
                
                group.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)
                group.fillMode = kCAFillModeForwards
                group.isRemovedOnCompletion = false
                (layer as! CALayer).add(group, forKey: "group")
                
                
                if idx == heartImageLayerArray.count - 1 {
                    (heartImageLayerArray.firstObject as! CALayer).removeAllAnimations()
                }
                else {
                    (heartImageLayerArray[idx + 1] as! CALayer).removeAllAnimations()
                }
                return
            }
        }
    }
}


