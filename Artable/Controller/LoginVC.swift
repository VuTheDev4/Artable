//
//  LoginVC.swift
//  Artable
//
//  Created by Vu Duong on 10/8/19.
//  Copyright © 2019 Vu Duong. All rights reserved.
//

import UIKit
import Firebase

class LoginVC: UIViewController {
    
    @IBOutlet weak var passText: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func forgotPassClicked(_ sender: Any) {
        
    }
    
    @IBAction func loginClicked(_ sender: Any) {
        loginFunction()
    }
    
    @IBAction func guestClicked(_ sender: Any) {
        
    }
    
    func loginFunction() {
        
        guard let email = emailTxt.text,
            let password = passText.text else { return }
        
        activityIndicator.startAnimating()
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
          
            if let error = error {
                self.handlFireAuthError(error: error)
                self.activityIndicator.stopAnimating()
                debugPrint(error)
                return
            }
            self.activityIndicator.stopAnimating()
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}
