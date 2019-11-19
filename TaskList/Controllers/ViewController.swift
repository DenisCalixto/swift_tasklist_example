//
//  ViewController.swift
//  TaskList
//
//  Created by Colin Masters on 2019-10-21.
//  Copyright © 2019 Langara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var taskManager: TaskManager!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        taskManager = TaskManager()
        
        let addTaskButton = UIBarButtonItem(barButtonSystemItem: .add,
                                            target: self,
                                            action: #selector(addTask))
        
        navigationItem.rightBarButtonItem = addTaskButton
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destNav = segue.destination as? UINavigationController,
            let dest = destNav.topViewController as? CreateViewController {
                dest.taskManager = taskManager
        }
        
        if let dest = segue.destination as? DetailViewController {
            if let taskIndex = sender as? Int {
                dest.taskIndex = taskIndex
                dest.taskManager = taskManager
            }
        }
    }
    
    @objc private func addTask(){
        performSegue(withIdentifier: "CreateTask", sender: self)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskManager.taskCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)
        let task = taskManager.getTask(at: indexPath.row)
        cell.textLabel?.text = task?.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "TaskDetail", sender: indexPath.row)
    }
}

