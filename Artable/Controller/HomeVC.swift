//
//  ViewController.swift
//  Artable
//
//  Created by Vu Duong on 10/7/19.
//  Copyright © 2019 Vu Duong. All rights reserved.
//

import UIKit
import Firebase

class HomeVC: UIViewController {
    @IBOutlet weak var loginOutBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if let _ = Auth.auth().currentUser {
            loginOutBtn.title = "Logout"
        } else {
            loginOutBtn.title = "Login"
        }
    }

    @IBAction func loginOutClicked(_ sender: Any) {
        
        if let _ = Auth.auth().currentUser {
            
            do {
                try Auth.auth().signOut()
                presentLoginController()
            } catch {
                debugPrint(error.localizedDescription)
            }
        } else {
            presentLoginController()
        }
    }
    
    fileprivate func presentLoginController() {
        
        let storyboard = UIStoryboard(name: Storyboard.Loginstoryboard, bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: StoryboardId.LoginVC)
        present(controller, animated: true, completion: nil)
    }
    
}

