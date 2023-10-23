//
//  ViewModel.swift
//  Crypto
//
//  Created by Jhon Diaz on 17/10/23.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject{
    
    @Published var listCrypto2 = [CryptoModel]()
    
    
    init() {
       //holaFuncion()
    }
    
    
    
    func holaFuncion(){
        
        ApiManager.shared.getListCrypto { result in
            switch result {
            case .success(let cryptoModels):
                self.listCrypto2 = cryptoModels
                print("Lista de Fotos: \(cryptoModels.count)")
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
        
        
    }
    
}
