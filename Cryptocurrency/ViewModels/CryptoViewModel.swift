//
//  CryptoViewModel.swift
//  Cryptocurrency
//
//  Created by Archana Vetkar on 05/02/22.
//

import Foundation

class CryptoViewModel {
//    MARK:- Variables
    var vcDelegate : ViewModelToVC!
    private(set) var cryptoModel : CryptoResponse!
    private let cryptoAPIHandler = CryptoPrizeAPI()
//    MARK:- Functions
    func getList()
    {
        vcDelegate.startLoading()
        cryptoAPIHandler.getCryptoPrizes { [self] result, error in
            if error != nil{
                self.vcDelegate.ErrorResponse()
            }
            if let model = result{
                self.cryptoModel = model
                self.vcDelegate.SucessResponse()
            }
            self.vcDelegate.stopLoading()
        }
    }
}
