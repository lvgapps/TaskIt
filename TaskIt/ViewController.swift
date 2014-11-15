//
//  ViewController.swift
//  TaskIt
//
//  Created by Wale Anif on 11/13/14.
//  Copyright (c) 2014 Lavvo Group. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var taskArray: [TaskModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Give Access to this UITableViewDataSource and UITableViewDelegate ViewController
        tableView.dataSource = self
        tableView.delegate = self
        
        //Hide blank cells
        tableView.tableFooterView = UIView()
        
        let task1: TaskModel = TaskModel(task: "Study French", subtask: "Verbs", date: "01/14/2014")
        let task2: TaskModel = TaskModel(task: "Eat Dinner", subtask: "Burgers", date: "01/14/2014")
        let task3: TaskModel = TaskModel(task: "Gym", subtask: "Leg Day", date: "01/14/2014")

        taskArray = [task1, task2, task3]
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //UITableViewDataSource ---------------------------------------------------------------------------------------
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return taskArray.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        println(indexPath.row)
        
        var cell: TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as TaskCell
        
        cell.taskLabel.text = taskArray[indexPath.row].task
        cell.descriptionLabel.text = taskArray[indexPath.row].subtask
        cell.dateLabel.text = taskArray[indexPath.row].date
        
        return cell
    }
    
    //UITableViewDelegate ---------------------------------------------------------------------------------------
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        //
        
        println(indexPath.row)
        
        performSegueWithIdentifier("showTaskDetail", sender: self)
        
    }


}

