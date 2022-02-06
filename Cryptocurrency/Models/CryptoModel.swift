//
//  CryptoModel.swift
//  Cryptocurrency
//
//  Created by Archana Vetkar on 04/02/22.
//

import Foundation

// MARK: - CryptoModel

struct CryptoModel: Codable {
    let id, symbol, name: String
    let image: String
    let currentPrice: Double
    let marketCap, marketCapRank: Int
    let fullyDilutedValuation: Int?
    let priceChange24H, priceChangePercentage24H: Double
    let totalSupply, maxSupply: Double?
    let lastUpdated: String

    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case priceChange24H = "price_change_24h"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case lastUpdated = "last_updated"
    }
}

typealias CryptoResponse = [CryptoModel]
