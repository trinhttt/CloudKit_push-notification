//
//  ListTableViewCell.swift
//  test_push-noti
//
//  Created by Trinh Thai on 5/15/18.
//  Copyright © 2018 Trinh Thai. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var taskLabel: UILabel!
    
    var list: List?
    
    
    
    
    
}

extension ListTableViewCell {
    
    func updateViews(list: List) {
        
        self.list = list
        taskLabel.text = list.item
    }
}
