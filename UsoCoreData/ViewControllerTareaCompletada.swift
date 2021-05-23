//
//  ViewControllerTareaCompletada.swift
//  UsoCoreData
//
//  Created by Mac 17 on 5/22/21.
//  Copyright © 2021 deah. All rights reserved.
//

import UIKit

class ViewControllerTareaCompletada: UIViewController {
    
    var previousVC = ViewController()
    
    @IBOutlet weak var lblTask: UILabel!
    
    @IBAction func completeTask(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(task)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController?.popViewController(animated: true)
        
    }
    
    var task = Task()

    override func viewDidLoad() {
        super.viewDidLoad()
        let index: String = String(previousVC.indexSelect + 1)
        if task.important {
            title = "Tarea \(index)"
            lblTask.text = "😇\(task.name!)"
        }
        else {
            title = "Tarea \(index)"
            lblTask.text = task.name!
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
