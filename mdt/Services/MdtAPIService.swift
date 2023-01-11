//
//  MDTApiService.swift
//  mdt
//
//  Created by Derrick Hoon on 10/1/23.
//

import Foundation

class MdtAPIService: APICaller {
    static let targetUrl = "https://green-thumb-64168.uc.r.appspot.com"
    static let shared = MdtAPIService(targetUrl)
    
    enum Endpoint: String {
        case createLogin = "/login"
        case createTransfer = "/transfer"
        case createRegistration = "/register"
        case readBalance = "/balance"
        case readPayees = "/payees"
        case readTransactions = "/transactions"
    }
    
    init(_ url: String) {
        super.init(url: url)
    }
    
    func createLogin(loginDetails: LoginDetails, completion: @escaping (CreateLoginResponse) -> Void) {
        let reqData = CreateLoginData(username: loginDetails.username, password: loginDetails.password)
        guard let reqUrl = URL(string: super.url + Endpoint.createLogin.rawValue) else { return }

        call(HTTPType.POST, with: reqUrl, requestBody: reqData, completion: completion)
    }
    
    func createRegistration(registrationDetails: LoginDetails, completion: @escaping (CreateRegistrationResponse) -> Void) {
        let reqData = CreateRegistrationData(username: registrationDetails.username, password: registrationDetails.password)
        guard let reqUrl = URL(string: super.url + Endpoint.createRegistration.rawValue) else { return }
        
        call(HTTPType.POST, with: reqUrl, requestBody: reqData, completion: completion)
    }
    
    func readBalance(token: String, completion: @escaping (ReadBalanceResponse) -> Void) {
        guard let reqUrl = URL(string: super.url + Endpoint.readBalance.rawValue) else { return }
        
        call(HTTPType.GET, with: reqUrl, requestHeaders: ["Authorization": token], requestBody: EmptyData(), completion: completion)
    }
    
    func readPayees(token: String, completion: @escaping (ReadPayeesResponse) -> Void) {
        guard let reqUrl = URL(string: super.url + Endpoint.readPayees.rawValue) else { return }
        
        call(HTTPType.GET, with: reqUrl, requestHeaders: ["Authorization": token], requestBody: EmptyData(), completion: completion)
    }
    
    func readTransactions(token: String, completion: @escaping (ReadTransactionsResponse) -> Void) {
        guard let reqUrl = URL(string: super.url + Endpoint.readTransactions.rawValue) else { return }
        
        call(HTTPType.GET, with: reqUrl, requestHeaders: ["Authorization": token], requestBody: EmptyData(), completion: completion)
    }
    
//    func createTransfer(token: String, transferDetails: TransferDetails, completion: @escaping (CreateTransferResponse) -> Void) {
//        let reqData = CreateRegistrationData(username: transferDetails.username, password: transferDetails.password)
//        guard let reqUrl = URL(string: super.url + Endpoint.createTransfer.rawValue) else { return }
//
//        call(HTTPType.POST, with: reqUrl, requestBody: reqData, completion: completion)
//    }
}
