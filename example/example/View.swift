//
//  View.swift
//  waitMe
//
//  Created by Jari Kalinainen on 02.03.16.
//  Copyright © 2016 Jari Kalinainen. All rights reserved.
//

import UIKit

class View: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private var imageView = UIImageView(image: UIImage(named: "waitImages.f_logo"))
    
    var duration: NSTimeInterval = 1.5
    
    override func drawRect(rect: CGRect) {
        imageView.backgroundColor = UIColor.clearColor()
        imageView.center = self.center
        self.addSubview(imageView)
    }
    
    private var stop = false
    
    func stopRotate() {
        stop = true
        UIView.beginAnimations("fadeOut", context: nil)
        UIView.setAnimationRepeatCount(0)
        UIView.setAnimationDuration(duration/4)
        self.alpha = 0.0
        UIView.commitAnimations()
    }
    
    func startRotate() {
        if stop {
            stop = false
            return
        }
        UIView.beginAnimations("firstPart", context: nil)
        let r3Dt = CATransform3DRotate(imageView.layer.transform, CGFloat(M_PI), 0.0, 1.0, 0.0);
        UIView.setAnimationRepeatCount(0)
        UIView.setAnimationDuration(duration/2)
        UIView.setAnimationDidStopSelector("nextRotate")
        UIView.setAnimationDelegate(self)
        imageView.layer.transform = r3Dt;
        UIView.commitAnimations()
        if i > 5 {
            self.stopRotate()
        }
    }
    
    var i = 0
    
    func nextRotate() {
        UIView.beginAnimations("secondPart", context: nil)
        let r3Dt = CATransform3DRotate(imageView.layer.transform, CGFloat(M_PI), 0.0, 1.0, 0.0);
        UIView.setAnimationRepeatCount(0)
        UIView.setAnimationDuration(duration/2)
        UIView.setAnimationDidStopSelector("startRotate")
        UIView.setAnimationDelegate(self)
        imageView.layer.transform = r3Dt;
        UIView.commitAnimations()
        ++i
    }
    
    
}
