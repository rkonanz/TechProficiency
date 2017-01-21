//
//  LogInViewController.swift
//  FinalEdit
//
//  Created by Konanz, Roberto X on 1/18/17.
//  Copyright © 2017 Konanz, Roberto X. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonTapped(sender: AnyObject) {
        
        let userEmail = userEmailTextField.text;
        let userPassword = userPasswordTextField.text;
        
        let userEmailStored = NSUserDefaults.standardUserDefaults().stringForKey("userEmail");
        let userPasswordStored = NSUserDefaults.standardUserDefaults().stringForKey("userPassword");
        
        if(userEmail!.isEmpty || userPassword!.isEmpty){
            
            let alert = UIAlertController(title: "Error", message: "User or Password Can't Be Empty!", preferredStyle: UIAlertControllerStyle.Alert);
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil));
            self.presentViewController(alert, animated: true, completion: nil);
            return;
            
        }
        
        if(userEmailStored == userEmail)
        {
            if(userPasswordStored == userPassword)
            {
                self.performSegueWithIdentifier("loggedIn", sender: self);
            }
        }
        
        let alert = UIAlertController(title: "Error", message: "Wrong Username or Password!", preferredStyle: UIAlertControllerStyle.Alert);
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil));
        self.presentViewController(alert, animated: true, completion: nil);
        
    }
    
    

}
