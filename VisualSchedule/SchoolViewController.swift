//
//  SchoolViewController.swift
//  VisualSchedule
//
//  Created by Justin Matsnev on 3/28/15.
//  Copyright (c) 2015 Matsnev Studios. All rights reserved.
//

import Foundation
import UIKit

protocol TableViewCellDelegate {
    // indicates that the given item has been deleted
}

class tableViewCell: UITableViewCell, UITextFieldDelegate {
    
    @IBOutlet var label: UILabel!
    @IBOutlet var doneButton : UIButton!
    @IBOutlet var textField : UITextField!
    
    @IBAction func Exiting(sender: UITextField) {
    }
    var view : SchoolViewController?
    
    @IBAction func doneEditing(sender: UITextField) {
        label.text = textField.text
        textField.hidden = true
        label.hidden = false
        if (view?.arrayMut.count >= 6 ) {
            view?.removeItem(label.text!)
        }
        else if (view?.arrayMut.count <= 6) {
        view?.addItem(label.text!)
        }
        else {
           // view?.tableView.reloadData()
        }
    }
    
    
    
    @IBAction func doneButton(sender: AnyObject) {
        label.hidden = true
        textField.hidden = true
        doneButton.hidden = true
        view?.removeItem(label.text!)
        
    }
    
    
    @IBAction func changed(sender: UITextField) {
        
    }
    
    

}







class SchoolViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate, UINavigationControllerDelegate  {
    @IBOutlet var tableView : UITableView!
    @IBOutlet var goodJob : UIImageView!
    func addItem(item : AnyObject) {
       arrayMut.addObject(item)
        self.tableView.reloadData()
    }
    
    func showGoodJob() {
        goodJob.hidden = true
        

    }
    
    func removeItem(item : AnyObject) {
        
        switch arrayMut.indexOfObject(item) {
        case 0:
            goodJob.hidden = false

            var timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("showGoodJob"), userInfo: nil, repeats: false)
            arrayMut.removeObjectAtIndex(0)



            break
        case 1:
            goodJob.hidden = false
            
            var timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("showGoodJob"), userInfo: nil, repeats: false)
            arrayMut.removeObjectAtIndex(1)
            break
        case 2:
            goodJob.hidden = false
            
            var timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("showGoodJob"), userInfo: nil, repeats: false)
            arrayMut.removeObjectAtIndex(2)
            break
        case 3:
            goodJob.hidden = false
            
            var timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("showGoodJob"), userInfo: nil, repeats: false)
            arrayMut.removeObjectAtIndex(3)
            break
        case 4:
            goodJob.hidden = false
            
            var timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("showGoodJob"), userInfo: nil, repeats: false)
            arrayMut.removeObjectAtIndex(4)
            break
        case 5:
            goodJob.hidden = false
            
            var timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("showGoodJob"), userInfo: nil, repeats: false)
            arrayMut.removeObjectAtIndex(5)
            break
        case 6:
            goodJob.hidden = false
            
            var timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("showGoodJob"), userInfo: nil, repeats: false)
            arrayMut.removeObjectAtIndex(6)
            break
        default:
            arrayMut.removeObjectAtIndex(0)
            break
        }
        self.tableView.reloadData()
    }
    
    let arrayMut :NSMutableArray = []
    
    override func viewDidLoad() {
        tableView.delegate = self
        let buttonBorderColor = UIColor.blackColor()

        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell") as tableViewCell
        cell.textField.delegate = self
        cell.label.hidden = true
        cell.doneButton.hidden = true
        goodJob.hidden = true
        cell.textField.layer.borderWidth = 5.0
        cell.textField.layer.borderColor = buttonBorderColor.CGColor
        if (cell.label.userInteractionEnabled == true ) {
            
        }
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return arrayMut.count + 1
        
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as tableViewCell
        cell.selectionStyle = .None
        
        if (indexPath.row == arrayMut.count ) {
            cell.label.text = ""
            cell.textField.hidden = false
            cell.label.hidden = true
            cell.doneButton.hidden = true
            cell.textField.text = ""

        }
        else {
            cell.label.text = arrayMut[indexPath.row] as NSString
            cell.textField.hidden = true
            cell.label.hidden = false
            cell.doneButton.hidden = false
            cell.textField.text = ""
        }
        cell.view = self
        return cell
        
    }
}