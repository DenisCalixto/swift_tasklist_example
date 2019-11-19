//
//  DetailViewController.swift
//  TaskList
//
//  Created by Colin Masters on 2019-10-21.
//  Copyright © 2019 Langara. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var taskIndex: Int!
    var taskManager: TaskManager?
    
    private var task: Task?
    
    @IBOutlet weak var detailsTextView: UITextView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        task = taskManager?.getTask(at: taskIndex)
        navigationItem.title = task?.title
        detailsTextView.text = task?.detail
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let editButton = UIBarButtonItem(barButtonSystemItem: .edit,
                                         target: self,
                                         action: #selector(editTask))
        
        navigationItem.rightBarButtonItem = editButton
    }
    
    @objc func editTask() {
        performSegue(withIdentifier: "EditTask", sender: self)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destNav = segue.destination as? UINavigationController,
            let dest = destNav.topViewController as? CreateViewController {
                dest.taskIndex = taskIndex
                dest.taskManager = taskManager
        }
    }
}
