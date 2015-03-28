//
//  ViewController.swift
//  VisualSchedule
//
//  Created by Justin Matsnev on 3/28/15.
//  Copyright (c) 2015 Matsnev Studios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        let buttonBorderColor = UIColor.blackColor()
        super.viewDidLoad()
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 2
        button.layer.borderColor = buttonBorderColor.CGColor
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func beginButton(sender: AnyObject) {
  
    }

}

