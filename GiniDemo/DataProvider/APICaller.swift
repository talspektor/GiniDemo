//
//  APICaller.swift
//  GiniDemo
//
//  Created by Tal talspektor on 04/06/2021.
//

import Foundation

enum APIError: Error {
    case badURL
}

enum APICaller {
    static let baseStringURL = "https://pastebin.com/raw/8wJzytQX"

    static func getNumbers(completion: @escaping (Result<Numbers, Error>) -> Void) {

        guard let url = URL(string: baseStringURL) else {
            completion(.failure(APIError.badURL))
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            do {
                let numbers = try JSONDecoder().decode(Numbers.self, from: data)
                completion(.success(numbers))
                print(numbers)
            } catch {
                print(error)
                completion(.failure(error))
            }
        }.resume()
    }
}
