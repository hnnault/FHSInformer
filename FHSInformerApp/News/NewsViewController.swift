//
//  NewsViewController.swift
//  FHSInformerApp
//
//  Created by FREDERICK NAULT on 10/24/23.
//

import UIKit

class NewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var newsTable: UITableView!
    
    let newsHeaders = ["Halloween is right around the corner!", "Spirit Week!"]
    let newsBody = ["Halloween is just around the corner! Make sure you dress up and get as much candy as you can!", "Monday - Wear neon! Tuesday - 80's day! Wednesday - Wear your best! Thursday - Jersey Day! Friday - Dress your worse!"]
    let newsAuthors = ["Fishers High School", "Tiger Cage"]
    let newsDates = ["October 31st @ 11:59PM", "October 30th @ 9:30am"]

    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "NewsViewCell", bundle: nil)
        newsTable.register(nib, forCellReuseIdentifier: "NewsViewCell")
        
        newsTable.dataSource = self
        newsTable.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsHeaders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newsCell = tableView.dequeueReusableCell(withIdentifier: "NewsViewCell", for: indexPath) as! NewsViewCell
        
        newsCell.newsTitle?.text = newsHeaders[indexPath.row]
        newsCell.newsDescription?.text = newsBody[indexPath.row]
        newsCell.newsAuthor?.text = "Published By: " + newsAuthors[indexPath.row]
        newsCell.newsDate?.text = "Published on: " + newsDates[indexPath.row]
        
        
        return newsCell
    }
}
