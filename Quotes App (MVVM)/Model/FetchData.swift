//
//  FetchData.swift
//  Quotes App (MVVM)
//
//  Created by Marwan Mekhamer on 20/07/2025.
//

import Foundation

protocol APILogic {
    func FetchURL(completion: @escaping ([Quote]) -> Void)
    func ParaseJson(_ data: Data, completion: @escaping ([Quote]) -> Void)
}

class FetchData: APILogic {
    
    func FetchURL(completion: @escaping ([Quote]) -> Void) {
        if let url = URL(string: "https://dummyjson.com/quotes") {   // The API
            let Session = URLSession(configuration: .default)
            let task = Session.dataTask(with: url) { [weak self] data, response, error in
                if let error = error {
                    print("❌ Error with request: \(error))")
                    return
                }
                
                if let safeData = data {
                    self?.ParaseJson(safeData, completion: completion)
                }
            }
            
            task.resume()
        }
    }
    
    func ParaseJson(_ data: Data, completion: @escaping ([Quote]) -> Void) {
        let decoder = JSONDecoder()
        do {
            let decoded = try decoder.decode(QuoteResponse.self.self, from: data)
            completion(decoded.quotes)
        } catch {
            print("❌ JSON decode error: \(error)")
        }
    }
    
}
