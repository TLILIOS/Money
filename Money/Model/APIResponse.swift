//
//  APIResponse.swift
//  Money
//
//  Created by HAMDI TLILI on 16/07/2023.
//

import Foundation
struct APIResponse: Codable {
    var status: String
    var data: Datas
}

struct Datas: Codable {
    var stats: Stats
    var coins: [Coins]
}

struct Stats: Codable {
    var total: Int
    var totalCoins: Int
    var totalExchanges: Int
}
struct Coins: Codable {
    var name: String
    var price: String
    var change: String
    var iconUrl: String
}
