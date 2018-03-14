//
//  DataTypes.swift
//  BinanceWSApi
//
//  Created by Brett on 14.03.18.
//  Copyright © 2018 Christoph Bretschneider. All rights reserved.
//

import Foundation

// Gerenrics
/*
 public enum BinanceEvent<T: Decodable>: Decodable {
    case result(T)
    public init(from decoder: Decoder) throws {
    }
 }

 */
// Events
protocol BinanceEvent: Codable {
    var e: BinanceEventType { get }
}

public struct BinanceEventAggTrade: BinanceEvent {
/*
    let e: BinanceEventType
    let E: Date       // Event time
    let s: String     // Symbol
    let a: UInt64     // Aggregate trade ID
    let p: Double     // Price
    let q: Double     // Quantity
    let f: UInt64     // First trade ID
    let l: UInt64     // Last trade ID
    let T: Date       // Trade time
    let m: Bool       // Is the buyer the market maker?
    let M: Bool       // Ignore.
*/
    let e: BinanceEventType
    let eventTime: Date
    let symbol: String
    let aggTradeID: UInt64
    let price: Double
    let quantity: Double
    let firstTradeID: UInt64
    let lastTradeID: UInt64
    let tradeTime: Date
    let buyerIsMaker: Bool

    enum clear: String, CodingKey {
        case e
        case E = "eventTime"
        case s = "symbol"
        case a = "aggTradeID"
        case p = "price"
        case q = "quantity"
        case f = "firstTradeID"
        case l = "lastTradeID"
        case T = "tradeTime"
        case m = "buyerIsMaker"
    }
}

public struct BinanceEventTrade: BinanceEvent {
/*
    let e: BinanceEventType
    let E: Date       // Event time
    let s: String     // Symbol
    let t: UInt64     // Trade ID
    let p: Double     // Price
    let q: Double     // Quantity
    let b: UInt64     // Buyer order Id
    let a: UInt64     // Seller order Id
    let T: Date       // Trade time
    let m: Bool       // Is the buyer the market maker?
    let M: Bool       // Ignore.
*/
    let e: BinanceEventType
    let eventTime: Date
    let symbol: String
    let tradeID: UInt64
    let price: Double
    let quantity: Double
    let buyerOrderID: UInt64
    let sellerOrderID: UInt64
    let tradeTime: Date
    let buyerIsMaker: Bool
    enum clear: String, CodingKey {
        case e
        case E = "eventTime"
        case s = "symbol"
        case t = "tradeID"
        case p = "price"
        case q = "quantity"
        case b = "buyerOrderID"
        case a = "sellerOrderID"
        case T = "tradeTime"
        case m = "buyerIsMaker"
    }
}

public struct BinanceEventKLine: BinanceEvent {
    let e: BinanceEventType
    let eventTime: Date
    let symbol: String
    let k: Kline
    enum clear: String, CodingKey {
        case e
        case E = "eventTime"
        case s = "symbol"
        case k
    }

    public struct Kline: Codable {
        let startTime: Date         // Kline start time
        let closeTime: Date         // Kline close time
        let symbol: String       // Symbol
        let interval: BinanceCandlesticksInterval // Interval
        let firstTradeID: UInt64       // First trade ID
        let lastTradeID: UInt64       // Last trade ID
        let open: Double       // Open price
        let close: Double       // Close price
        let high: Double       // High price
        let low: Double       // Low price
        let baseVolume: Double       // Base asset volume
        let tradeCount: UInt64       // Number of trades
        let klineIsClosed: Bool         // Is this kline closed?
        let quoteVolume: Double       // Quote asset volume
        let takerBuyBaseVolume: Double       // Taker buy base asset volume
        let takerBuyQuoteVolume: Double       // Taker buy quote asset volume
//        let B: Int64        // Ignore
        enum clear: String, CodingKey {
            case t = "startTime"
            case T = "closeTime"
            case s = "symbol"
            case i = "interval"
            case f = "firstTradeID"
            case L = "lastTradeID"
            case o = "open"
            case c = "close"
            case h = "high"
            case l = "low"
            case v = "baseVolume"
            case n = "tradeCount"
            case x = "klineIsClosed"
            case q = "quoteVolume"
            case V = "takerBuyBaseVolume"
            case Q = "takerBuyQuoteVolume"
        }
    }
}
public struct BinanceEventTicker: BinanceEvent {
    let e: BinanceEventType
    let eventTime: Date         // Event time
    let symbol: String       // Symbol
    let priceChange: Double       // Price change
    let priceChangePercent: Double       // Price change percent
    let weightedAveragePrice: Double       // Weighted average price
    let prevDayClosePrice: Double       // Previous day's close price
    let thisDayClosePrice: Double       // Current day's close price
    let closeTradeQuantity: Double       // Close trade's quantity
    let bestBidPrice: Double       // Best bid price
    let bestBidQuantity: Double       // Bid bid quantity
    let bestAskPrice: Double       // Best ask price
    let bestAskQuantity: Double       // Best ask quantity
    let open: Double       // Open price
    let high: Double       // High price
    let low: Double       // Low price
    let tradedBaseVolume: Double       // Total traded base asset volume
    let tradedQuoteVolume: Double       // Total traded quote asset volume
    let openTime: Date         // Statistics open time
    let closeTime: Date         // Statistics close time
    let firstTradeID: UInt64       // First trade ID
    let lastTradeID: UInt64       // Last trade Id
    let tradeCount: UInt64       // Total number of trades
    enum clear: String, CodingKey {
        case e
        case E = "eventTime"
        case s = "symbol"
        case p = "priceChange"
        case P = "priceChangePercent"
        case w = "weightedAveragePrice"
        case x = "prevDayClosePrice"
        case c = "thisDayClosePrice"
        case Q = "closeTradeQuantity"
        case b = "bestBidPrice"
        case B = "bestBidQuantity"
        case a = "bestAskPrice"
        case A = "bestAskQuantity"
        case o = "open"
        case h = "high"
        case l = "low"
        case v = "tradedBaseVolume"
        case q = "tradedQuoteVolume"
        case O = "openTime"
        case C = "closeTime"
        case F = "firstTradeID"
        case L = "lastTradeID"
        case n = "tradeCount"
    }

}
typealias BinanceEventTickerAll = [BinanceEventTicker]

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
    // case allTicker = "allTicker" // stream name !ticker@arr ∀ symbols, actually same payload as 24hrTicker
    case depthUpdate = "depthUpdate" // stream name <symbol>@depth
}
public enum BinanceDepthLevels: String, Codable {
    case d5 = "5"
    case d10 = "10"
    case d20 = "20"
}
