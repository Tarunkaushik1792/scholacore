//
//  TimeTableViewController.swift
//  Scholacore
//
//  Created by Tarun kaushik on 16/05/17.
//  Copyright © 2017 Tarun kaushik. All rights reserved.
//

import UIKit

class TimeTableViewController: UIViewController,UITableViewDelegate, UITableViewDataSource,TimeTableCellDelegate {
    @IBOutlet var weekdaysSegmentController: UISegmentedControl!
    @IBOutlet var subjectsTableView: UITableView!
    
    @IBOutlet var weekdayContainerView: UIView!
    
    var subjects = ["Project Management", "SPSS","Break" , "Research Methodology","Financial Accounting","Break","Managerial Economics","Principles of Management","Thoery of Everything" , "Engineering maths"]
    var newSubjects = [lecture(subject:"POM" , Hour:9 , Minute:5),lecture(subject:"spss" , Hour:10 , Minute:0),lecture(subject:"Break" , Hour:9 , Minute:5),lecture(subject:"Research Methodology" , Hour:11 , Minute:15),lecture(subject:"Financial Accounting" , Hour:12 , Minute:10),lecture(subject:"Break" , Hour:9 , Minute:5),lecture(subject:"Managerial economics" , Hour:13 , Minute:45),lecture(subject:"Principles of Management" , Hour:14 , Minute:40),lecture(subject:"Principles of Management" , Hour:15 , Minute:30),lecture(subject:"Principles of Management" , Hour:19 , Minute:05)]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
         //self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        let switchButton = UISwitch()
        switchButton.isUserInteractionEnabled = true
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: switchButton)
        NotificationCenter.default.addObserver(self, selector: #selector(self.forgroundAction), name: NSNotification.Name.UIApplicationWillEnterForeground, object: nil)
    setUpWeekDay()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //i m here 
        self.forgroundAction()
    }

    func setUpWeekDay(){
    let date = Date()
    let calender = NSCalendar(calendarIdentifier: .gregorian)
    let  myComponet = calender?.components(.weekday, from: date)
    let weekDay = myComponet?.weekday
        if weekDay != 1{
        weekdaysSegmentController.selectedSegmentIndex = weekDay! - 2
        }else{
        }
    }
    
    @IBAction func segmentController(_ sender: Any) {
        
        switch weekdaysSegmentController.selectedSegmentIndex{
        case 0 :
        subjects = ["Project Management", "SPSS","Break" , "Research Methodology","Financial Accounting","Break","Managerial Economics","Principles of Management","Thoery of Everything" , "Engineering maths"]
            subjectsTableView.reloadData()
        case 1 :
                subjects = ["Mathmatics", "Science","Break" , "Biology","TeleCommuncation Accounting","Break","Sports","Principles of engineering","Tarun kaushik" , "Aman Bajaj"]
                subjectsTableView.reloadData()
        case 2 :
                subjects = ["Project Management", "SPSS","Break" , "Research Methodology","Financial Accounting","Break","Managerial Aconomics","Principles of Management","Tarun kaushik" , "Aman Bajaj"]
                subjectsTableView.reloadData()
        case 3 :
                subjects = ["Project Management", "SPSS","Break" , "Research Methodology","Financial Accounting","Break","Managerial Aconomics","Principles of Management","Tarun kaushik" , "Aman Bajaj"]
                subjectsTableView.reloadData()
        case 4 :
                subjects = ["Project Management", "SPSS","Break" , "Research Methodology","Financial Accounting","Break","Managerial Aconomics","Principles of Management","Tarun kaushik" , "Aman Bajaj"]
                subjectsTableView.reloadData()
        case 5 :
             subjects = ["Project Management", "SPSS","Break" , "Research Methodology","Financial Accounting","Break","Managerial Aconomics","Principles of Management","Tarun kaushik" , "Aman Bajaj"]
             subjectsTableView.reloadData()
        default: break
        }
        
    }

    // MARK: - Table view data source

    func forgroundAction(){
    subjectsTableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return newSubjects.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if subjects[indexPath.row] == "Break"{
          let cell = tableView.dequeueReusableCell(withIdentifier: "breaKcell", for: indexPath)
            return cell
        }else{
            
          let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TimeTableViewCell
          cell.subjectLabelView.text = subjects[indexPath.row]
          cell.lectureINfo = newSubjects[indexPath.row]
          cell.delegate = self
          cell.setupCell()
          return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if subjects[indexPath.row] == "Break"{
            return 30.0
        }else{
            
        return 80.0
            
        }
    }
    
    func timerDidFinished() {
        subjectsTableView.reloadData()
    }

}
