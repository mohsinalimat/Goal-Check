//
//  ViewController.swift
//  CourseBook
//
//  Created by Alex Wong on 8/26/17.
//  Copyright © 2017 Alex Wong. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, NSFetchedResultsControllerDelegate {

    var controller: NSFetchedResultsController<Course>!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //testData()
        getFromCoreData()
    }

    // Configure controller
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .delete:
            if let indexPath = indexPath{
                
                tableView.deleteRows(at: [indexPath], with: .fade)
                
            }
        case .insert:
            if let indexPath = newIndexPath{
                
                tableView.insertRows(at: [indexPath], with: .fade)
            }
        case .move:
            if let indexPath = indexPath{
                
                tableView.deleteRows(at: [indexPath], with: .fade)
                
                
            }
            if let indexPath = newIndexPath{
                
                tableView.insertRows(at: [indexPath], with: .fade)
                
            }
        case .update:
            if let indexPath = indexPath{
                
                //TODO: Do something here
                
                let cell = tableView.cellForRow(at: indexPath) as! CourseTableViewCell
                updateCellInfo(cell: cell, indexPath: indexPath as NSIndexPath)
                
            }
        }
    }
    
    // Update for table view
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    // To update cell info
    
    func updateCellInfo(cell: CourseTableViewCell, indexPath: NSIndexPath){
        
        let course = controller.object(at: indexPath as IndexPath)
        cell.fillCellWithData(course: course)
        
    }
    
    // Fetch the database here
    
    func getFromCoreData(){
        
        let fetchRequest: NSFetchRequest<Course> = Course.fetchRequest()
        
        let moneySort = NSSortDescriptor(key: "price", ascending: true)
        
        fetchRequest.sortDescriptors = [moneySort]
        
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        controller.delegate = self
        
        self.controller = controller
        
        do {
            try controller.performFetch()
        } catch {
            let error = error as NSError
            print(error)
        }
        
    }
    
    // create some test data DELETE AFTER DONE
    
    func testData(){
        
        let course = Course(context: context)
        course.coursename = "swift 4"
        course.email = "test@example.com"
        course.price = 30
        
        let course2 = Course(context: context)
        course2.coursename = "swift 4"
        course2.email = "test@example.com"
        course2.price = 30
        
        let course3 = Course(context: context)
        course3.coursename = "swift 4"
        course3.email = "test@example.com"
        course3.price = 30
        
        let course4 = Course(context: context)
        course4.coursename = "swift 4"
        course4.email = "test@example.com"
        course4.price = 30
        
        appDelegate.saveContext()
        
    }
    

}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        if let sections = controller.sections{
            
            return sections.count
            
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let sections = controller.sections{
            
            let sectionItem = sections[section]
            return sectionItem.numberOfObjects
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellOne", for: indexPath) as! CourseTableViewCell
        
        updateCellInfo(cell: cell, indexPath: indexPath as NSIndexPath)
        
        return cell
    }
    
    //using custom view cells so need height
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let passedInfo = controller.fetchedObjects, passedInfo.count > 0 {
            
            let course = passedInfo[indexPath.row]
            
            performSegue(withIdentifier: "editSegue", sender: course)
            
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editSegue"{
            if let guest = segue.destination as? AddCourseViewController{
                
                if let course = sender as? Course{
                    
                    guest.existingCourse = course
                    
                    
                }
                
                
            }
            
            
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}

