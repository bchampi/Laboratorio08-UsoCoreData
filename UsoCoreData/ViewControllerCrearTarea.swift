//
//  ViewControllerCrearTarea.swift
//  UsoCoreData
//
//  Created by Mac 17 on 5/19/21.
//  Copyright © 2021 deah. All rights reserved.
//

import UIKit

class ViewControllerCrearTarea: UIViewController {
    @IBOutlet weak var txtNameTask: UITextField!
    @IBOutlet weak var swImportant: UISwitch!
    
    var previousVC = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnAddTask(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let task = Task(context: context)
        task.name = txtNameTask.text!
        task.important = swImportant.isOn
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController?.popViewController(animated: true)
    }
    
}
