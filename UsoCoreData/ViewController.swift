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
    
    @IBAction func addTask(_ sender: Any) {
        performSegue(withIdentifier: "agregarSegue", sender: nil)
    }
    
    var tasks: [Task] = []
    var indexSelect: Int = 0
    
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexSelect = indexPath.row
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "tareaSeleccionadaSegue", sender: task)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        tasks = createTasks()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "agregarSegue" {
            let afterVC = segue.destination as! ViewControllerCrearTarea
            afterVC.previousVC = self
        } else if (segue.identifier == "tareaSeleccionadaSegue") {
            let afterVC = segue.destination as! ViewControllerTareaCompletada
            afterVC.task = sender as! Task
            afterVC.previousVC = self
        }
    }

}

