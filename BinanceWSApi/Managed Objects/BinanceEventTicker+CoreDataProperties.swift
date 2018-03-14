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


}
