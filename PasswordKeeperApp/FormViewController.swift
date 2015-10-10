//
//  FormViewController.swift
//  PasswordKeeperApp
//
//  Created by Juriy Panasevich on 10.10.15.
//  Copyright (c) 2015 Juriy Panasevich. All rights reserved.
//
import UIKit
import CoreData

class FormViewController: UIViewController {
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var genBtn: UIButton!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var generatedField: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.genBtn.setTitle("Generate Password", forState: .Normal)
        self.generatedField.text = ""
        self.saveBtn.setTitle("Save", forState: .Normal)
    }
    
    @IBAction func generatePassword() {
        self.generatedField.text = "TEST_PASSWORD"
    }
    @IBAction func save() {
        if let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext {
            
            var pwd:Passwords!
            pwd = NSEntityDescription.insertNewObjectForEntityForName("Passwords", inManagedObjectContext: managedObjectContext) as! Passwords
            pwd.title = self.titleField.text
            pwd.value = self.generatedField.text
            
            
            var e: NSError?
            managedObjectContext.save(&e)
            
            NSNotificationCenter.defaultCenter().postNotificationName("load", object: nil)
            
            self.navigationController?.popViewControllerAnimated(true)
        }
    }
}