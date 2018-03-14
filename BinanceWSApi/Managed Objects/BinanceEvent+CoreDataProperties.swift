//
//  BinanceEvent+CoreDataProperties.swift
//  switchbert
//
//  Created by Brett on 14.03.18.
//  Copyright © 2018 Christoph Bretschneider. All rights reserved.
//
//

import Foundation
import CoreData


extension BinanceEvent {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BinanceEvent> {
        return NSFetchRequest<BinanceEvent>(entityName: "BinanceEvent")
    }

    @NSManaged public var e: String?

}
