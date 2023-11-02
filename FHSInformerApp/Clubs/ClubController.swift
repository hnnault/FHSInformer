//
//  ClubController.swift
//  FHSInformerApp
//
//  Created by FREDERICK NAULT on 10/10/23.
//

import UIKit

class ClubController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    
    @IBOutlet var clubTable: UITableView!
    
    let clubNames = ["Do Something Club", "3D Printing Club", "ASL Club","Animal Alliance","Punjabi Culture Club","Computer Science Club"]
    
    let clubTeachers = ["Mrs. Huppenthal","Mrs. Isom","Mrs. Farrand","Mrs. Spencer","Mr. Stahl","Mr. Harris"]
    let clubRoomNum = ["Room B201","Media Center","Room A101","Room A101","Room H10","Room A101"]
    let clubDates = ["11/1 @ 3PM","TBD","11/2 @ 3:05PM","TBD","11/1 @ 3PM","TBD"]
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "ClubTableViewCell", bundle: nil)
        clubTable.register(nib, forCellReuseIdentifier: "ClubTableViewCell")
        
        clubTable.delegate = self
        clubTable.dataSource = self
    }
    
    //return count of clubs
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clubNames.count
    }

    // Setup Cells per index in table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let clubCell = tableView.dequeueReusableCell(withIdentifier: "ClubTableViewCell", for: indexPath) as! ClubTableViewCell
        
        
        clubCell.clubName?.text = clubNames[indexPath.row]
        clubCell.clubTeacher?.text = clubTeachers[indexPath.row]
        clubCell.clubDate?.text = clubDates[indexPath.row]
        clubCell.roomNumber?.text = clubRoomNum[indexPath.row]
        
        return clubCell
    }

}
