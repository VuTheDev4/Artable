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
        
        let modalVC = ForgotPasswordVC()
        modalVC.modalPresentationStyle = .overCurrentContext
        modalVC.modalTransitionStyle = .crossDissolve
        present(modalVC, animated: true, completion: nil)
        
    }
    
    @IBAction func loginClicked(_ sender: Any) {
        
        guard let email = emailTxt.text , email.isNotEmpty ,
        let password = passText.text ,  password.isNotEmpty else {
                simpleAlert(title: "Ok", msg: "Please fill out all fields")
                return
        }
        
        activityIndicator.startAnimating()
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
          
            if let error = error {
                Auth.auth().handlFireAuthError(error: error, vc: self)
                self.activityIndicator.stopAnimating()
                debugPrint(error)
                return
            }
            self.activityIndicator.stopAnimating()
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func guestClicked(_ sender: Any) {
        
    }
}
