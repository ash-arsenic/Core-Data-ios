//
//  CoreDataHelper.swift
//  CoreDataConcept
//
//  Created by Rapipay Macintoshn on 08/02/23.
//

import Foundation
import UIKit
import CoreData

class CoreDataHelper {
    static let shared = CoreDataHelper()
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func save(data: [String: String]) {
        let emp = NSEntityDescription.insertNewObject(forEntityName: "Employee", into: context!) as? Employee
        
        emp?.name = data["name"]
        emp?.id = data["id"]
        emp?.email = data["email"]
        emp?.phone = data["phone"]
        emp?.address = data["address"]
        
        do {
            try context?.save()
        } catch {
            print("Err: Data not Saved")
        }
    }
    
    func load() -> [Employee] {
        do {
            return (try context?.fetch(NSFetchRequest(entityName: "Employee")) as [Employee])
        } catch {
            print("Err: Cant fetch the data")
        }
        return [Employee]()
    }
    
    func delete(index: Int) -> Bool {
        var emp: [Employee] = [Employee]()
        emp = load()
        print(emp)
        do {
            try context?.delete(emp[index])
            return true
        } catch {
            print("Err: Cant delete shit")
        }
        return false
    }
    
    func update(index: Int) -> [Employee] {
        let emp = load()
        emp[index].name = "Siuuuuuuuu"
        do {
            try context?.save()
            return load()
        } catch {
            print("Err: Cant update shit")
        }
        return emp
    }
}
