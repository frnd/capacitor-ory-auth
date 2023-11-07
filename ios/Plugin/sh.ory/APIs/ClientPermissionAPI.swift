//
// ClientPermissionAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

open class ClientPermissionAPI {

    /**
     Check a permission
     
     - parameter namespace: (query) Namespace of the Relationship (optional)
     - parameter object: (query) Object of the Relationship (optional)
     - parameter relation: (query) Relation of the Relationship (optional)
     - parameter subjectId: (query) SubjectID of the Relationship (optional)
     - parameter subjectSetNamespace: (query) Namespace of the Subject Set (optional)
     - parameter subjectSetObject: (query) Object of the Subject Set (optional)
     - parameter subjectSetRelation: (query) Relation of the Subject Set (optional)
     - parameter maxDepth: (query)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func checkPermission(namespace: String? = nil, object: String? = nil, relation: String? = nil, subjectId: String? = nil, subjectSetNamespace: String? = nil, subjectSetObject: String? = nil, subjectSetRelation: String? = nil, maxDepth: Int64? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: CheckPermissionResult?, _ error: Error?) -> Void)) -> RequestTask {
        return checkPermissionWithRequestBuilder(namespace: namespace, object: object, relation: relation, subjectId: subjectId, subjectSetNamespace: subjectSetNamespace, subjectSetObject: subjectSetObject, subjectSetRelation: subjectSetRelation, maxDepth: maxDepth).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Check a permission
     - GET /relation-tuples/check/openapi
     - To learn how relationship tuples and the check works, head over to [the documentation](https://www.ory.sh/docs/keto/concepts/api-overview).
     - Bearer Token:
       - type: http
       - name: oryAccessToken
     - parameter namespace: (query) Namespace of the Relationship (optional)
     - parameter object: (query) Object of the Relationship (optional)
     - parameter relation: (query) Relation of the Relationship (optional)
     - parameter subjectId: (query) SubjectID of the Relationship (optional)
     - parameter subjectSetNamespace: (query) Namespace of the Subject Set (optional)
     - parameter subjectSetObject: (query) Object of the Subject Set (optional)
     - parameter subjectSetRelation: (query) Relation of the Subject Set (optional)
     - parameter maxDepth: (query)  (optional)
     - returns: RequestBuilder<CheckPermissionResult> 
     */
    open class func checkPermissionWithRequestBuilder(namespace: String? = nil, object: String? = nil, relation: String? = nil, subjectId: String? = nil, subjectSetNamespace: String? = nil, subjectSetObject: String? = nil, subjectSetRelation: String? = nil, maxDepth: Int64? = nil) -> RequestBuilder<CheckPermissionResult> {
        let localVariablePath = "/relation-tuples/check/openapi"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "namespace": (wrappedValue: namespace?.encodeToJSON(), isExplode: true),
            "object": (wrappedValue: object?.encodeToJSON(), isExplode: true),
            "relation": (wrappedValue: relation?.encodeToJSON(), isExplode: true),
            "subject_id": (wrappedValue: subjectId?.encodeToJSON(), isExplode: true),
            "subject_set.namespace": (wrappedValue: subjectSetNamespace?.encodeToJSON(), isExplode: true),
            "subject_set.object": (wrappedValue: subjectSetObject?.encodeToJSON(), isExplode: true),
            "subject_set.relation": (wrappedValue: subjectSetRelation?.encodeToJSON(), isExplode: true),
            "max-depth": (wrappedValue: maxDepth?.encodeToJSON(), isExplode: true),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<CheckPermissionResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Check a permission
     
