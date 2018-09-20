//
//  TableViewCell2.swift
//  NavigationBarProject
//
//  Created by Ibrahima KH GUEYE on 13/05/2018.
//  Copyright © 2018 Ibrahima KH GUEYE. All rights reserved.
//

import UIKit

class TableViewCell2: UITableViewCell {
    @IBOutlet weak var likeButton: UIButton!
    
    @IBAction func likeAction() {
        likeButton.transform.translatedBy(x: 0, y: -15)
        UIView.animate(withDuration: 0.3) {
            self.likeButton.transform = .identity
        }
    }
    
    @IBAction func commentAction() {
    }
    
    @IBAction func shareAction() {
    }
    
}
