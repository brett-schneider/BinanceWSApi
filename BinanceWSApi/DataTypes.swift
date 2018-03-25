//
//  DataTypes.swift
//  BinanceWSApi
//
//  Created by Brett on 14.03.18.
//  Copyright © 2018 Christoph Bretschneider. All rights reserved.
//

import Foundation

// Gerenrics
// eventually went for managed objects, but they can't be generic because objective c
/*
 public enum BinanceEvent<T: Decodable>: Decodable {
    case result(T)
    public init(from decoder: Decoder) throws {
    }
 }

 */
// Events

// for decoding the response without creating a managed object
struct BinanceRepsonse: Codable {
    let event: BinanceEventType?
    let lastUpdateId: Int64?
    
    enum CodingKeys: String, CodingKey {
        case event = "e"
        case lastUpdateId
    }
}

struct DepthUpdate: Codable {
    let price: Double
    let quantity: Double
}
// typealias BinanceEventTickerAll = [BinanceEventTicker]

// Binance enums
public enum BinanceCandlesticksInterval: String, Codable {
    case min1 = "1m"
    case min3 = "3m"
    case min5 = "5m"
    case min15 = "15m"
    case min30 = "30m"
    case hour1 = "1h"
    case hour2 = "2h"
    case hour4 = "4h"
    case hour6 = "6h"
    case hour8 = "8h"
    case hour12 = "12h"
    case day1 = "1d"
    case day3 = "3d"
    case week1 = "1w"
    case month1 = "1M"
}
public enum BinanceEventType: String, Codable {
    case aggTrade = "aggTrade" // stream name <symbol>@aggTrade
    case trade = "trade"  // stream name <symbol>@trade
    case kline = "kline" // stream name <symbol>@kline_<interval>
    case ticker = "24hrTicker"  // stream name <symbol>@ticker
    // case allTicker = "allTicker" // stream name !ticker@arr
                                    // ∀ symbols, actually same payload as 24hrTicker,
                                    // however, thewy're all in an anoymous root array. ugh.
    case depthUpdate = "depthUpdate" // stream name <symbol>@depth
    case empty = ""
}
public enum BinanceDepthLevels: String, Codable {
    case d5 = "5"
    case d10 = "10"
    case d20 = "20"
}
