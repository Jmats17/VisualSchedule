//
//  MainViewController.swift
//  VisualSchedule
//
//  Created by Justin Matsnev on 3/28/15.
//  Copyright (c) 2015 Matsnev Studios. All rights reserved.
//

import Foundation
import UIKit

class MainViewController : UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate,UINavigationControllerDelegate
 {
    
    @IBOutlet var date: UILabel!
    @IBOutlet var time : UILabel!
    @IBOutlet var school : UIButton!
    @IBOutlet var home : UIButton!
    @IBOutlet var work : UIButton!
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var textField: UITextField!
    @IBOutlet weak var pickPhoto: UIButton!
    var picker : UIImagePickerController? = UIImagePickerController()
    var popOva :UIPopoverController? = nil
    
    
    
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
    
    @IBAction func ending(sender: UITextField) {
    
   
    }
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()

        self.dismissViewControllerAnimated(true, completion: nil)
        self.profileImage.image = image
        let image1 = UIImageJPEGRepresentation(image, 9)
        defaults.setObject(image1, forKey: "image")
        defaults.synchronize()
    }
    

   
    
    @IBAction func pickPhoto(sender: AnyObject) {
        let imagePicker = UIImagePickerController()
        imagePicker.editing = false
        imagePicker.delegate = self
        // imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        //self.presentViewController(imagePicker, animated: true, completion: nil)
        
        let action = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        let libButton = UIAlertAction(title: "Choose From Library", style: UIAlertActionStyle.Default) { (libSelected) -> Void in
            imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            self.presentViewController(imagePicker, animated: true, completion: nil)
            self.pickPhoto.hidden = true
            self.pickPhoto.enabled = false
        }
        action.addAction(libButton)
        
        let cameraButton = UIAlertAction(title: "Take A Picture", style: UIAlertActionStyle.Default) {
            (camSelected) -> Void in
            
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
                imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
                self.presentViewController(imagePicker, animated: true, completion: nil)
                self.pickPhoto.hidden = true
                self.pickPhoto.enabled = false
            }
            else {
                
            }
        }
        
        let cancelButton = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) { (cancelSelected) -> Void in
            
        }
        action.addAction(cameraButton)
        action.addAction(cancelButton)
        self.presentViewController(action, animated: true, completion: nil)
    }
    
    @IBAction func exiting(sender: UITextField) {
        var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()

        var name = ""
        name = textField.text
        name.capitalizedString
        let nameBelongs = "Schedule belongs to: "
        nameLabel.text = "\(nameBelongs)\(name)"
        
        textField.hidden = true
        nameLabel.hidden = false
        defaults.setObject(self.nameLabel.text, forKey: "nameLabel")
        defaults.synchronize()
    }
    
    override func viewDidLoad() {
        var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        var a: AnyObject? = defaults.objectForKey("nameLabel")
        if (a != nil) {
            textField.hidden = true
            nameLabel.hidden = false
            nameLabel.text = "\(a as String)"
        }
        else {
            textField.hidden = false
            nameLabel.hidden = true
        }
        if defaults.dataForKey("image") != nil {
        let imageData = defaults.objectForKey("image") as NSData
        var image = UIImage(data: imageData)
        profileImage.image = image
            pickPhoto.hidden = true
            pickPhoto.enabled = false
        }
        else {
            pickPhoto.hidden = false
            pickPhoto.enabled = true
        }
        println(a)
        
        let date = NSDate()
        printDate(date)
        textField.delegate = self
        var colorBorder : UIColor = UIColor.whiteColor()

        self.profileImage.layer.cornerRadius = self.profileImage.frame.size.width / 2;
        self.profileImage.clipsToBounds = true
        profileImage.layer.borderWidth = 2.0
        profileImage.layer.borderColor = colorBorder.CGColor
        
    }
    
    
    
    
    
}