//
//  EventController.swift
//  FHSInformerApp
//
//  Created by FREDERICK NAULT on 10/10/23.
//

import UIKit

class EventController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet var eventTable: UITableView!
    
    let eventNames = ["Boys Football", "Boys Basketball", "Womans Basketball", "Womans Basketball"]
    
    let eventDetails = ["Fishers Tigers vs. Hamilton Southeastern Royals","Fishers Tigers vs. New Castle High School","Fishers Tigers vs. Ben Davis High School","Fishers Tigers vs. Center Grove High School"]
    
    let eventLocations = ["@ HSE High School","@ New Castle High School","@ Fishers High School","@ Center Grove High School"]

    let eventDates = ["11/3 @ 7:00pm","11/16 @ 6:00PM","10/31 @ 7:30PM","11/04 @ 7:30PM"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "EventsTableViewCell", bundle: nil)
        eventTable.register(nib, forCellReuseIdentifier: "EventsTableViewCell")
        
        eventTable.delegate = self
        eventTable.dataSource = self
    }
    
    //return count of Events
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventNames.count
    }

    // Setup Cells per index in table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let eventCell = tableView.dequeueReusableCell(withIdentifier: "EventsTableViewCell", for: indexPath) as! EventsTableViewCell
        
        
        eventCell.eventName?.text = eventNames[indexPath.row]
        eventCell.eventDetails?.text = eventDetails[indexPath.row]
        eventCell.eventDate?.text = eventDates[indexPath.row]
        eventCell.eventLocation?.text = eventLocations[indexPath.row]
        
        return eventCell
    }

}
