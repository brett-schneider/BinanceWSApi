//
//  BinanceEventKLine+CoreDataProperties.swift
//  switchbert
//
//  Created by Brett on 14.03.18.
//  Copyright © 2018 Christoph Bretschneider. All rights reserved.
//
//

import Foundation
import CoreData


extension BinanceEventKLine {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BinanceEventKLine> {
        return NSFetchRequest<BinanceEventKLine>(entityName: "BinanceEventKLine")
    }

    @NSManaged public var eventTime: NSDate?
    @NSManaged public var symbol: String?
    @NSManaged public var k: Kline?

}
