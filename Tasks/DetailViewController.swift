//
//  DetailViewController.swift
//  Tasks
//
//  Created by Rodriguez Isaac on 1/26/19.
//

import UIKit
import CoreData

class DetailViewController: UIViewController {
    @IBOutlet weak var textViewDescription: UITextView!
    var task: NSManagedObject?

    override func viewDidLoad() {
        super.viewDidLoad()
        getDetail()
        // Do any additional setup after loading the view.
    }
    
    func getDetail() {
    textViewDescription.text = task?.value(forKeyPath: "taskDescription") as? String
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func saveAction(_ sender: UIBarButtonItem) {
        save(description: textViewDescription.text!)
    }
    
    
    
    func save(description: String) {
        task!.setValue(description, forKey: "taskDescription")
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
}
