//
//  FinishGoalVC.swift
//  Goal Check
//
//  Created by Alex Wong on 12/2/17.
//  Copyright © 2017 Alex Wong. All rights reserved.
//

import UIKit

class FinishGoalVC: UIViewController {
    
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
    }

    // MARK: - Actions
    
    func initData(description: String, type: GoalType){
        self.goalDescription = description
        self.goalType = type
    }
    
    @IBAction func createGoal(_ sender: Any) {
    }
}
