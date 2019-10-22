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
        
        if Auth.auth().currentUser == nil {
            Auth.auth().signInAnonymously { (result, error) in
                if let error = error {
                    debugPrint(error)
                    self.handlFireAuthError(error: error)
                }
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if let user = Auth.auth().currentUser, !user.isAnonymous {
            loginOutBtn.title = "Logout"
        } else {
            loginOutBtn.title = "Login"
        }
    }

    @IBAction func loginOutClicked(_ sender: Any) {
        
        guard let user = Auth.auth().currentUser else { return }
        
        if user.isAnonymous {
            presentLoginController()
        } else {
            do {
                try Auth.auth().signOut()
                Auth.auth().signInAnonymously { (result, error) in
                    if let error = error {
                        debugPrint(error)
                        self.handlFireAuthError(error: error)
                    }
                    self.presentLoginController()
                }
            } catch {
                self.handlFireAuthError(error: error)
                debugPrint(error)
            }
        }
        
//        if let _ = Auth.auth().currentUser {
//
//            do {
////                try Auth.auth().signOut()
//                presentLoginController()
//            } catch {
//                debugPrint(error.localizedDescription)
//            }
//        } else {
//            presentLoginController()
//        }
    }
    
    fileprivate func presentLoginController() {
        let storyboard = UIStoryboard(name: Storyboard.Loginstoryboard, bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: StoryboardId.LoginVC)
        present(controller, animated: true, completion: nil)
    }
    
}

