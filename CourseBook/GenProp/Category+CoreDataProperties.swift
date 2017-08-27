//
//  Category+CoreDataProperties.swift
//  CourseBook
//
//  Created by Alex Wong on 8/27/17.
//  Copyright © 2017 Alex Wong. All rights reserved.
//
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var name: String?
    @NSManaged public var categoryToCourse: Course?
    @NSManaged public var categoryToImage: Image?

}
