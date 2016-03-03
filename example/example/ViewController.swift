//
//  ViewController.swift
//  waitMe
//
//  Created by Jari Kalinainen on 29.02.16.
//  Copyright © 2016 Jari Kalinainen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var waitView : View!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        waitView = View(frame: self.view.frame)
        self.view.addSubview(waitView)
    }

    override func viewDidAppear(animated: Bool) {
        waitView.startRotate()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

