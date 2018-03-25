# BinanceWSApi
Xcode/macos Binance Api Client for websocket using CoreData and Starscream

no unit tests so far, i've tested a few combinations of endpoint. 

depths not supported so far.

does not (really) detect if the same data has already been loaded.

### installation

clone the project, put BinanceWSApi.xcodeproj in your project, include BinanceWSApi.framework in your linker (Project/Build Phases/Link Binary With Libraries). 

### Usage

your app should manage core data. when initialising core data in your appdelegate. add this to the core data stack:

    lazy var managedObjectModel: NSManagedObjectModel = {
        // required to get the model from framework
        let bundle = Bundle(identifier: "de.cbret.BinanceWSApi")
        let modelURL = bundle!.url(forResource: "BinanceWSApi", withExtension: "momd")!
        return NSManagedObjectModel(contentsOf: modelURL)!
    }()

and change the container declaration in the persistentController declaration to this:

        let container = NSPersistentContainer(name: "BinanceWSApi", managedObjectModel: self.managedObjectModel)

that will associate the core data stack with the BinanceWSApi data model. the name of the container can be anything you want the sqlite file on disk be called.

create an instance:

        binanceticker = BinanceWSApi(streams: ["ethbtc@kline_1h", "neobtc@aggTrade", "omgeth@depth"], context:appDelegate.persistentContainer.viewContext)

as for the streams, see the binance documentation at:
https://github.com/binance-exchange/binance-official-api-docs/blob/master/web-socket-streams.md
