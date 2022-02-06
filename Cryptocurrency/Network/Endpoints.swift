//
//  Endpoints.swift
//  Cryptocurrency
//
//  Created by Archana Vetkar on 04/02/22.
// This protocol is base for all endpoints needed in code

import Foundation

protocol Endpoint {
    var scheme: String {
        get
    }
    var baseURL: String {
        get
    }
    var path: String {
        get
    }
    var parameters: [URLQueryItem]? {
        get
    }
    var method: String {
        get
    }
}
