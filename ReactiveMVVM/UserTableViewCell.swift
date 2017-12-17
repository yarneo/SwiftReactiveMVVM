//
//  UserTableViewCell.swift
//  ReactiveMVVM
//
//  Created by Yarden Eitan on 9/2/17.
//  Copyright © 2017 Yarden Eitan. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var title: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        avatar.layer.masksToBounds = true
        avatar.layer.cornerRadius = 6
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
