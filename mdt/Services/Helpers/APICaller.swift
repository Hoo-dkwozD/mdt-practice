//
//  DataTask.swift
//  mdt
//
//  Created by Derrick Hoon on 10/1/23.
//

import Foundation

class APICaller {
    var url: String
    
    enum HTTPType: String {
        case GET
        case POST
        case PUT
        case DELETE
    }
    
    init(url: String) {
        self.url = url
    }
    
    func call<Response: Codable, Request: Codable>(_ httpType: HTTPType, with url: URL, requestHeaders: Dictionary<String, String>? = nil, requestBody: Request, completion: @escaping (Response) -> Void) -> Void {
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = httpType.rawValue
        if (requestHeaders != nil) {
            for (headerName, headerValue) in requestHeaders! {
                urlRequest.setValue(headerValue, forHTTPHeaderField: headerName)
            }
        }
        if requestBody is EmptyData {
            do {
                urlRequest.httpBody = try JSONEncoder().encode(requestBody)
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
                urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
                urlRequest.setValue(String(describing: urlRequest.httpBody), forHTTPHeaderField: "Content-Length")
            } catch let encodingError {
                print(encodingError.localizedDescription)
                return
            }
        }
        
        URLSession.shared.dataTask(with: urlRequest) { data, res, error in
            guard let data = data else { return }
            do {
                let response = try JSONDecoder().decode(Response.self, from: data)
                completion(response)
            } catch let decodingError {
                print(decodingError.localizedDescription)
                return
            }
        }
        .resume()
    }
}
