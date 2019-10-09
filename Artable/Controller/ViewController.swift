//
//  ViewController.swift
//  Artable
//
//  Created by Vu Duong on 10/7/19.
//  Copyright © 2019 Vu Duong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let storyboard = UIStoryboard(name: "LoginStoryboard", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "loginVC")
        present(controller, animated: true, completion: nil)
    }


}

