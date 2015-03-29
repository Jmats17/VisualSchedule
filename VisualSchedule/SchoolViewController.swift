//
//  SchoolViewController.swift
//  VisualSchedule
//
//  Created by Justin Matsnev on 3/28/15.
//  Copyright (c) 2015 Matsnev Studios. All rights reserved.
//

import Foundation
import UIKit

class tableViewCell: UITableViewCell, UITextFieldDelegate {
    
    @IBOutlet var label: UILabel!
    
    @IBOutlet var image1: UIImageView!
    
    @IBOutlet var textField : UITextField!
    
    @IBAction func Exiting(sender: UITextField) {
    }
    
    
    @IBAction func doneEditing(sender: UITextField) {
        label.text = textField.text
        textField.hidden = true
        label.hidden = false
        
    }
    
    
}


class SchoolViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate  {
    @IBOutlet var tableView : UITableView!
    
    let arrayMut : NSMutableArray = [""]
    
    override func viewDidLoad() {
        tableView.delegate = self
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell") as tableViewCell
        cell.textField.delegate = self
        cell.label.hidden = true
    }
    
    
    
//    func addAndReload() {
//        self.tableView.reloadData()
//
//        arrayMut.addObject("")
//    }
   
//    @IBAction func choosePicture(sender: AnyObject) {
//        let imagePicker = UIImagePickerController()
//        imagePicker.editing = false
//        // imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
//        //self.presentViewController(imagePicker, animated: true, completion: nil)
//        
//        let action = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
//        
//        let libButton = UIAlertAction(title: "Choose From Library", style: UIAlertActionStyle.Default) { (libSelected) -> Void in
//            imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
//            self.presentViewController(imagePicker, animated: true, completion: nil)
//            
//        }
//        action.addAction(libButton)
//        
//        let cameraButton = UIAlertAction(title: "Take A Picture", style: UIAlertActionStyle.Default) {
//            (camSelected) -> Void in
//            
//            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
//                imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
//                self.presentViewController(imagePicker, animated: true, completion: nil)
//            }
//            else {
//                
//            }
//        }
//        
//        let cancelButton = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) { (cancelSelected) -> Void in
//            
//        }
//        action.addAction(cameraButton)
//        action.addAction(cancelButton)
//        self.presentViewController(action, animated: true, completion: nil)
//    }


   
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return arrayMut.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as tableViewCell
        
        cell.label.text = arrayMut[indexPath.row] as NSString
        arrayMut.addObject("")
        return cell
        
    }
}