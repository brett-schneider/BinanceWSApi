import Starscream
import CoreData

public class BinanceWSApi {
    let baseURL = URL(string: "wss://stream.binance.com:9443/ws")!
    let decoder = JSONDecoder()
    var context: NSManagedObjectContext?
    var socket: WebSocket
    init(streams endpoints:[String]) {
        socket = WebSocket(url: baseURL.appendingPathComponent(endpoints.reduce("") { a, b in "\(a)/\(b)" }))
        socket.delegate = self
        socket.connect()
        Swift.print(baseURL.appendingPathComponent(endpoints.reduce("") { a, b in "\(a)/\(b)" }))
    }
    private func newConnection(to endpoints:[String]) {
        if (socket.isConnected) {
            socket.disconnect(forceTimeout: 30000, closeCode: 1)
        }
        // socket.currentURL = baseURL.appendingPathComponent(endpoints.reduce("") { a, b in "\(a)/\(b)" })
        // for lack of a method to disconnect and connect to different url
        socket = WebSocket(url: baseURL.appendingPathComponent(endpoints.reduce("") { a, b in "\(a)/\(b)" }))
        socket.delegate = self
        socket.connect()
    }
    public convenience required init(streams endpoints:[String], context: NSManagedObjectContext) {
        self.init(streams: endpoints)
        decoder.userInfo[.context] = context
        // streams (all lower!!):
        // <symbol>@aggTrade
        // <symbol>@trade
        // <symbol>@kline_<interval>
        // <symbol>@ticker
        // !ticker@arr
        // <symbol>@depth<levels>
        // <symbol>@depth
    }
}

extension BinanceWSApi: WebSocketDelegate {
    public func process(data: Data) {
        if let event = try? decoder.decode(BinanceRepsonse.self, from: data) {
            Swift.print("response \(event)")
            switch event.event {
            case BinanceEventType.aggTrade:
                _ = try? decoder.decode(BinanceEventAggTrade.self, from: data)
                // print ("decoded something like: \(String(describing: f))")
            case BinanceEventType.trade:
                _ = try? decoder.decode(BinanceEventTrade.self, from: data)
            case BinanceEventType.kline:
                _ = try? decoder.decode(BinanceEventKLine.self, from: data)
            case BinanceEventType.ticker:
                _ = try? decoder.decode(BinanceEventTicker.self, from: data)
            // case allTicker = "allTicker" // stream name !ticker@arr ∀ symbols, actually same payload as 24hrTicker, except in an array
            case BinanceEventType.depthUpdate:
                _ = try? decoder.decode(BinanceEventAggTrade.self, from: data)
//            case let unknownvalue:
//                print ("unknown BinaceEventType: \(unknownvalue ?? "n/a")")
            }
        } else {
            Swift.print("failed to decode response. array?")
            if let event = try? decoder.decode([BinanceRepsonse].self, from: data) {
                if (event.count > 0) {
                    switch event[0].event {
                    case BinanceEventType.ticker:
                        _ = try? decoder.decode(BinanceEventTickerAll.self, from: data)
                    default:
                        Swift.print("this should not happen")
                    }
                }
            }
         }
    }

    public func websocketDidDisconnect(socket: WebSocketClient, error: Error?) {
        Swift.print("websocket disconnected.. trying reconnect..")
        socket.connect()
    }
    
    public func websocketDidConnect(socket: WebSocketClient) {
        Swift.print("websocket conneted")
    }
    public func websocketDidReceiveData(socket: WebSocketClient, data: Data) {
        Swift.print("websocket sent data")
        
    }
    public func websocketDidReceiveMessage(socket: WebSocketClient, text: String) {
        //Swift.print("websocket sent message: \(text)")
        self.process(data: text.data(using: .utf8)!)
    }
}

