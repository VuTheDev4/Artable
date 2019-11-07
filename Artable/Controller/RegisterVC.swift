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
    @IBOutlet weak var passCheckImg: UIImageView!
    @IBOutlet weak var confirmPassCheckImg: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordTxt.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        
        confirmPassTxt.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        
    }
    
    //Password matching feature
    @objc func textFieldDidChange(_ textField: UITextField) {
        
        guard let passText = passwordTxt.text else { return }
        
        if textField == confirmPassTxt {
            passCheckImg.isHidden = false
            confirmPassCheckImg.isHidden = false
        } else {
            if passText.isEmpty {
                passCheckImg.isHidden = true
                confirmPassCheckImg.isHidden = true
                confirmPassTxt.text = ""
            }
        }
        
        if passwordTxt.text == confirmPassTxt.text {
            passCheckImg.image = UIImage(named: AppImages.GreenCheck)
            confirmPassCheckImg.image = UIImage(named: AppImages.GreenCheck)
        } else {
            passCheckImg.image = UIImage(named: AppImages.RedCheck)
            confirmPassCheckImg.image = UIImage(named: AppImages.RedCheck)
        }
    }
    
    @IBAction func registerClicked(_ sender: Any) {
        
        guard let email = emailTxt.text , email.isNotEmpty ,
            let username = usernameTxt.text, username.isNotEmpty ,
            let password = passwordTxt.text, password.isNotEmpty else {
                
                simpleAlert(title: "Error", msg: "Please fill out all fields")
                return
        }
        
        guard let confirmPass = confirmPassTxt.text, confirmPass == passwordTxt.text else {
            simpleAlert(title: "Ok", msg: "Passwords do not match")
            return
        }
        
        activityIndicator.startAnimating()
        
        guard let authUser = Auth.auth().currentUser else { return }
        
        let credential = EmailAuthProvider.credential(withEmail: email, password: password)
        
        authUser.link(with: credential) { (result, error) in
            if let error = error {
                debugPrint(error)
                Auth.auth().handlFireAuthError(error: error, vc: self)
                return
            }
            self.activityIndicator.stopAnimating()
            self.dismiss(animated: true, completion: nil)
        }
    }
}
