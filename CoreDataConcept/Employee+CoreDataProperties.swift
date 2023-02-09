//
//  Employee+CoreDataProperties.swift
//  CoreDataConcept
//
//  Created by Rapipay Macintoshn on 08/02/23.
//
//

import Foundation
import CoreData


extension Employee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Employee> {
        return NSFetchRequest<Employee>(entityName: "Employee")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: String?
    @NSManaged public var email: String?
    @NSManaged public var phone: String?
    @NSManaged public var address: String?

}

extension Employee : Identifiable {

}
