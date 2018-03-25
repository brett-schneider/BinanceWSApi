//
//  BinanceEventTicker+CoreDataProperties.swift
//  switchbert
//
//  Created by Brett on 14.03.18.
//  Copyright © 2018 Christoph Bretschneider. All rights reserved.
//
//

import Foundation
import CoreData


extension BinanceEventTicker {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BinanceEventTicker> {
        return NSFetchRequest<BinanceEventTicker>(entityName: "BinanceEventTicker")
    }

    @NSManaged public var bestAskPrice: Double
    @NSManaged public var bestAskQuantity: Double
    @NSManaged public var bestBidPrice: Double
    @NSManaged public var bestBidQuantity: Double
    @NSManaged public var closeTime: NSDate?
    @NSManaged public var closeTradeQuantity: Double
    @NSManaged public var eventTime: NSDate?
    @NSManaged public var firstTradeID: Int64
    @NSManaged public var high: Double
    @NSManaged public var lastTradeID: Int64
    @NSManaged public var low: Double
    @NSManaged public var open: Double
    @NSManaged public var openTime: NSDate?
    @NSManaged public var prevDayClosePrice: Double
    @NSManaged public var priceChange: Double
    @NSManaged public var priceChangePercent: Double
    @NSManaged public var symbol: String?
    @NSManaged public var thisDayClosePrice: Double
    @NSManaged public var tradeCount: Int64
    @NSManaged public var tradedBaseVolume: Double
    @NSManaged public var tradedQuoteVolume: Double
    @NSManaged public var weightedAveragePrice: Double
    @NSManaged public var blip: BinanceEventTickerAll?

}
