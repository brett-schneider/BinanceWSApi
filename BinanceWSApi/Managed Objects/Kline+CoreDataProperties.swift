//
//  Kline+CoreDataProperties.swift
//  switchbert
//
//  Created by Brett on 14.03.18.
//  Copyright © 2018 Christoph Bretschneider. All rights reserved.
//
//

import Foundation
import CoreData


extension Kline {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Kline> {
        return NSFetchRequest<Kline>(entityName: "Kline")
    }

    @NSManaged public var startTime: NSDate?
    @NSManaged public var closeTime: NSDate?
    @NSManaged public var symbol: String?
    @NSManaged public var interval: String?
    @NSManaged public var firstTradeID: Int64
    @NSManaged public var lastTradeID: Int64
    @NSManaged public var open: Double
    @NSManaged public var close: Double
    @NSManaged public var high: Double
    @NSManaged public var low: Double
    @NSManaged public var baseVolume: Double
    @NSManaged public var tradeCount: Int64
    @NSManaged public var klineIsClosed: Bool
    @NSManaged public var quoteVolume: Double
    @NSManaged public var takerBuyBaseVolume: Double
    @NSManaged public var takerBuyQuoteVolume: Double

}
