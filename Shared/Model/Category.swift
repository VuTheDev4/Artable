//
//  Category.swift
//  Artable
//
//  Created by Vu Duong on 11/6/19.
//  Copyright © 2019 Vu Duong. All rights reserved.
//

import Foundation
import Firebase

struct Category {
    var name : String
    var id: String
    var imageUrl: String
    var active: Bool = true
    var timeStamp: Timestamp
}

