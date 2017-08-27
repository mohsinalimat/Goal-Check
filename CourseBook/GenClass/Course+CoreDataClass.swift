//
//  Course+CoreDataClass.swift
//  CourseBook
//
//  Created by Alex Wong on 8/27/17.
//  Copyright © 2017 Alex Wong. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Course)
public class Course: NSManagedObject {
    
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        published = NSDate()
    }

}
