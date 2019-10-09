//
//  RegisterVC.swift
//  Artable
//
//  Created by Vu Duong on 10/8/19.
//  Copyright © 2019 Vu Duong. All rights reserved.
//

import UIKit
import Firebase

class RegisterVC: UIViewController {
    
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var confirmPassTxt: UITextField!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func registerClicked(_ sender: Any) {
        
        guard let email = emailTxt.text , !email.isEmpty ,
            let username = usernameTxt.text, !username.isEmpty ,
            let password = passwordTxt.text, !password.isEmpty else {return}
        
        Auth.auth().createUser(withEmail: email, password: password) { (authResults, error) in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let user = authResults?.user else{return}
            print("\(user.email!) created")
        }
    }
}
