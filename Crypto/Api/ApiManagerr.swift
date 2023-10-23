//
//  ApiManager.swift
//  Crypto
//
//  Created by Jhon Diaz on 12/10/23.
//

import Foundation

enum APError1: Error{
    case invalidURL
    case unableToComplete
    case invalidResponse
    case invalidData
    case decodingError
}

class ApiManagerr {
    
    static let shared = ApiManagerr()
    
    static let baseURL = "https://psp-merchantpanel-service-sandbox.ozanodeme.com.tr/api/v1/dummy/coins"
    
    init(){}
    
    func getListCrypto(completed: @escaping(Result<[CryptoModel], APError1>)->Void){
        
        guard let url = URL(string: ApiManagerr.baseURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        
        let task = URLSession.shared.dataTask(with: url){data, _,error in
            
            /*if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }*/
            
            guard let data = data else{
                completed(.failure(.decodingError))
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode([CryptoModel].self,from:data)
                completed(.success(decodedResponse))
            }catch{
                print("Debug: \(error.localizedDescription)")
                completed(.failure(.decodingError))
            }
        }
        
        task.resume()
    }
}







