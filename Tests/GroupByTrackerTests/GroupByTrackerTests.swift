import XCTest
@testable import GroupByTracker

final class GroupByTrackerTests: XCTestCase {
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(GbTracker(customerId: "test", area: "test", login: Login(loggedIn: false,username: "")).customerId, "test")
    }
    
    func testAutoSearch() throws {
        let event = AutoSearchEvent(origin: Origin.search, searchID: UUID().uuidString.lowercased())
        let beacon = AutoSearchBeacon(event: event,  experiments: experiments(), metadata: metadata())
        
        let expectation = XCTestExpectation(description: "Send AutoSearch beacon")
        initTracker().sendAutoSearchEvent(autoSearchBeacon: beacon, completion: testCallback(expectation: expectation))
        wait(for: [expectation], timeout: 3)
    }
    
    func testManualSearch() throws {
        let pageInfo = PageInfo(recordStart:1, recordEnd: 10)
        let navigation = SelectedNavigation(name: "naviname", value: "navival")
        let record = Record(id: "411", title: "4gb RAM e-stick")
        let search = Search(query: "Download more RAM",
                            totalRecordCount: 1,
                            pageInfo: pageInfo,
                            records: [record],
                            selectedNavigation: [navigation])
        
        let event = ManualSearchEvent(search: search)
        let beacon = ManualSearchBeacon(event: event,  experiments: experiments(), metadata: metadata())
        
        let expectation = XCTestExpectation(description: "Send ManualSearch beacon")
        initTracker().sendManualSearchEvent(manualSearchBeacon: beacon, completion: testCallback(expectation: expectation))
        wait(for: [expectation], timeout: 3)
    }
    
    func testViewProduct() throws {
        let event = ViewProductEvent(product: product())
        let beacon = ViewProductBeacon(event: event,  experiments: experiments(), metadata: metadata())
        
        let expectation = XCTestExpectation(description: "Send ViewProduct beacon")
        initTracker().sendViewProductEvent(viewProductBeacon: beacon, completion: testCallback(expectation: expectation))
        wait(for: [expectation], timeout: 3)
    }
    
    func testAddToCart() throws {
        let item = CartItem(product: product(), quantity: 1)
        let cart = Cart(items: [item], type: "abc123")
        let event = AddToCartEvent(cart: cart)
        let beacon = AddToCartBeacon(event: event,  experiments: experiments(), metadata: metadata())
        
        let expectation = XCTestExpectation(description: "Send AddToCart beacon")
        initTracker().sendAddToCartEvent(addToCartBeacon: beacon, completion: testCallback(expectation: expectation))
        wait(for: [expectation], timeout: 3)
    }
    
    func testRemoveFromCart() throws {
        let item = CartItem(product: product(), quantity: 1)
        let cart = Cart(items: [item], type: "abc123")
        let event = RemoveFromCartEvent(cart: cart)
        
        let beacon = RemoveFromCartBeacon(event: event,  experiments: experiments(), metadata: metadata())
        
        let expectation = XCTestExpectation(description: "Send RemoveFromCart beacon")
        initTracker().sendRemoveFromCartEvent(removeFromCartBeacon: beacon, completion: testCallback(expectation: expectation))
        wait(for: [expectation], timeout: 3)
    }

    func testOrder() throws {
        let item = CartItem(product: product(), quantity: 1)
        let cart = Cart(items: [item], type: "abc123")
        let event = OrderEvent(cart: cart)
        let beacon = OrderBeacon(event: event, experiments: experiments(), metadata: metadata())
        
        let expectation = XCTestExpectation(description: "Send Order beacon")
        initTracker().sendOrderEvent(orderBeacon: beacon, completion: testCallback(expectation: expectation))
        wait(for: [expectation], timeout: 3)
    }
    
    func experiments() -> [Experiments] {
        return [Experiments(experimentID: "exp", experimentVariant: "var")]
    }
    
    func metadata() -> [Metadata] {
        return [Metadata(key: "k", value: "v")]
    }
    
    func product() -> Product {
        let price = Price(actual: "12.34", currency: "usd", onSale: true, regular: "23.45")
        return Product(category: "abc123", collection: "abc123", id: "abc123", price: price, sku: "abc123", title: "abc123")
    }
    
    func initTracker() -> GbTracker {
        let tracker = GbTracker(
            customerId: getEnvRequired(envName: "CUSTOMER_ID"),
            area: getEnvRequired(envName: "CUSTOMER_AREA"),
            login: Login(loggedIn: false, username: nil),
            urlPrefixOverride: getEnv(envName: "URL_OVERRIDE"))
        
        print("Initialized tracker, customer [\(tracker.customerId)], area [\(tracker.area)], url override: [\(String(describing: tracker.urlPrefixOverride))]")
        return tracker
    }
    
    func getEnvRequired(envName: String) -> String {
        let envVar = getEnv(envName: envName)
        if envVar != nil { return envVar! }
        fatalError("No env variable [\(envName)] is defined")
    }
    
    func getEnv(envName: String) -> String? {
        if let value = ProcessInfo.processInfo.environment[envName] {
            return value
        }
        return nil
    }
    
    func testCallback(expectation :XCTestExpectation) -> ((_ error: Error?) -> Void){
        return { error in
            if error == nil {
                expectation.fulfill()
                return
            }
            guard error == nil else {
                guard let gbError = error as? GbError else {
                    let errorText = "unknown error: " + (error?.localizedDescription ?? "")
                    XCTFail(String(format:"Failed due to error: %@", errorText))
                    return
                }
                
                switch gbError {
                case .error(let code, let errorDetails, let innerError):
                    guard let errorDetails = errorDetails else {
                        let errorText = "network or other error: " +
                        String(code) + " " + (innerError?.localizedDescription ?? "")
                        XCTFail(String(format:"Failed due to error: %@", errorText))
                        return
                    }
                    
                    if (errorDetails.jsonSchemaValidationErrors.count > 0) {
                        let errorText = "data validation error: " + errorDetails.jsonSchemaValidationErrors[0]
                        XCTFail(String(format:"Failed due to error: %@", errorText))
                    }
                    break
                }
                return
            }
        }
    }
    
}
