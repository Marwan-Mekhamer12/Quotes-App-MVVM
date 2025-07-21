//
//  QuotesViewModel.swift
//  Quotes App (MVVM)
//
//  Created by Marwan Mekhamer on 20/07/2025.
//

import Foundation

protocol PassingData {
    func quote(at index: Int) -> Quote
    func fetch()
}

class QuotesViewModel {
    
    private var Quotes = [Quote]()
   private let manager = FetchData()
    
    var NumberOfQuotes: Int {
        return Quotes.count
    }
    
    func quote(at index: Int) -> Quote {
        return Quotes[index]
    }
    
    var didupdate: (() -> Void)?
    
    func fetch() {
        manager.FetchURL { [weak self] text in
            self?.Quotes = text
            self?.didupdate?()
        }
    }
    
}
