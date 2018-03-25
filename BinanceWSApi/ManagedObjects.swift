import Foundation
import CoreData

@objc(BinanceEvent)
open class BinanceEvent: NSManagedObject, ManagedCodableProtocol {
//    enum clear: String, CodingKey {
//        case e
//    }
    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }
    public required convenience init(from decoder: Decoder) throws {
        // Create NSEntityDescription with NSManagedObjectContext
        let whoami = String(describing: type(of: self))
        // Swift.print("creating nsmanagedobject \(whoami)")
        guard let managedObjectContext = decoder.userInfo[.context] as? NSManagedObjectContext,
            let entity = NSEntityDescription.entity(forEntityName: whoami, in: managedObjectContext) else {
                fatalError("Failed to decode BinanceEvent \(whoami)!")
        }
        self.init(entity: entity, insertInto: managedObjectContext)
        // cannot override CodingKeys enum, hence unable to make this generic,
        // this whole class is moot, but i'm leaving it here in case i find a way
//        try self.loadData(from: decoder, keyType: clear.self)
//        do {
//            try managedObjectContext.save()
//        } catch {
//            Swift.print("unable to save object")
//        }
//        Swift.print("i m a \(String(describing: self))")
        // Decode
    }
}

public extension BinanceEvent {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<BinanceEvent> {
        return NSFetchRequest<BinanceEvent>(entityName: "BinanceEvent")
    }
    // unable to use BinanceEventType because NSManaged 
//    @NSManaged public var e: String?
}

@objc(BinanceEventAggTrade)
open class BinanceEventAggTrade: BinanceEvent {
//open class BinanceEventAggTrade: NSManagedObject, ManagedCodableProtocol {
    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }
    public required convenience init(from decoder: Decoder) throws {
        Swift.print("init BinanceEventAggTrade")
        // Create NSEntityDescription with NSManagedObjectContext
        let whoami = String(describing: type(of: self))
        // Swift.print("creating nsmanagedobject \(whoami)")
        guard let managedObjectContext = decoder.userInfo[.context] as? NSManagedObjectContext,
            let entity = NSEntityDescription.entity(forEntityName: whoami, in: managedObjectContext) else {
                fatalError("Failed to decode BinanceEvent \(whoami)!")
        }
        self.init(entity: entity, insertInto: managedObjectContext)
        try self.loadData(from: decoder, keyType: CodingKeys.self)
    }
}

public extension BinanceEventAggTrade {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<BinanceEventAggTrade> {
        return NSFetchRequest<BinanceEventAggTrade>(entityName: "BinanceEventAggTrade")
    }
    @NSManaged public var e: String
    @NSManaged public var aggTradeID: Int64
    @NSManaged public var buyerIsMaker: Bool
    @NSManaged public var firstTradeID: Int64
    @NSManaged public var lastTradeID: Int64
    @NSManaged public var price: Double
    @NSManaged public var quantity: Double
    @NSManaged public var symbol: String
    @NSManaged public var tradeTime: NSDate?
    @NSManaged public var eventTime: NSDate?
    public enum CodingKeys: String, CodingKey {
        case e
        case eventTime = "E"
        case symbol = "s"
        case aggTradeID = "a"
        case price = "p"
        case quantity = "q"
        case firstTradeID = "f"
        case lastTradeID = "l"
        case tradeTime = "T"
        case buyerIsMaker = "m"
    }
}

@objc(BinanceEventKLine)
open class BinanceEventKLine: BinanceEvent {
    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }
    public required convenience init(from decoder: Decoder) throws {
         // Create NSEntityDescription with NSManagedObjectContext
        let whoami = String(describing: type(of: self))
        // Swift.print("creating nsmanagedobject \(whoami)")
        guard let managedObjectContext = decoder.userInfo[.context] as? NSManagedObjectContext,
            let entity = NSEntityDescription.entity(forEntityName: whoami, in: managedObjectContext) else {
                fatalError("Failed to decode BinanceEvent \(whoami)!")
        }
        self.init(entity: entity, insertInto: managedObjectContext)
        try self.loadData(from: decoder, keyType: CodingKeys.self)
    }

}

