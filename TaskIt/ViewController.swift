//
//  ViewController.swift
//  TaskIt
//
//  Created by Wale Anif on 11/13/14.
//  Copyright (c) 2014 Lavvo Group. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let appDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext
    
    var fetchedResultsController:NSFetchedResultsController = NSFetchedResultsController()
    
    //var taskArray: [TaskModel] = []
    var baseArray: [[TaskModel]] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Give Access to this UITableViewDataSource and UITableViewDelegate ViewController
        tableView.dataSource = self
        tableView.delegate = self
        
        //Hide blank cells
        tableView.tableFooterView = UIView()
        
        fetchedResultsController = getFetchedResultsController()
        fetchedResultsController.delegate = self
        fetchedResultsController.performFetch(nil)
    
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
//        taskArray = taskArray.sorted{
//            (taskOne: TaskModel, taskTwo: TaskModel) -> Bool in
//            //comparison logic
//            
//            return taskOne.date.timeIntervalSince1970 < taskTwo.date.timeIntervalSince1970
//        }
        
        //SAME AS ABOVE
        //baseArray[0].sort{$0.date.timeIntervalSince1970 < $1.date.timeIntervalSince1970}
        
        //tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showTaskDetail"{
            println("Segue to showTaskDetail")
            
            //this creates a link to the destination view controller
            let detailVC: TaskDetailedViewController = segue.destinationViewController as TaskDetailedViewController
            
            //this gets the path of the selected row
            let indexPath = self.tableView.indexPathForSelectedRow()
            
            //this gets the value of the selected row
            //let thisTask = baseArray[indexPath!.section][indexPath!.row]
            let thisTask = fetchedResultsController.objectAtIndexPath(indexPath!) as TaskModel
            
            //this pushes the value to the destination VC using the established link
            detailVC.detailTaskModel = thisTask
            
            //detailVC.mainVC = self
            
        }
        else if segue.identifier == "showTaskAdd"{
         
            let addTaskVC: AddTaskViewController = segue.destinationViewController as AddTaskViewController
            
            //addTaskVC.mainVC = self
            
        }
        
    }
    
    
    //UITableViewDataSource ---------------------------------------------------------------------------------------
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        //return baseArray.count
        
        return fetchedResultsController.sections!.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //return baseArray[section].count
        
        return fetchedResultsController.sections![section].numberOfObjects
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        println("SECTION: \(indexPath.section) | ROW \(indexPath.row)")
        
        var cell: TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as TaskCell
        
        //let thisTask = baseArray[indexPath.section][indexPath.row]
        let thisTask = fetchedResultsController.objectAtIndexPath(indexPath) as TaskModel
        
        cell.taskLabel.text = thisTask.task
        cell.descriptionLabel.text = thisTask.subtask
        cell.dateLabel.text = Date.toString(date: thisTask.date)
        
        return cell
    }
    
    //UITableViewDelegate ---------------------------------------------------------------------------------------
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //
        
        println(indexPath.row)
        
        performSegueWithIdentifier("showTaskDetail", sender: self.tableView)
        
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "To-Do"
        }
        else{
            return "Completed"
        }
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        //let thisTask = baseArray[indexPath.section][indexPath.row]
        let thisTask = fetchedResultsController.objectAtIndexPath(indexPath) as TaskModel
        
        if indexPath.section == 0{
            thisTask.completed = true

        }
        else{
            thisTask.completed = false
        }
        
       appDelegate.saveContext()
        
    }
    
    //NSFetchedResultsDelegate ---------------------------------------------------------------------------------------
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView.reloadData()
    }
    
    //HELPERS
    
    func taskFetchRequest() -> NSFetchRequest{
        
        let fetchRequest = NSFetchRequest(entityName: "TaskModel")
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
        let completedDescriptor = NSSortDescriptor(key: "completed", ascending: true)
        fetchRequest.sortDescriptors = [completedDescriptor, sortDescriptor]
        
        return fetchRequest
        
    }
    
    func getFetchedResultsController() -> NSFetchedResultsController{
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: taskFetchRequest(), managedObjectContext: (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext!, sectionNameKeyPath: "completed", cacheName: nil)
        
        return fetchedResultsController
        
    }

}