     - parameter namespace: (query) Namespace of the Relationship (optional)
     - parameter object: (query) Object of the Relationship (optional)
     - parameter relation: (query) Relation of the Relationship (optional)
     - parameter subjectId: (query) SubjectID of the Relationship (optional)
     - parameter subjectSetNamespace: (query) Namespace of the Subject Set (optional)
     - parameter subjectSetObject: (query) Object of the Subject Set (optional)
     - parameter subjectSetRelation: (query) Relation of the Subject Set (optional)
     - parameter maxDepth: (query)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func checkPermissionOrError(namespace: String? = nil, object: String? = nil, relation: String? = nil, subjectId: String? = nil, subjectSetNamespace: String? = nil, subjectSetObject: String? = nil, subjectSetRelation: String? = nil, maxDepth: Int64? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: CheckPermissionResult?, _ error: Error?) -> Void)) -> RequestTask {
        return checkPermissionOrErrorWithRequestBuilder(namespace: namespace, object: object, relation: relation, subjectId: subjectId, subjectSetNamespace: subjectSetNamespace, subjectSetObject: subjectSetObject, subjectSetRelation: subjectSetRelation, maxDepth: maxDepth).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Check a permission
     - GET /relation-tuples/check
     - To learn how relationship tuples and the check works, head over to [the documentation](https://www.ory.sh/docs/keto/concepts/api-overview).
     - Bearer Token:
       - type: http
       - name: oryAccessToken
     - parameter namespace: (query) Namespace of the Relationship (optional)
     - parameter object: (query) Object of the Relationship (optional)
     - parameter relation: (query) Relation of the Relationship (optional)
     - parameter subjectId: (query) SubjectID of the Relationship (optional)
     - parameter subjectSetNamespace: (query) Namespace of the Subject Set (optional)
     - parameter subjectSetObject: (query) Object of the Subject Set (optional)
     - parameter subjectSetRelation: (query) Relation of the Subject Set (optional)
     - parameter maxDepth: (query)  (optional)
     - returns: RequestBuilder<CheckPermissionResult> 
     */
    open class func checkPermissionOrErrorWithRequestBuilder(namespace: String? = nil, object: String? = nil, relation: String? = nil, subjectId: String? = nil, subjectSetNamespace: String? = nil, subjectSetObject: String? = nil, subjectSetRelation: String? = nil, maxDepth: Int64? = nil) -> RequestBuilder<CheckPermissionResult> {
        let localVariablePath = "/relation-tuples/check"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "namespace": (wrappedValue: namespace?.encodeToJSON(), isExplode: true),
            "object": (wrappedValue: object?.encodeToJSON(), isExplode: true),
            "relation": (wrappedValue: relation?.encodeToJSON(), isExplode: true),
            "subject_id": (wrappedValue: subjectId?.encodeToJSON(), isExplode: true),
            "subject_set.namespace": (wrappedValue: subjectSetNamespace?.encodeToJSON(), isExplode: true),
            "subject_set.object": (wrappedValue: subjectSetObject?.encodeToJSON(), isExplode: true),
            "subject_set.relation": (wrappedValue: subjectSetRelation?.encodeToJSON(), isExplode: true),
            "max-depth": (wrappedValue: maxDepth?.encodeToJSON(), isExplode: true),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<CheckPermissionResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Expand a Relationship into permissions.
     
     - parameter namespace: (query) Namespace of the Subject Set 
     - parameter object: (query) Object of the Subject Set 
     - parameter relation: (query) Relation of the Subject Set 
     - parameter maxDepth: (query)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func expandPermissions(namespace: String, object: String, relation: String, maxDepth: Int64? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: ExpandedPermissionTree?, _ error: Error?) -> Void)) -> RequestTask {
        return expandPermissionsWithRequestBuilder(namespace: namespace, object: object, relation: relation, maxDepth: maxDepth).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Expand a Relationship into permissions.
     - GET /relation-tuples/expand
     - Use this endpoint to expand a relationship tuple into permissions.
     - Bearer Token:
       - type: http
       - name: oryAccessToken
     - parameter namespace: (query) Namespace of the Subject Set 
     - parameter object: (query) Object of the Subject Set 
     - parameter relation: (query) Relation of the Subject Set 
     - parameter maxDepth: (query)  (optional)
     - returns: RequestBuilder<ExpandedPermissionTree> 
     */
    open class func expandPermissionsWithRequestBuilder(namespace: String, object: String, relation: String, maxDepth: Int64? = nil) -> RequestBuilder<ExpandedPermissionTree> {
        let localVariablePath = "/relation-tuples/expand"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "namespace": (wrappedValue: namespace.encodeToJSON(), isExplode: true),
            "object": (wrappedValue: object.encodeToJSON(), isExplode: true),
            "relation": (wrappedValue: relation.encodeToJSON(), isExplode: true),
            "max-depth": (wrappedValue: maxDepth?.encodeToJSON(), isExplode: true),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<ExpandedPermissionTree>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Check a permission
     
     - parameter maxDepth: (query)  (optional)
     - parameter postCheckPermissionBody: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func postCheckPermission(maxDepth: Int64? = nil, postCheckPermissionBody: PostCheckPermissionBody? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: CheckPermissionResult?, _ error: Error?) -> Void)) -> RequestTask {
        return postCheckPermissionWithRequestBuilder(maxDepth: maxDepth, postCheckPermissionBody: postCheckPermissionBody).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Check a permission
     - POST /relation-tuples/check/openapi
     - To learn how relationship tuples and the check works, head over to [the documentation](https://www.ory.sh/docs/keto/concepts/api-overview).
     - Bearer Token:
       - type: http
       - name: oryAccessToken
     - parameter maxDepth: (query)  (optional)
     - parameter postCheckPermissionBody: (body)  (optional)
     - returns: RequestBuilder<CheckPermissionResult> 
     */
    open class func postCheckPermissionWithRequestBuilder(maxDepth: Int64? = nil, postCheckPermissionBody: PostCheckPermissionBody? = nil) -> RequestBuilder<CheckPermissionResult> {
        let localVariablePath = "/relation-tuples/check/openapi"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: postCheckPermissionBody)

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "max-depth": (wrappedValue: maxDepth?.encodeToJSON(), isExplode: true),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<CheckPermissionResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Check a permission
     
     - parameter maxDepth: (query) nolint:deadcode,unused (optional)
     - parameter postCheckPermissionOrErrorBody: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func postCheckPermissionOrError(maxDepth: Int64? = nil, postCheckPermissionOrErrorBody: PostCheckPermissionOrErrorBody? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: CheckPermissionResult?, _ error: Error?) -> Void)) -> RequestTask {
        return postCheckPermissionOrErrorWithRequestBuilder(maxDepth: maxDepth, postCheckPermissionOrErrorBody: postCheckPermissionOrErrorBody).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Check a permission
     - POST /relation-tuples/check
     - To learn how relationship tuples and the check works, head over to [the documentation](https://www.ory.sh/docs/keto/concepts/api-overview).
     - Bearer Token:
       - type: http
       - name: oryAccessToken
     - parameter maxDepth: (query) nolint:deadcode,unused (optional)
     - parameter postCheckPermissionOrErrorBody: (body)  (optional)
     - returns: RequestBuilder<CheckPermissionResult> 
     */
    open class func postCheckPermissionOrErrorWithRequestBuilder(maxDepth: Int64? = nil, postCheckPermissionOrErrorBody: PostCheckPermissionOrErrorBody? = nil) -> RequestBuilder<CheckPermissionResult> {
        let localVariablePath = "/relation-tuples/check"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: postCheckPermissionOrErrorBody)

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "max-depth": (wrappedValue: maxDepth?.encodeToJSON(), isExplode: true),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<CheckPermissionResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }
}
