import Foundation
import UIKit

public class GbTracker {
    public var customerId: String
    public var area: String
    public var urlPrefixOverride: String?
    
    private var customer: Customer
    private var shopperTracking: ShopperTracking
    private var nativeAppClient: NativeAppClient
    
    public init(customerId: String, area: String, login: Login, urlPrefixOverride: String? = nil) {
        self.customerId = customerId
        self.area = area
        self.urlPrefixOverride = urlPrefixOverride
        
        if (urlPrefixOverride == nil)
        {
            gbAPI.basePath = String(format: gbAPI.basePath, self.customerId)
        }
        else
        {
            gbAPI.basePath = self.urlPrefixOverride!
        }
        
        self.customer = Customer(area: self.customerId, id: self.area)
        self.nativeAppClient = NativeAppClient(appId: Bundle.main.bundleIdentifier ?? "", lang: Locale.preferredLanguages[0], model: UIDevice.current.modelName, platform: Platform.ios)
        
        var uuid = ""
        let userDefaults = UserDefaults.standard
        let uuidExpiration = userDefaults.double(forKey: "com.groupby.tracker.uuid.expiration")
        let currentTime = Date().timeIntervalSince1970 * 1000
        if (currentTime < uuidExpiration)
        {
            uuid = userDefaults.string(forKey: "com.groupby.tracker.uuid.value") ?? ""
        }
        
        if (uuid == "")
        {
            uuid = UUID().uuidString
            
            userDefaults.set(uuid, forKey: "com.groupby.tracker.uuid.value")
            
            let now = Date()
            let cal = Calendar(identifier: .gregorian)
            let nextYear = cal.date(byAdding: .year, value: 1, to: now)!
            let nextYearTime = nextYear.timeIntervalSince1970 * 1000
            userDefaults.set(nextYearTime, forKey: "com.groupby.tracker.uuid.expiration")
        }
        self.shopperTracking = ShopperTracking(login: login, visitorID: uuid)
    }
    
    public func sendAddToCartEvent(addToCartBeacon: AddToCartBeacon, completion: @escaping ((_ error: Error?) -> Void)) {
        addToCartBeacon.customer = self.customer
        addToCartBeacon.client = self.nativeAppClient
        addToCartBeacon.shopper = self.shopperTracking
        addToCartBeacon.time = Date()
        GroupByAPI.addToCartPost(addToCartBeacon: addToCartBeacon, completion: completion)
        renewUUIDExpiration()
    }
    
    public func sendAutoSearchEvent(autoSearchBeacon: AutoSearchBeacon, completion: @escaping ((_ error: Error?) -> Void)) {
        autoSearchBeacon.customer = self.customer
        autoSearchBeacon.client = self.nativeAppClient
        autoSearchBeacon.shopper = self.shopperTracking
        autoSearchBeacon.time = Date()
        GroupByAPI.autoSearchPost(autoSearchBeacon: autoSearchBeacon, completion: completion)
        renewUUIDExpiration()
    }
    
    public func sendManualSearchEvent(manualSearchBeacon: ManualSearchBeacon, completion: @escaping ((_ error: Error?) -> Void)) {
        manualSearchBeacon.customer = self.customer
        manualSearchBeacon.client = self.nativeAppClient
        manualSearchBeacon.shopper = self.shopperTracking
        manualSearchBeacon.time = Date()
        GroupByAPI.manualSearchPost(manualSearchBeacon: manualSearchBeacon, completion: completion)
        renewUUIDExpiration()
    }
    
    public func sendOrderEvent(orderBeacon: OrderBeacon, completion: @escaping ((_ error: Error?) -> Void)) {
        orderBeacon.customer = self.customer
        orderBeacon.client = self.nativeAppClient
        orderBeacon.shopper = self.shopperTracking
        orderBeacon.time = Date()
        GroupByAPI.orderPost(orderBeacon: orderBeacon, completion: completion)
        renewUUIDExpiration()
    }

    public func sendRecImpressionEvent(recImpressionBeacon: RecImpressionBeacon, completion: @escaping ((_ error: Error?) -> Void)) {
        recImpressionBeacon.customer = self.customer
        recImpressionBeacon.client = self.nativeAppClient
        recImpressionBeacon.shopper = self.shopperTracking
        recImpressionBeacon.time = Date()
        GroupByAPI.recImpressionPost(recImpressionBeacon: recImpressionBeacon, completion: completion)
        renewUUIDExpiration()
    }
    
    public func sendRemoveFromCartEvent(removeFromCartBeacon: RemoveFromCartBeacon, completion: @escaping ((_ error: Error?) -> Void)) {
        removeFromCartBeacon.customer = self.customer
        removeFromCartBeacon.client = self.nativeAppClient
        removeFromCartBeacon.shopper = self.shopperTracking
        removeFromCartBeacon.time = Date()
        GroupByAPI.removeFromCartPost(removeFromCartBeacon: removeFromCartBeacon, completion: completion)
        renewUUIDExpiration()
    }
    
    public func sendViewProductEvent(viewProductBeacon: ViewProductBeacon, completion: @escaping ((_ error: Error?) -> Void)) {
        viewProductBeacon.customer = self.customer
        viewProductBeacon.client = self.nativeAppClient
        viewProductBeacon.shopper = self.shopperTracking
        viewProductBeacon.time = Date()
        GroupByAPI.viewProductPost(viewProductBeacon: viewProductBeacon, completion: completion)
        renewUUIDExpiration()
    }
    
    private func renewUUIDExpiration() {
        let userDefaults = UserDefaults.standard
        let now = Date()
        let cal = Calendar(identifier: .gregorian)
        let nextYear = cal.date(byAdding: .year, value: 1, to: now)!
        let nextYearTime = nextYear.timeIntervalSince1970 * 1000
        userDefaults.set(nextYearTime, forKey: "com.groupby.tracker.uuid.expiration")
    }
    
    public func setLogin(login: Login)
    {
        self.shopperTracking.login = login
    }
    
    public func getLogin() -> Login {
        return self.shopperTracking.login
    }
}
