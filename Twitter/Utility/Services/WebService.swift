//
//  Service.swift
//  Twitter
//
//  Created by Apple on 3/13/18.
//  Copyright © 2018 syntaxerror. All rights reserved.
//

import TRON

class WebService {
    static let SharedInstance = WebService()
    let tron = TRON(baseURL: API.baseURL)
}
