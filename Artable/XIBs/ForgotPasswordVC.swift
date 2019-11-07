//
//  ForgotPasswordVC.swift
//  Artable
//
//  Created by Vu Duong on 11/5/19.
//  Copyright © 2019 Vu Duong. All rights reserved.
//

import UIKit
import Firebase

class ForgotPasswordVC: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func cancelPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func resetPressed(_ sender: Any) {
        
        guard let email = emailTextField.text, email.isNotEmpty else {
            simpleAlert(title: "Error", msg: "Please enter email")
            return
        }
        
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            if let error = error {
                debugPrint(error)
                Auth.auth().handlFireAuthError(error: error, vc: self)
            }
            
            self.dismiss(animated: true, completion: nil)
        }
        
        
    }
    
    
    
}
