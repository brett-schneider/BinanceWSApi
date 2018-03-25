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
extension KeyedDecodingContainer {
    // Binance Timestamp to Date
    func decode(_ type: Date.Type, forKey key: Key) throws -> Date {
        // Swift.print("decoding date... \(key)")
        return Date(timeIntervalSince1970: floor(Double(try self.decode(UInt64.self, forKey: key))/1000.0))
    }
    func decodeIfPresent(_ type: Date.Type, forKey key: Key) throws -> Date {
        // Swift.print("decoding date (if present)... \(key)")
        return Date(timeIntervalSince1970: floor(Double(try self.decode(UInt64.self, forKey: key))/1000.0))
    }
    func decodespecial(_ type: Double.Type, forKey key: Key) throws -> Double {
        // Swift.print("decoding double (if present)... \(key)")
        return Double(try self.decode(String.self, forKey: key))!
    }
    func decodeIfPreset(_ type: BinanceKline.Type, forKey key: Key) throws -> BinanceKline? {
        // Swift.print("decode kline (if present)... \(key)")
        return nil
    }
    //    Leads to ambiguity :-(
//    func decodeIfPresent(_ type: Bool.Type, forKey key: Key) throws -> Bool {
//        Swift.print("decoding bool (if present)... \(key)")
//        return try self.decode(Int.self, forKey: key) == 0 ? false : true
//    }
}
extension Double {
    func trunc(places : Int)-> Double {
            return Double(floor(pow(10.0, Double(places)) * self)/pow(10.0, Double(places)))
        }
}

// https://gist.github.com/sambhav7890/3e8306099c242b31555a8f96e2275549
// pass managed object context to decoder
public extension CodingUserInfoKey {
    public static let context = CodingUserInfoKey(rawValue: "context")!
}

// https://stablekernel.com/understanding-extending-swift-4-codable/

