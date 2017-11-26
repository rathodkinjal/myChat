//
//  SignInViewController.swift
//  MyChat
//
//  Created by Rathod, Kinjal on 11/25/17.
//  Copyright © 2017 Rathod, Kinjal. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func turnUpTapped(_ sender: AnyObject) {
        
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            print("We tried to sign in")
            if error != nil {
                print("We have an error:\(error)")
                
                Auth.auth().createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: { (user, error) in
                    print("We tried to create a user")
                    if error != nil {
                        print("We have an error:\(error)")
                    } else {
                        print("Create user successfully!")
                        self.performSegue(withIdentifier: "signinSeque", sender: nil)
                    }
                })
            } else {
                print("Signed in successfully")
                self.performSegue(withIdentifier: "signinSeque", sender: nil)
            }
        }
        
    }
    
}

