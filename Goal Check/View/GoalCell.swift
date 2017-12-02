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
    
    // MARK: - ConfigureCell
    
    func configureCell(description: String, type: String, goalProgressAmount: Int) {
        self.goalDescription.text = description
        self.goalType.text = type
        self.goalProgress.text = String(describing: goalProgressAmount)
    }
}
