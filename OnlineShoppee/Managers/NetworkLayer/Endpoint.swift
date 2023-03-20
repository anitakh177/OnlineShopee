//
//  Endpoint.swift
//  OnlineShoppee
//
//  Created by anita on 3/20/23.
//

import Foundation

protocol Endpoint {
    var path: String { get }
}

extension Endpoint {
    var request: URLRequest {
        return URLRequest(url: URL(string: path)!)        
    }
}