public extension BinanceEventKLine {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<BinanceEventKLine> {
        return NSFetchRequest<BinanceEventKLine>(entityName: "BinanceEventKLine")
    }
    @NSManaged public var e: String
    @NSManaged public var eventTime: NSDate?
    @NSManaged public var symbol: String?
    @NSManaged public var k: BinanceKline
    public enum CodingKeys: String, CodingKey {
        case e
        case eventTime = "E"
        case symbol = "s"
        case k
    }
}

@objc(BinanceEventTicker)
open class BinanceEventTicker: BinanceEvent {
    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }
    public required convenience init(from decoder: Decoder) throws {
        // Create NSEntityDescription with NSManagedObjectContext
        let whoami = String(describing: type(of: self))
        // Swift.print("creating nsmanagedobject \(whoami)")
        guard let managedObjectContext = decoder.userInfo[.context] as? NSManagedObjectContext,
            let entity = NSEntityDescription.entity(forEntityName: whoami, in: managedObjectContext) else {
                fatalError("Failed to decode BinanceEvent \(whoami)!")
        }
        self.init(entity: entity, insertInto: managedObjectContext)
        try self.loadData(from: decoder, keyType: CodingKeys.self)
    }
}

public extension BinanceEventTicker {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BinanceEventTicker> {
        return NSFetchRequest<BinanceEventTicker>(entityName: "BinanceEventTicker")
    }

    @NSManaged public var e: String
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
    public enum CodingKeys: String, CodingKey {
        case e
        case eventTime = "E"
        case symbol = "s"
        case priceChange = "p"
        case priceChangePercent = "P"
        case weightedAveragePrice = "w"
        case prevDayClosePrice = "x"
        case thisDayClosePrice = "c"
        case closeTradeQuantity = "Q"
        case bestBidPrice = "b"
        case bestBidQuantity = "B"
        case bestAskPrice = "a"
        case bestAskQuantity = "A"
        case open = "o"
        case high = "h"
        case low = "l"
        case tradedBaseVolume = "v"
        case tradedQuoteVolume = "q"
        case openTime = "O"
        case closeTime = "C"
        case firstTradeID = "F"
        case lastTradeID = "L"
        case tradeCount = "n"
    }
}

typealias BinanceEventTickerAll = [BinanceEventTicker]

//@objc(BinanceEventTickerAll)
//open class BinanceEventTickerAll: BinanceEvent {
//    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
//        super.init(entity: entity, insertInto: context)
//    }
//    public required convenience init(from decoder: Decoder) throws {
//        // Create NSEntityDescription with NSManagedObjectContext
//        let whoami = String(describing: type(of: self))
//        // Swift.print("creating nsmanagedobject \(whoami)")
//        guard let managedObjectContext = decoder.userInfo[.context] as? NSManagedObjectContext,
//            let entity = NSEntityDescription.entity(forEntityName: whoami, in: managedObjectContext) else {
//                fatalError("Failed to decode BinanceEvent \(whoami)!")
//        }
//        self.init(entity: entity, insertInto: managedObjectContext)
//        // todo: how
////        try self.loadData(from: decoder, keyType: CodingKeys.self)
//    }
//}
//
//public extension BinanceEventTickerAll {
//    @nonobjc public class func fetchRequest() -> NSFetchRequest<BinanceEventTickerAll> {
//        return NSFetchRequest<BinanceEventTickerAll>(entityName: "BinanceEventTickerAll")
//    }
//    @NSManaged public var all: NSSet?
//}
//
//// MARK: Generated accessors for all
//public extension BinanceEventTickerAll {
//
//    @objc(addAllObject:)
//    @NSManaged public func addToAll(_ value: BinanceEventTicker)
//
//    @objc(removeAllObject:)
//    @NSManaged public func removeFromAll(_ value: BinanceEventTicker)
//
//    @objc(addAll:)
//    @NSManaged public func addToAll(_ values: NSSet)
//
//    @objc(removeAll:)
//    @NSManaged public func removeFromAll(_ values: NSSet)
//
//}

