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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getTask()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.important {
            cell.textLabel?.text = "😃\(task.name!)"
        } else {
            cell.textLabel?.text = "😞\(task.name!)"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexSelect = indexPath.row
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "tareaSeleccionadaSegue", sender: task)
    }
    
    func getTask() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            tasks = try context.fetch(Task.fetchRequest()) as! [Task]
        } catch {
            print("Error al leer la entidad de CoreData")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "tareaSeleccionadaSegue") {
            let afterVC = segue.destination as! ViewControllerTareaCompletada
            afterVC.task = sender as! Task
            afterVC.previousVC = self
        }
    }

}

