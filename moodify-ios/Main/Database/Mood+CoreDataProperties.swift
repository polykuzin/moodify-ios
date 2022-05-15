//
//  Mood+CoreDataProperties.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 15.05.2022.
//
//

import Foundation
import CoreData


extension Mood {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Mood> {
        return NSFetchRequest<Mood>(entityName: "Mood")
    }

    @NSManaged public var date: Date?
    @NSManaged public var feelings: [String]?
    @NSManaged public var images: [Data]?
    @NSManaged public var mood: String?

}

extension Mood : Identifiable {

}
