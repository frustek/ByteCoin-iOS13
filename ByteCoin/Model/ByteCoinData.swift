//
//  ByteCoinData.swift
//  ByteCoin
//
//  Created by Adam Mroz on 30/01/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct ByteCoinData: Decodable {
    let asset_id_base: String
    let asset_id_quote: String
    let rate: Double
}
