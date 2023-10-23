//
//  CryptoViewModel.swift
//  Crypto
//
//  Created by Jhon Diaz on 16/10/23.
//

import Foundation

class CryptoViewModel: ObservableObject{
    
    @Published var listCrypto1 = [CryptoModel]()
    @Published var datos: [Coin] = []//Creamonos una variable datos de tipo Coin para poder almacenar los datos provenientes de la API
    
    
    init() {
        getListCrypto()
    }
    
    func getListCrypto() {
        
        //Llamamos a la API
        ApiManager.shared.getListCrypto { result in
            switch result {
            case .success(let jsonObject):
                if let cryptoModelData = try? JSONSerialization.data(withJSONObject: jsonObject) {
                    do {
                        let decoder = JSONDecoder()
                        let cryptoModel = try decoder.decode(CryptoModel.self, from: cryptoModelData)//Decodificacion de datos
                        
                        let data = cryptoModel.data
                        
                        DispatchQueue.global().async {
                            let coins = data.coins
                            
                            DispatchQueue.main.async {
                                self.datos = coins//almacenamos los datos para ser utilizados en la vista
                            }
                            
                        }
                    } catch {
                        print("Error al decodificar CryptoModel: \(error)")
                    }
                } else {
                    print("No se pudo convertir en datos.")
                }
            case .failure(let error):
                // Maneja los errores de la API.
                print("Error: \(error)")
            }
        }
        
        
    }
    
    
}
