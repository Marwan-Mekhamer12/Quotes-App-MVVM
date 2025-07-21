//
//  Quote.swift
//  Quotes App (MVVM)
//
//  Created by Marwan Mekhamer on 20/07/2025.
//

import Foundation


struct QuoteResponse: Codable {
    let quotes: [Quote]
}

struct Quote: Codable {
    let quote: String
    let author: String
}

