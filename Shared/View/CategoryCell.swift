//
//  CategoryCell.swift
//  Artable
//
//  Created by Vu Duong on 11/6/19.
//  Copyright © 2019 Vu Duong. All rights reserved.
//

import UIKit
import Kingfisher

class CategoryCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryImg: UIImageView!
    @IBOutlet weak var categoryLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryImg.layer.cornerRadius = 5
        
    }
    
    func configureCell (category: Category) {
        categoryLbl.text = category.name
        if let url = URL(string: category.imageUrl) {
            categoryImg.kf.setImage(with: url)
        }
    }

}
