//
//  DailyCalenderViewController.swift
//  FHSInformerApp
//
//  Created by FREDERICK NAULT on 10/26/23.
//

import Foundation
import UIKit


class CalenderController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet var dayLabel: UILabel!
    @IBOutlet var dayOfWeekLabel: UILabel!
    @IBOutlet var hourTableView: UITableView!
    
    var curDate = Date() //current date
    let calender = NSCalendar.current
    
    var hours = [Int]()
    
    

    // Setup useful converstion functions \\
    
    func monthDateString(date: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL dd"
        return dateFormatter.string(from: date)
    }
    
    func weekDay(date: Date) -> Int{
        let components = calender.dateComponents([.weekday], from: date)
        return components.weekday! - 1
    }
    
    func weekDayAsString(date: Date) -> String {
        switch weekDay(date: date){
            case 0:
                return "Sunday"
            case 1:
                return "Monday"
            case 2:
                return "Tuesday"
            case 3:
                return "Wednesday"
            case 4:
                return "Thursday"
            case 5:
                return "Friday"
            case 6:
                return "Saturday"
            default:
                return ""
        }
    }
    
    
    func addDays(date: Date, days: Int) -> Date{
        return calender.date(byAdding: .day, value: days, to: date)!
    }
    
    func hourFromDate(date: Date) -> Int{
        let components = calender.dateComponents([.hour], from: date)
        return components.hour!
    }
    
    func eventsForDateAndTime(date: Date, hour: Int) -> [Event]{
        var daysEvents = [Event]()
        for event in eventsList{
            if(calender.isDate(event.date, inSameDayAs:date)){
                let eventHour = hourFromDate(date: event.date)
                
                if (eventHour == hour){
                    daysEvents.append(event)
                }

            }
        }
        return daysEvents
    }

    
    // Main Code \\
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //var newEventDate = calender.startOfDay(for: curDa)
        let newEvent = Event()
        newEvent.id = 1
        newEvent.name = "Halloween"
        newEvent.date = Date(timeIntervalSince1970: 1698724800) // Halloween at midnight
        eventsList.append(newEvent)
        
        let newEvent2 = Event()
        newEvent2.id = 2
        newEvent2.name = "Do Something Club"
        newEvent2.date = Date(timeIntervalSince1970: 1698865200)
        eventsList.append(newEvent2)
        
        let newEvent3 = Event()
        newEvent3.id = 3
        newEvent3.name = "Seth's Birthday"
        newEvent3.date = Date(timeIntervalSince1970: 1719115200)
        eventsList.append(newEvent3)

        
        initTime()
        setDayView()
        hourTableView.reloadData()
        
    }
    
    func initTime(){
        for hour in 0...23{
            hours.append(hour)
        }
    }
    
    func setDayView(){
        dayLabel.text = monthDateString(date: curDate)
        dayOfWeekLabel.text = weekDayAsString(date: curDate)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hours.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DailyCalCell") as! DailyCalenderCell
        
        let hour = hours[indexPath.row]
        cell.time.text = formatHour(hour: hour)
        
        let events = eventsForDateAndTime(date: curDate, hour: hour)
        setEvents(cell, events)
        
        return cell
    }
    
    
    func setEvents(_ cell: DailyCalenderCell,_ events: [Event]){
        hideAll(cell)
        
        switch events.count{
        case 1:
            setEvent1(cell, events[0])
        case 2:
            setEvent1(cell, events[0])
            setEvent2(cell, events[1])
        case 3:
            setEvent1(cell, events[0])
            setEvent2(cell, events[1])
            setEvent3(cell, events[2])
        case let count where count > 3:
            //setEvent1(cell, events[0])
            //setEvent2(cell, events[1])
            
            setMoreEvents(cell, events.count)
        default:
            break
        }
    }
    
    func setMoreEvents(_ cell : DailyCalenderCell, _ count: Int){
        cell.event1.isHidden = false
        cell.event1.text = String(count) + " Total Events. Please see news tab for more."
    }

    
    func setEvent1(_ cell : DailyCalenderCell, _ event: Event){
        cell.event1.isHidden = false
        cell.event1.text = event.name
    }
    
    func setEvent2(_ cell : DailyCalenderCell, _ event: Event){
        cell.event2.isHidden = false
        cell.event2.text = event.name
    }
    
    func setEvent3(_ cell : DailyCalenderCell, _ event: Event){
        cell.event3.isHidden = false
        cell.event3.text = event.name
    }
    
    func hideAll(_ cell: DailyCalenderCell){
        cell.event1.isHidden = true
        cell.event2.isHidden = true
        cell.event3.isHidden = true
    }
    
    func formatHour(hour: Int) -> String{
        return String(format: "%02d:%02d", hour, 0)
    }
    
    @IBAction func nextDayAction(_ sender: Any) {
        curDate = addDays(date: curDate, days: 1)
        setDayView()
        hourTableView.reloadData()
    }
    
    @IBAction func prevDayAction(_ sender: Any) {
        curDate = addDays(date: curDate, days: -1)
        setDayView()
        hourTableView.reloadData()
    }
}
