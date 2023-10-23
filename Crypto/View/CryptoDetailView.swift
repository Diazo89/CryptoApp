//
//  CryptoDetailView.swift
//  Crypto
//
//  Created by Jhon Diaz on 16/10/23.
//

import Foundation
import SwiftUI

struct CryptoDetailView: View {

    @StateObject var crypto1 = CryptoViewModel()
    
    var body: some View {
        VStack{
            HStack{
                //Text(crypto1.$datos.first())
                //Text(crypto1.price)
            }
        }
    }
}


struct CryptoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoDetailView(/*crypto1: PreData.crypto */ )
    }
}

