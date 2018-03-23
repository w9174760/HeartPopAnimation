//
//  ViewController.swift
//  HeartPopAnimation
//
//  Created by Jang DongHyun on 2018. 3. 23..
//  Copyright © 2018년 Jang Dong-Hyun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var heartView: HeartAnimationView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    @IBAction func tapAction(_ sender: Any) {
        self.heartView?.showBubbleHeart()
    }
    
}

