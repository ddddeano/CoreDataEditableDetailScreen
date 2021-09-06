//
//  Ingredient+CoreDataProperties.swift
//  SandBox
//
//  Created by Daniel Watson on 06/09/2021.
//
//

import Foundation
import CoreData

@objc(Ingredient)
public class Ingredient: NSManagedObject {

}

extension Ingredient {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Ingredient> {
        return NSFetchRequest<Ingredient>(entityName: "Ingredient")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    
    public var displayName: String {
        name ?? "unknown"
    }

}

extension Ingredient : Identifiable {

}
