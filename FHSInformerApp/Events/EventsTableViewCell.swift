//
//  EventsTableViewCell.swift
//  FHSInformerApp
//
//  Created by FREDERICK NAULT on 10/10/23.
//

import UIKit

class EventsTableViewCell: UITableViewCell {


    @IBOutlet var eventName: UILabel!
    @IBOutlet var eventDetails: UILabel!
    @IBOutlet var eventLocation: UILabel!
    @IBOutlet var eventDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