@objc(BinanceKline)
open class BinanceKline: BinanceEvent {
    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }
    public required convenience init(from decoder: Decoder) throws {
        // Create NSEntityDescription with NSManagedObjectContext
        let whoami = String(describing: type(of: self))
        // Swift.print("creating nsmanagedobject \(whoami)")
        guard let managedObjectContext = decoder.userInfo[.context] as? NSManagedObjectContext,
            let entity = NSEntityDescription.entity(forEntityName: whoami, in: managedObjectContext) else {
                fatalError("Failed to decode BinanceEvent \(whoami)!")
        }
        self.init(entity: entity, insertInto: managedObjectContext)
        try self.loadData(from: decoder, keyType: CodingKeys.self)
    }

}

public extension BinanceKline {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BinanceKline> {
        return NSFetchRequest<BinanceKline>(entityName: "BinanceKline")
    }

    @NSManaged public var baseVolume: Double
    @NSManaged public var close: Double
    @NSManaged public var closeTime: NSDate?
    @NSManaged public var firstTradeID: Int64
    @NSManaged public var high: Double
    @NSManaged public var interval: String?
    @NSManaged public var klineIsClosed: Bool
    @NSManaged public var lastTradeID: Int64
    @NSManaged public var low: Double
    @NSManaged public var open: Double
    @NSManaged public var quoteVolume: Double
    @NSManaged public var startTime: NSDate?
    @NSManaged public var symbol: String?
    @NSManaged public var takerBuyBaseVolume: Double
    @NSManaged public var takerBuyQuoteVolume: Double
    @NSManaged public var tradeCount: Int64
    @NSManaged public var event: BinanceEventKLine?
    public enum CodingKeys: String, CodingKey {
        case startTime = "t"
        case closeTime = "T"
        case symbol = "s"
        case interval = "i"
        case firstTradeID = "f"
        case lastTradeID = "L"
        case open = "o"
        case close = "c"
        case high = "h"
        case low = "l"
        case baseVolume = "v"
        case tradeCount = "n"
        case klineIsClosed = "x"
        case quoteVolume = "q"
        case takerBuyBaseVolume = "V"
        case takerBuyQuoteVolume = "Q"
    }
}

@objc(BinanceEventTrade)
open class BinanceEventTrade: BinanceEvent {
    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }
    public required convenience init(from decoder: Decoder) throws {
        // Create NSEntityDescription with NSManagedObjectContext
        let whoami = String(describing: type(of: self))
        // Swift.print("creating nsmanagedobject \(whoami)")
        guard let managedObjectContext = decoder.userInfo[.context] as? NSManagedObjectContext,
            let entity = NSEntityDescription.entity(forEntityName: whoami, in: managedObjectContext) else {
                fatalError("Failed to decode BinanceEvent \(whoami)!")
        }
        self.init(entity: entity, insertInto: managedObjectContext)
        try self.loadData(from: decoder, keyType: CodingKeys.self)
    }

}
public extension BinanceEventTrade {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<BinanceEventTrade> {
        return NSFetchRequest<BinanceEventTrade>(entityName: "BinanceEventTrade")
    }
    
    @NSManaged public var buyerIsMaker: Bool
    @NSManaged public var buyerOrderID: Int64
    @NSManaged public var price: Double
    @NSManaged public var quantity: Double
    @NSManaged public var sellerOrderID: Int64
    @NSManaged public var symbol: String?
    @NSManaged public var tradeID: Int64
    @NSManaged public var tradeTime: NSDate?
    @NSManaged public var eventTime: NSDate?
    public enum CodingKeys: String, CodingKey {
        case e
        case eventTime = "E"
        case symbol = "s"
        case tradeID = "t"
        case price = "p"
        case quantity = "q"
        case buyerOrderID = "b"
        case sellerOrderID = "a"
        case tradeTime = "T"
        case buyerIsMaker = "m"
    }

}
