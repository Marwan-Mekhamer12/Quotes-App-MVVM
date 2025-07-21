//
//  OpenQuotesViewModel.swift
//  Quotes App (MVVM)
//
//  Created by Marwan Mekhamer on 20/07/2025.
//

import Foundation

class OpenQuotesViewModel {
    
    let author: String
    let quote: String
    
    init(author: String, quote: String) {
        self.author = author
        self.quote = quote
    }
    
    var formattedQuote: String {
           return "\"\(quote)\"\n– \(author)"
       }
}
