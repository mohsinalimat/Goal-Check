//
//  GoalCell.swift
//  Goal Check
//
//  Created by Alex Wong on 11/30/17.
//  Copyright © 2017 Alex Wong. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {
    
    // MARK: - Outlets

    @IBOutlet weak var goalDescription: UILabel!
    @IBOutlet weak var goalType: UILabel!
    @IBOutlet weak var goalProgress: UILabel!
    
    @IBOutlet weak var completionView: UIView!
    // MARK: - ConfigureCell
    
    func configureCell(goal: Goal) {
        self.goalDescription.text = goal.goalDescription
        self.goalType.text = goal.goalType
        self.goalProgress.text = String(describing: goal.goalProgress)
        
        if goal.goalProgress == goal.goalCompletionValue{
            self.completionView.isHidden = false
        } else {
            self.completionView.isHidden = true
        }
    }
}
