//
//  MusicInfoCell.swift
//  NTProgress
//
//  Created by Laptev Sasha on 23/08/2018.
//  Copyright © 2018 Laptev Sasha. All rights reserved.
//

import UIKit

class MusicInfoCell: UITableViewCell {

    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var song: UILabel!
    @IBOutlet weak var artist: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
