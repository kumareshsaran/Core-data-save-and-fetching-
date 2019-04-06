//
//  ViewController.swift
//  CoreDataExample
//
//  Created by CSS on 25/02/19.
//  Copyright © 2019 css. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
 
    
    let appdelegate = UIApplication.shared.delegate as? AppDelegate
    
    var context = NSManagedObjectContext()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createData()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

extension ViewController {
    private func createData(){
        
        guard let appdelegate = UIApplication.shared.delegate as? AppDelegate else {
            
            return
        }
        
        self.context = appdelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "User", in: context)
        
        let attriputes = NSManagedObject(entity: entity!, insertInto: context)
        
        attriputes.setValue("Kumaresan", forKey: "name")
        
        appdelegate.saveContext()
        
        fetchData()
    }
    
    private func fetchData(){
         let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
            do {
                let result = try context.fetch(request)
    
               
                for data in result as! [NSManagedObject]{
                    
                    print(data.value(forKey: "name"))
                }
            }catch {
                
            }
        }

}


