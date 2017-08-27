//
//  Image+CoreDataProperties.swift
//  CourseBook
//
//  Created by Alex Wong on 8/27/17.
//  Copyright © 2017 Alex Wong. All rights reserved.
//
//

import Foundation
import CoreData


extension Image {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Image> {
        return NSFetchRequest<Image>(entityName: "Image")
    }

    @NSManaged public var image: NSObject?
    @NSManaged public var imageToCourse: Course?
    @NSManaged public var imageToCategory: Category?

}
