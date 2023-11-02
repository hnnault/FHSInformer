//
//  ClubTableViewCell.swift
//  FHSInformerApp
//
//  Created by FREDERICK NAULT on 10/10/23.
//

import UIKit

class ClubTableViewCell: UITableViewCell {


    @IBOutlet var clubName: UILabel!
    @IBOutlet var clubTeacher: UILabel!
    @IBOutlet var roomNumber: UILabel!
    @IBOutlet var clubDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
