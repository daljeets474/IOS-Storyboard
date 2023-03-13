//
//  CustomHomeTableViewCell.swift
//  IosLearningStoryBoard
//
//  Created by Daljeet Singh on 10/03/23.
//

import UIKit

class CustomHomeTableViewCell: UITableViewCell {

    @IBOutlet weak var titleImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
