//
//  CurrencyIntemView.swift
//  Crypto
//
//  Created by Jhon Diaz on 18/10/23.
//

import Foundation
import SwiftUI

struct CurrencyItemView: View {
    
    var body: some View {
        
        VStack{
            
            //Firt
            HStack{
                Image(systemName: "bitcoinsign.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.yellow)
                Spacer()
            }
            
            
            //
            HStack{
                //Name
                Text("Bitcoin")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Spacer()
                
                //Info
                HStack{
                    
                    Text("$19.000")
                        .font(.title3)
                        .fontWeight(.medium)
                }
            }
            
            //Second
            HStack{
                HStack{
                    
                    Text("BTC")
                        .font(. callout)
                        .fontWeight(.light)
                        .foregroundColor(.gray)
                    
                   Spacer()
                }
                
                HStack{
                    Text("-1-97%")
                        .font(.callout)
                        .foregroundColor(.red)
                }
                
                Spacer()
                
            }
            
            
        }
        .background(Color.white)
        .cornerRadius(10)
        .padding(8)
        
    }
}

struct CurrencyItemView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyItemView()
    }
}
