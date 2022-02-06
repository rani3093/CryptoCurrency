//
//  ViewModelToVC.swift
//  Cryptocurrency
//
//  Created by Archana Vetkar on 05/02/22.
// View model will talk with view controller using this protocol

import Foundation

protocol ViewModelToVC {

    func startLoading()
    func stopLoading()
    func SucessResponse()
    func ErrorResponse()

}
