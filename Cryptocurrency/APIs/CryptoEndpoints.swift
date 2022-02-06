//
//  CryptoEndpoints.swift
//  Cryptocurrency
//
//  Created by Archana Vetkar on 04/02/22.
// Crypto endpoints are created base on the URL

import Foundation

enum CryptoEndpoints: Endpoint{
    
    case getPrizeList
    
    var scheme: String {
        return "https"
    }
    var baseURL: String {
        return "api.coingecko.com"
    }
    var path: String {
        return "/api/v3/coins/markets"
    }
    var parameters: [URLQueryItem]? {
        return [URLQueryItem(name: "vs_currency", value: "eur"),
                URLQueryItem(name: "order", value: "market_cap")]
    }
    var method: String {
        switch self {
        case.getPrizeList:
            return "GET"
        }
    }
    
}
