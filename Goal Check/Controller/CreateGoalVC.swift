//
//  CreateGoalVC.swift
//  Goal Check
//
//  Created by Alex Wong on 12/1/17.
//  Copyright © 2017 Alex Wong. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController {
    
    // MARK: - Outlets

    @IBOutlet weak var goalTextView: UITextView!
    @IBOutlet weak var shortTermButton: UIButton!
    @IBOutlet weak var longTermButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    // MARK: - Actions
    
    @IBAction func closeVC(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextPressed(_ sender: Any) {
    }
    
    @IBAction func shortTermPressed(_ sender: Any) {
    }
    
    @IBAction func longTermPressed(_ sender: Any) {
    }
    
}
