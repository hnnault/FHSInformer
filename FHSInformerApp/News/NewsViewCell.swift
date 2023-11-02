//
//  NewsViewCell.swift
//  FHSInformerApp
//
//  Created by FREDERICK NAULT on 10/24/23.
//

import UIKit

class NewsViewCell: UITableViewCell {

    @IBOutlet var newsTitle: UILabel!
    @IBOutlet var newsDescription: UILabel!
    @IBOutlet var newsAuthor: UILabel!
    @IBOutlet var newsDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
