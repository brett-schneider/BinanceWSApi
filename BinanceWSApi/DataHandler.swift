//
//  DataHandler.swift
//  BinanceWSApi
//
//  Created by Brett on 14.03.18.
//  Copyright © 2018 Christoph Bretschneider. All rights reserved.
//

import Starscream

class DataHandler: NSObject {
    let baseURL = URL(string: "wss://stream.binance.com:9443/ws/")!
    var socket: WebSocket
    init(streams endpoints:[String]) {
        super.init()
        socket = WebSocket(url: baseURL.appendingPathComponent(endpoints.reduce("") { a, b in "\(a)/\(b)" }))
        socket.delegate = self
        socket.connect()
    }
}

extension DataHandler: WebSocketDelegate {
    func websocketDidDisconnect(socket: WebSocketClient, error: Error?) {
        Swift.print("websocket disconnected.. trying reconnect..")
        socket.connect()
    }
    
    func websocketDidConnect(socket: WebSocketClient) {
        Swift.print("websocket conneted")
    }
    func websocketDidReceiveData(socket: WebSocketClient, data: Data) {
        
    }
    func websocketDidReceiveMessage(socket: WebSocketClient, text: String) {
        Swift.print("websocket sent message: \(text)")
    }
}

extension DataHandler {
    func processResponse<T: BinanceEvent>(data: Data) {
        try let b = T.init(from: data)
        
    }
}
