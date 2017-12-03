//
//  FinishGoalVC.swift
//  Goal Check
//
//  Created by Alex Wong on 12/2/17.
//  Copyright © 2017 Alex Wong. All rights reserved.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate

class FinishGoalVC: UIViewController, UITextFieldDelegate {
    
    // MARK: - Outlets

    @IBOutlet weak var createGoalButton: UIButton!
    @IBOutlet weak var pointsTextField: UITextField!
    
    // MARK: - Properties
    
    var goalDescription : String!
    var goalType: GoalType!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createGoalButton.bindToKeyboard()
        pointsTextField.delegate = self
    }

    // MARK: - Actions
    
    func initData(description: String, type: GoalType){
        self.goalDescription = description
        self.goalType = type
    }
    
    @IBAction func goBackVC(_ sender: Any) {
        dismissDetail()
    }
    
    @IBAction func createGoal(_ sender: Any) {
        // save data into core data goal model
        
        if pointsTextField.text != ""{
            
            self.save { (complete) in
                if complete {
                    dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    // Save to Core Data
    func save(completion: (_ finished: Bool) -> ()){
        
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        let goal = Goal(context: managedContext)
        
        goal.goalDescription = goalDescription
        goal.goalType = goalType.rawValue
        goal.goalCompletionValue = Int32(pointsTextField.text!)!
        goal.goalProgress = Int32(0)
        
        do {
            try managedContext.save()
            print("Successfully saved data.")
            completion(true)
        } catch {
            debugPrint("Could not save: \(error.localizedDescription)")
            completion(false)
        }
        
    }
}




























