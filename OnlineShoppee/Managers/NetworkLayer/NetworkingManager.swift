//
//  NetworkingManager.swift
//  OnlineShoppee
//
//  Created by anita on 3/14/23.
//

import Foundation
import Combine

final class NetworkingManager {
    
    static func download(url: URL) -> AnyPublisher<Data, Error> {
     return
            URLSession.shared.dataTaskPublisher(for: url)
                .subscribe(on: DispatchQueue.global(qos: .default))
                .tryMap ({ try handleURLPesponse(output: $0)})
                .receive(on: DispatchQueue.main)
                .eraseToAnyPublisher()
    }
    
    static func handleURLPesponse(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
    
    static func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
                break
        case .failure(let error):
            print(error)
        }
    }
}
