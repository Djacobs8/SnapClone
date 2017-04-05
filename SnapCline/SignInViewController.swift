//
//  SignInViewController.swift
//  SnapCline
//
//  Created by Derek Jacobs on 2017-04-05.
//  Copyright © 2017 Derek Jacobs. All rights reserved.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func signinTapped(_ sender: Any) {
        
        FIRAuth.auth()?.signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
            // takes in a string for an email, string for a password, will give back a user and an error, can enter code here
            print("We tried to sign in")
            if error != nil {
                print("Hey we have an error \(error)")
                
                FIRAuth.auth()?.createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: { (user, error) in
                    print("We tried to create a user")
                    if error != nil {
                        print("Hey we have an error \(error)")
                    } else {
                        print("Created user successfully")
                        self.performSegue(withIdentifier: "signinSegue", sender: nil)
                    }
                })
                
            } else {
                print("Sign in successful")
                self.performSegue(withIdentifier: "signinSegue", sender: nil)
            }
        })
        
    }
    
}

