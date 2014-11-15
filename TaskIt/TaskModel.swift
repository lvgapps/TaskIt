//
//  TaskModel.swift
//  TaskIt
//
//  Created by Wale Anif on 11/14/14.
//  Copyright (c) 2014 Lavvo Group. All rights reserved.
//

import Foundation

struct TaskModel {
    
    var task: String
    var subtask: String
    var date: String
    
    init (task: String, subtask: String, date: String){
        self.task = task
        self.subtask = subtask
        self.date = date
    }
}