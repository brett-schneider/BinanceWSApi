//
//  Extensions.swift
//  BinanceWSApi
//
//  Created by Brett on 14.03.18.
//  Copyright © 2018 Christoph Bretschneider. All rights reserved.
//

extension TimeInterval {
    var asMilliseconds: UInt64 {
        return UInt64(self * 1000)
    }
}
extension KeyedEncodingContainer {
    // Date to Binance Timestamp
    mutating func encode(_ value: Date, forKey key: Key) throws {
        let result = value.timeIntervalSince1970
        try self.encode(result.asMilliseconds, forKey: key)
    }
    
    // TimeInterval to Binance Timestamp
    mutating func encode(_ value: TimeInterval, forKey key: Key) throws {
        try self.encode(value.asMilliseconds, forKey: key)
    }
}
extension Double {
    func trunc(places : Int)-> Double {
            return Double(floor(pow(10.0, Double(places)) * self)/pow(10.0, Double(places)))
        }
}
extension KeyedDecodingContainer {
    // Binance Timestamp to Date
    func decode(_ type: Date.Type, forKey key: Key) throws -> Date {
        return Date(timeIntervalSince1970: floor(Double(try self.decode(UInt64.self, forKey: key))/1000.0))
    }
}

