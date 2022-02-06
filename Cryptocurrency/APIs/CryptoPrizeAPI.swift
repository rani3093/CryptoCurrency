//
//  CryptoPrizeAPI.swift
//  Cryptocurrency
//
//  Created by Archana Vetkar on 05/02/22.
// This class will create request and call network engin

import Foundation

class CryptoPrizeAPI {
    
    typealias ResponseHandler = (_ result: CryptoResponse?, _ error: Any?)  -> Void
    
    func getCryptoPrizes(completion: @escaping ResponseHandler)
    {
        NetworkEngine.request(endpoint: CryptoEndpoints.getPrizeList) { (result: Result < CryptoResponse, Error >) in
            switch result {
                    case.success(let response):
                completion(response,nil)
                    case.failure(let error):
                completion(nil,error)
            }
        }
    }
    
}
