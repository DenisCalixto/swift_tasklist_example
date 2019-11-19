//
//  TaskManager.swift
//  TaskList
//
//  Created by Colin Masters on 2019-10-21.
//  Copyright © 2019 Langara. All rights reserved.
//

import Foundation

final class TaskManager: NSObject {
    
    var taskCount: Int {
        get {
            return tasks.count
        }
    }
    
    private var tasks: [Task] = []
    
    //private var defaults = UserDefaults.standard
    
    //let defaultsKey: String = "tasks"
    
    //override init() {
    //    if let tasks = defaults.array(forKey: defaultsKey) as? [Task] {
    //        self.tasks = tasks
    //    }
    //}
    
    func add(task: Task) {
        tasks.append(task)
        //saveTasks()
    }
    
    func getTask(at index: Int) -> Task? {
        if taskExists(at: index) {
            return tasks[index]
        }
        return nil
    }
    
    func editTask(at index: Int, with task: Task) {
        if taskExists(at: index) {
            tasks.remove(at: index)
            tasks.insert(task, at: index)
            //saveTasks()
        }
    }
    
    func deleteTask(at index: Int) {
        if taskExists(at: index) {
            tasks.remove(at: index)
            //saveTasks()
        }
    }
    
    private func taskExists(at index: Int) -> Bool {
        if index >= 0 && index < tasks.count {
            return true
        }
        return false
    }
    
    //private func saveTasks() {
    //    defaults.set(tasks, forKey: defaultsKey)
    //    defaults.synchronize()
    //}
}
