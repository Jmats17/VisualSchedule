//
//  MainViewController.swift
//  VisualSchedule
//
//  Created by Justin Matsnev on 3/28/15.
//  Copyright (c) 2015 Matsnev Studios. All rights reserved.
//

import Foundation
import UIKit

class MainViewController : UIViewController {
    
    @IBOutlet var date: UILabel!
    @IBOutlet var time : UILabel!
    @IBOutlet var school : UIButton!
    @IBOutlet var home : UIButton!
    @IBOutlet var work : UIButton!

    
    func printDate(date1:NSDate){
        let dateFormatter = NSDateFormatter()
        let timeFormatter = NSDateFormatter()
        var theDateFormat = NSDateFormatterStyle.LongStyle
        
        let theTimeFormat = NSDateFormatterStyle.ShortStyle
        
        dateFormatter.dateStyle = theDateFormat
        timeFormatter.timeStyle = theTimeFormat
        
        date.text =  dateFormatter.stringFromDate(date1)
        time.text = timeFormatter.stringFromDate(date1)
    }
    
    override func viewDidLoad() {
        let date = NSDate()
        printDate(date)
        
    }
    
    
    
}