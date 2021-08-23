//
//  Webservice.swift
//  CryptoMarket
//
//  Created by Furkan Erzurumlu on 19.08.2021.
//

import Foundation

class Webservice {
    func downloadCurrencies(url : URL, completion : @escaping([CryptoCurrency]?) -> Void) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                let cryptoList = try? JSONDecoder().decode([CryptoCurrency].self, from: data)
                
                completion(cryptoList)
            }
        }.resume()
        
    } 
}
