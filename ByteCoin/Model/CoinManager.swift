//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "F742A8B7-46C3-4BCF-8EE8-5771955204A6"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    func getCoinPrice(for currency: String) {
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        
        if let url = URL(string: urlString) {
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url ) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
            let dataAsString = String(data: data!, encoding: .utf8)
            parseJSON(data!)
            }
            task.resume()
        }
    }
    
    func parseJSON(_ byteCoinData: Data) -> ByteCoinModel? {
            
            let decoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode(ByteCoinData.self, from: byteCoinData)
                let price = decodedData.rate
                let currencyCode = decodedData.asset_id_quote
                let byteCoin = ByteCoinModel(price: price, currencyCode: currencyCode)
                print(price)
                return byteCoin
            } catch {
//                delegate?.didFailWithError(error: error)
                return nil
            }
            
        }
    
}
