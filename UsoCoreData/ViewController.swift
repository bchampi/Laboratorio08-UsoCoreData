//
//  ViewController.swift
//  UsoCoreData
//
//  Created by Mac 17 on 5/19/21.
//  Copyright © 2021 deah. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tasks: [Task] = []
    
    func createTasks() -> [Task] {
        let task1 = Task()
        task1.name = "Estudiar para el exámen"
        task1.important = false
        
        let task2 = Task()
        task2.name = "Hacer los laboratorios"
        task2.important = true
        
        let task3 = Task()
        task3.name = "Estudiar para subsa"
        task3.important = false
        
        return [task1, task2, task3]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.important {
            cell.textLabel?.text = "😃\(task.name)"
        } else {
            cell.textLabel?.text = "😞\(task.name)"
        }
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        tasks = createTasks()
    }

}

