//
//  CreateViewController.swift
//  TaskList
//
//  Created by Colin Masters on 2019-10-28.
//  Copyright © 2019 Langara. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var detailsTextView: UITextView!
    
    var taskIndex: Int?
    var taskManager: TaskManager?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = taskIndex != nil ?  "Edit Task" : "Create Task"
        if let taskIndex = taskIndex {
            let task = taskManager?.getTask(at: taskIndex)
            titleTextField.text = task?.title
            detailsTextView.text = task?.detail
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let saveButton = UIBarButtonItem(barButtonSystemItem: .save,
                                         target: self,
                                         action: #selector(saveTask))
        
        navigationItem.rightBarButtonItem = saveButton
    }
    
    override func viewDidLayoutSubviews() {
        detailsTextView.layer.borderColor = UIColor.black.cgColor
        detailsTextView.layer.borderWidth = 1.0
    }
    
    @objc func saveTask() {
        if let title = titleTextField.text, !title.isEmpty {
            let details = detailsTextView.text
            let task = Task(title: title, detail: details ?? "")
            
            if let taskManager = taskManager {
            
                if let taskIndex = taskIndex {
                    taskManager.editTask(at: taskIndex, with: task)
                } else {
                    taskManager.add(task: task)
                }
                
                dismiss(animated: true, completion: nil)
            }
        }
    }
}
