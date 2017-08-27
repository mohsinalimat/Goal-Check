//
//  Course+CoreDataProperties.swift
//  CourseBook
//
//  Created by Alex Wong on 8/27/17.
//  Copyright © 2017 Alex Wong. All rights reserved.
//
//

import Foundation
import CoreData


extension Course {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Course> {
        return NSFetchRequest<Course>(entityName: "Course")
    }

    @NSManaged public var email: String?
    @NSManaged public var published: NSDate?
    @NSManaged public var price: Double
    @NSManaged public var coursename: String?
    @NSManaged public var courseToCategory: Category?
    @NSManaged public var courseToImage: Image?

}
