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
    
    func removeItem(item : AnyObject) {
        
        switch arrayMut.indexOfObject(item) {
        case 0:
            arrayMut.removeObjectAtIndex(0)
            UIView.animateWithDuration(1.0,delay: 0.0, options:UIViewAnimationOptions.TransitionCrossDissolve, animations: {
                self.goodJob.hidden = false
            }, completion: nil )
        case 1:
            arrayMut.removeObjectAtIndex(1)
        case 2:
            arrayMut.removeObjectAtIndex(2)
        case 3:
            arrayMut.removeObjectAtIndex(3)
        case 4:
            arrayMut.removeObjectAtIndex(4)
        case 5:
            arrayMut.removeObjectAtIndex(5)
        case 6:
            arrayMut.removeObjectAtIndex(6)
        default:
            arrayMut.removeObjectAtIndex(0)
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
        cell.textField.hidden = true
        cell.doneButton.hidden = true
        goodJob.hidden = true
        cell.doneButton.layer.borderColor = buttonBorderColor.CGColor
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