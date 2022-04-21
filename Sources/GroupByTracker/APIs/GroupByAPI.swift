//
// GroupByAPI.swift
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

class GroupByAPI {
    /**
     - Send addToCart POST request
     - parameter addToCartBeacon: (body) beacon (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func addToCartPost(addToCartBeacon: AddToCartBeacon? = nil, apiResponseQueue: DispatchQueue = gbAPI.apiResponseQueue, completion: @escaping ((_ error: Error?) -> Void)) {
        addToCartPostWithRequestBuilder(addToCartBeacon: addToCartBeacon).execute(apiResponseQueue) { result in
            switch result {
            case .success(_):
                completion(nil)
            case let .failure(error):
                completion(error)
            }
        }
    }

    /**
     Send addToCart POST request
     - POST /addToCart
     - Send addToCart POST request
     - parameter addToCartBeacon: (body) beacon (optional)
     - returns: RequestBuilder<String>
     */
    open class func addToCartPostWithRequestBuilder(addToCartBeacon: AddToCartBeacon? = nil) -> RequestBuilder<Void> {
        let localVariablePath = "/addToCart"
        let localVariableURLString = gbAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: addToCartBeacon)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Void>.Type = gbAPI.requestBuilderFactory.getNonDecodableBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }
    
    /**
     - Send autoSearch POST request
     - parameter autoSearchBeacon: (body) beacon (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func autoSearchPost(autoSearchBeacon: AutoSearchBeacon? = nil, apiResponseQueue: DispatchQueue = gbAPI.apiResponseQueue, completion: @escaping ((_ error: Error?) -> Void)) {
        autoSearchPostWithRequestBuilder(autoSearchBeacon: autoSearchBeacon).execute(apiResponseQueue) { result in
            switch result {
            case .success(_):
                completion(nil)
            case let .failure(error):
                completion(error)
            }
        }
    }

    /**
     Send autoSearch POST request
     - POST /autoSearch
     - Send autoSearch POST request
     - parameter autoSearchBeacon: (body) beacon (optional)
     - returns: RequestBuilder<String>
     */
    open class func autoSearchPostWithRequestBuilder(autoSearchBeacon: AutoSearchBeacon? = nil) -> RequestBuilder<Void> {
        let localVariablePath = "/autoSearch"
        let localVariableURLString = gbAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: autoSearchBeacon)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Void>.Type = gbAPI.requestBuilderFactory.getNonDecodableBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }
    
    /**
     - Send manualSearch POST request
     - parameter manualSearchBeacon: (body) beacon (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func manualSearchPost(manualSearchBeacon: ManualSearchBeacon? = nil, apiResponseQueue: DispatchQueue = gbAPI.apiResponseQueue, completion: @escaping ((_ error: Error?) -> Void)) {
        manualSearchPostWithRequestBuilder(manualSearchBeacon: manualSearchBeacon).execute(apiResponseQueue) { result in
            switch result {
            case .success(_):
                completion(nil)
            case let .failure(error):
                completion(error)
            }
        }
    }

    /**
     Send manualSearch POST request
     - POST /manualSearch
     - Send manualSearch POST request
     - parameter manualSearchBeacon: (body) beacon (optional)
     - returns: RequestBuilder<String>
     */
    open class func manualSearchPostWithRequestBuilder(manualSearchBeacon: ManualSearchBeacon? = nil) -> RequestBuilder<Void> {
        let localVariablePath = "/manualSearch"
        let localVariableURLString = gbAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: manualSearchBeacon)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Void>.Type = gbAPI.requestBuilderFactory.getNonDecodableBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }
    
    /**
     - Send order POST request
     - parameter orderBeacon: (body) beacon (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func orderPost(orderBeacon: OrderBeacon? = nil, apiResponseQueue: DispatchQueue = gbAPI.apiResponseQueue, completion: @escaping ((_ error: Error?) -> Void)) {
        orderPostWithRequestBuilder(orderBeacon: orderBeacon).execute(apiResponseQueue) { result in
            switch result {
            case .success(_):
                completion(nil)
            case let .failure(error):
                completion(error)
            }
        }
    }

    /**
     Send order POST request
     - POST /order
     - Send order POST request
     - parameter orderBeacon: (body) beacon (optional)
     - returns: RequestBuilder<String>
     */
    open class func orderPostWithRequestBuilder(orderBeacon: OrderBeacon? = nil) -> RequestBuilder<Void> {
        let localVariablePath = "/order"
        let localVariableURLString = gbAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: orderBeacon)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Void>.Type = gbAPI.requestBuilderFactory.getNonDecodableBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }
    
    /**
     - Send recImpression POST request
     - parameter recImpressionBeacon: (body) beacon (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func recImpressionPost(recImpressionBeacon: RecImpressionBeacon? = nil, apiResponseQueue: DispatchQueue = gbAPI.apiResponseQueue, completion: @escaping ((_ error: Error?) -> Void)) {
        recImpressionPostWithRequestBuilder(recImpressionBeacon: recImpressionBeacon).execute(apiResponseQueue) { result in
            switch result {
            case .success(_):
                completion(nil)
            case let .failure(error):
                completion(error)
            }
        }
    }

    /**
     Send order POST request
     - POST /recImpression
     - Send recImpression POST request
     - parameter recImpressionBeacon: (body) beacon (optional)
     - returns: RequestBuilder<String>
     */
    open class func recImpressionPostWithRequestBuilder(recImpressionBeacon: RecImpressionBeacon? = nil) -> RequestBuilder<Void> {
        let localVariablePath = "/recImpression"
        let localVariableURLString = gbAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: recImpressionBeacon)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Void>.Type = gbAPI.requestBuilderFactory.getNonDecodableBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }
    
    /**
     - Send removeFromCart POST request
     - parameter removeFromCartBeacon: (body) beacon (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func removeFromCartPost(removeFromCartBeacon: RemoveFromCartBeacon? = nil, apiResponseQueue: DispatchQueue = gbAPI.apiResponseQueue, completion: @escaping ((_ error: Error?) -> Void)) {
        removeFromCartPostWithRequestBuilder(removeFromCartBeacon: removeFromCartBeacon).execute(apiResponseQueue) { result in
            switch result {
            case .success(_):
                completion(nil)
            case let .failure(error):
                completion(error)
            }
        }
    }

    /**
     Send removeFromCart POST request
     - POST /removeFromCart
     - Send removeFromCart POST request
     - parameter removeFromCartBeacon: (body) beacon (optional)
     - returns: RequestBuilder<String>
     */
    open class func removeFromCartPostWithRequestBuilder(removeFromCartBeacon: RemoveFromCartBeacon? = nil) -> RequestBuilder<Void> {
        let localVariablePath = "/removeFromCart"
        let localVariableURLString = gbAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: removeFromCartBeacon)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Void>.Type = gbAPI.requestBuilderFactory.getNonDecodableBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }
    
    /**
     - Send viewProduct POST request
     - parameter viewProductBeacon: (body) beacon (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func viewProductPost(viewProductBeacon: ViewProductBeacon? = nil, apiResponseQueue: DispatchQueue = gbAPI.apiResponseQueue, completion: @escaping ((_ error: Error?) -> Void)) {
        viewProductPostWithRequestBuilder(viewProductBeacon: viewProductBeacon).execute(apiResponseQueue) { result in
            switch result {
            case .success(_):
                completion(nil)
            case let .failure(error):
                completion(error)
            }
        }
    }

    /**
     Send viewProduct POST request
     - POST /viewProduct
     - Send viewProduct POST request
     - parameter viewProductBeacon: (body) beacon (optional)
     - returns: RequestBuilder<String>
     */
    open class func viewProductPostWithRequestBuilder(viewProductBeacon: ViewProductBeacon? = nil) -> RequestBuilder<Void> {
        let localVariablePath = "/viewProduct"
        let localVariableURLString = gbAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: viewProductBeacon)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Void>.Type = gbAPI.requestBuilderFactory.getNonDecodableBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }
}
