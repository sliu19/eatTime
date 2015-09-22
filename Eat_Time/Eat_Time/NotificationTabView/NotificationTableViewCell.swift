//
//  NotificationTableViewCell.swift
//  Eat_Time
//
//  Created by Simin Liu on 9/8/15.
//  Copyright (c) 2015 Simin Liu. All rights reserved.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.profileImageView.layer.cornerRadius = self.profileImageView.frame.width / 2
        self.profileImageView.clipsToBounds = true
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
