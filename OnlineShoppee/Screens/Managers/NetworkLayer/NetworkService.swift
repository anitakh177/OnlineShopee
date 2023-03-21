//
//  CombineApi.swift
//  OnlineShoppee
//
//  Created by anita on 3/20/23.
//

import Foundation
import Combine

protocol NetworkServiceProtocol {
    func execute<T>(_ request: URLRequest, decodingType: T.Type, retries: Int) -> AnyPublisher<T, Error> where T: Decodable
}


final class NetworkService: NetworkServiceProtocol {
    
    func execute<T>(_ request: URLRequest, decodingType: T.Type,
                    retries: Int = 0) -> AnyPublisher<T, Error> where T: Decodable {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse, response.statusCode == 200 else {
                    throw APIError.responseUnsuccessful
                }
                return $0.data
            }            
            .decode(type: T.self, decoder: decoder)
            .receive(on: DispatchQueue.main)
            .retry(retries)
            .eraseToAnyPublisher()
    }
}
