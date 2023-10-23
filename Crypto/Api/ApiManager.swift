//
//  ApiManagerr.swift
//  Crypto
//
//  Created by Jhon Diaz on 12/10/23.
//

import Foundation

enum APError: Error{
    case invalidURL
    case unableToComplete
    case invalidResponse
    case invalidData
    case decodingError
}

class ApiManager {
    
    static let shared = ApiManager()
    
    
    let headers = [
        "X-RapidAPI-Key": "6da1013053msh302a5900d67e7c3p15a235jsnbbff282e79f8",
        "X-RapidAPI-Host": "coinranking1.p.rapidapi.com"
    ]
    
    static let baseURL =  "https://coinranking1.p.rapidapi.com/coins?referenceCurrencyUuid=yhjMzLPhuIDl&timePeriod=24h&tiers%5B0%5D=1&orderBy=marketCap&orderDirection=desc&limit=50&offset=0"
    
    
    let request = NSMutableURLRequest(url: NSURL(string: baseURL)! as URL,
                                            cachePolicy: .useProtocolCachePolicy,
                                        timeoutInterval: 10.0)
    
    
    init(){}
    
    
    func getListCrypto(completed: @escaping(Result<[String: Any], APError>)->Void) {
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest) { (data, response, error) in
            if let error = error {
                completed(.failure(.unableToComplete))
                print("Error: \(error)")
                return
            }

            if let data = data {
                do {
                    if let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        completed(.success(jsonObject))
                    } else {
                        completed(.failure(.decodingError))
                        print("Error en la decodificación: No se pudo convertir en un diccionario.")
                    }
                } catch {
                    completed(.failure(.decodingError))
                    print("Error en la decodificación: \(error)")
                }
            } else {
                completed(.failure(.invalidData))
                print("Datos inválidos en la respuesta de la API.")
            }
        }

        dataTask.resume()
    }


    
    
    
}
  

/*struct PreData {
    static let crypto = CryptoModel(uuid: "", symbol: "", name: "", color: "", iconURL: "", marketCap: "", price: "", listedAt: 1, tier: 2, change: <#T##String#>, rank: 2, sparkline: [""], lowVolume: true, coinrankingURL: "", the24HVolume: "", btcPrice: "")
    
}*/
    
    
