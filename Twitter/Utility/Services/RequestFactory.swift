//
//  RequestFactory.swift
//  Twitter
//
//  Created by Apple on 3/13/18.
//  Copyright © 2018 syntaxerror. All rights reserved.
//

import SwiftyJSON
import TRON

class RequestFactory {
    
    init(methodName : String, pathVariables : (urlKey : String, urlValue : Any), parameters : Any?) throws {
        self.methodName = methodName
        self.pathVariables = pathVariables
        if let params = parameters { self.parameters = params }
        print("Created Request")
    }
    
    let tron = TRON(baseURL: API.baseURL)
    
    var methodName : String
    var pathVariables : (String, Any)
    var parameters : Any?
    
    func create() -> APIRequest<User,JSONError> {
        let request: APIRequest<User,JSONError> = tron.swiftyJSON.request(methodName)
        request.method = .post
        return request
    }
    
    func read(id: Int) -> APIRequest<User, JSONError> {
        return tron.swiftyJSON.request("?\(pathVariables.0)=\(pathVariables.1 as! Int)")
    }
    
    func update(id: Int, parameters: [String:AnyObject]) -> APIRequest<User, JSONError> {
        let request: APIRequest<User,JSONError> = tron.swiftyJSON.request("?\(methodName)=\(pathVariables.1 as! Int)")
        request.method = .put
        request.parameters = parameters
        return request
    }
    
    func delete(id: Int) -> APIRequest<User,JSONError> {
        let request: APIRequest<User,JSONError> = tron.swiftyJSON.request("?\(methodName)=\(pathVariables.1 as! Int)")
        request.method = .delete
        return request
    }
}

class JSONError: JSONDecodable {
    required init(json: JSON) throws {
        print("in json error")
    }
}
