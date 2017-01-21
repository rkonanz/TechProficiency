//
//  RegisterViewController.swift
//  FinalEdit
//
//  Created by Konanz, Roberto X on 1/18/17.
//  Copyright © 2017 Konanz, Roberto X. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerButtonTapped(sender: AnyObject) {
        let userEmail = userEmailTextField.text;
        let userPassword = userPasswordTextField.text;
        let userRepeatPassword = repeatPasswordTextField.text;
        
        // Check If Empty Text Fields
        
        if (userEmail!.isEmpty || userPassword!.isEmpty || userRepeatPassword!.isEmpty){
            let alert = UIAlertController(title: "Error", message: "All Fields are Required!", preferredStyle: UIAlertControllerStyle.Alert);
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil));
            self.presentViewController(alert, animated: true, completion: nil);
            return;
        }
        
        // Check If Passwords Match
        
        if (userPassword != userRepeatPassword){
            let alert = UIAlertController(title: "Error", message: "Passwords Don't Match!", preferredStyle: UIAlertControllerStyle.Alert);
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil));
            self.presentViewController(alert, animated: true, completion: nil);
            return;
        }
        
        // Store Data
        
        NSUserDefaults.standardUserDefaults().setObject(userEmail, forKey:"userEmail");
        NSUserDefaults.standardUserDefaults().setObject(userPassword, forKey:"userPassword");
        NSUserDefaults.standardUserDefaults().synchronize();

        self.performSegueWithIdentifier("registered", sender: self)
        
        
        
    }
    

}
