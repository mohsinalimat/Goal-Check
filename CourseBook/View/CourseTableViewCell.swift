//
//  CourseTableViewCell.swift
//  CourseBook
//
//  Created by Alex Wong on 8/27/17.
//  Copyright © 2017 Alex Wong. All rights reserved.
//

import UIKit

class CourseTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewCell: UIImageView!
    @IBOutlet weak var courseName: UILabel!
    @IBOutlet weak var courseEmail: UILabel!
    @IBOutlet weak var coursePrice: UILabel!
    

    func fillCellWithData(course: Course){
        
        courseName.text = course.coursename
        courseEmail.text = course.email
        coursePrice.text = "$\(course.price)"
        
        // TODO: Set image later
        
        
    }
    
    
}
