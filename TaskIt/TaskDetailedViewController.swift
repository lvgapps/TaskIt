//
//  TaskDetailedViewController.swift
//  TaskIt
//
//  Created by Wale Anif on 11/14/14.
//  Copyright (c) 2014 Lavvo Group. All rights reserved.
//

import UIKit

class TaskDetailedViewController: UIViewController {
    
    var detailTaskModel: TaskModel!
    
    //var mainVC: ViewController!

    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var subtaskTextField: UITextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        println(detailTaskModel.task)

        // Do any additional setup after loading the view.
        
        taskTextField.text = detailTaskModel.task
        subtaskTextField.text = detailTaskModel.subtask
        dueDatePicker.date = detailTaskModel.date
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonPressed(sender: UIBarButtonItem) {
        
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    @IBAction func doneBarButtonItemPressed(sender: AnyObject) {
        
        let appDelegate = (UIApplication.sharedApplication().delegate as  AppDelegate)
        
        detailTaskModel.task = taskTextField.text
        detailTaskModel.subtask = subtaskTextField.text
        detailTaskModel.date = dueDatePicker.date
        detailTaskModel.completed = detailTaskModel.completed
        
        appDelegate.saveContext()
        
        self.navigationController?.popViewControllerAnimated(true )
    }
}
