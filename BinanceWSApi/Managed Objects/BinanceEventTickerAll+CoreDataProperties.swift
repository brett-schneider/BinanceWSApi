//
//  BinanceEventTickerAll+CoreDataProperties.swift
//  switchbert
//
//  Created by Brett on 14.03.18.
//  Copyright © 2018 Christoph Bretschneider. All rights reserved.
//
//

import Foundation
import CoreData
import DMDataTypes

extension BinanceEventTickerAll {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BinanceEventTickerAll> {
        return NSFetchRequest<BinanceEventTickerAll>(entityName: "BinanceEventTickerAll")
    }

    @NSManaged public var all: NSSet?

}

// MARK: Generated accessors for all
extension BinanceEventTickerAll {

    @objc(addAllObject:)
    @NSManaged public func addToAll(_ value: BinanceEventTicker)

    @objc(removeAllObject:)
    @NSManaged public func removeFromAll(_ value: BinanceEventTicker)

    @objc(addAll:)
    @NSManaged public func addToAll(_ values: NSSet)

    @objc(removeAll:)
    @NSManaged public func removeFromAll(_ values: NSSet)

}
