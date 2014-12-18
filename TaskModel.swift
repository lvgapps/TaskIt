//
//  TaskModel.swift
//  TaskIt
//
//  Created by Wale Anif on 12/16/14.
//  Copyright (c) 2014 Lavvo Group. All rights reserved.
//

import Foundation
import CoreData

class TaskModel: NSManagedObject {

    @NSManaged var completed: NSNumber
    @NSManaged var date: NSDate
    @NSManaged var subtask: String
    @NSManaged var task: String

}
