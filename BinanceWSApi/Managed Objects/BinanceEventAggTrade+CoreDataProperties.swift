//
//  BinanceEventAggTrade+CoreDataProperties.swift
//  switchbert
//
//  Created by Brett on 14.03.18.
//  Copyright © 2018 Christoph Bretschneider. All rights reserved.
//
//

import Foundation
import CoreData


extension BinanceEventAggTrade {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BinanceEventAggTrade> {
        return NSFetchRequest<BinanceEventAggTrade>(entityName: "BinanceEventTrade")
    }

    @NSManaged public var buyerIsMaker: Bool
    @NSManaged public var buyerOrderID: Int64
    @NSManaged public var price: Double
    @NSManaged public var quantity: Double
    @NSManaged public var sellerOrderID: Int64
    @NSManaged public var symbol: String?
    @NSManaged public var tradeID: Int64
    @NSManaged public var tradeTime: NSDate?

}
