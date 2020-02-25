//
//  FriendTableViewCell.swift
//  FacebookFriends
//
//  Created by Muhammet Taha Genç on 25.02.2020.
//  Copyright © 2020 Muhammet Taha Genç. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
//        profileImage.layer.cornerRadius = 5
//        profileImage.backgroundColor = .lightGray
//        nameLabel.layer.cornerRadius = 5
//        nameLabel.layer.masksToBounds = true
//        nameLabel.backgroundColor = .lightGray
//        emailLabel.layer.cornerRadius = 5
//        emailLabel.layer.masksToBounds = true
//        emailLabel.backgroundColor = .lightGray
    }

    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
