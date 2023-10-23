//
//  ContentView.swift
//  Crypto
//
//  Created by Jhon Diaz on 17/10/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        

        VStack {
            Text("Welcome to CryptoWallet")
                .font(.largeTitle)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
            
            Text("If you are creating a new wallet press the GENERATE button. Take nota of the mnemonic phase, it should be stored in a place")
                .font(.body)
                .padding(10)
                
            Spacer()
            

            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec viverra nisi ut leo rutrum, ut auctor massa venenatis. Phasellus in dui leo. Morbi porttitor aliquet tortor quis luctus")
                .font(.body)
                .padding(.bottom, 20)
            
            Spacer()
            
            Button(action: {
                
            }) {
                Text("GENERATE NEW WALLET")
                    .font(.headline)
                    .padding()
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(15)
            }
            
            Button(action: {
                // Aquí colocas el texto que deseas mostrar en la consola
                
            }) {
                Text("NEW WALLET")
                    .font(.headline)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            }
            
            
        }
        .padding(20)
        
        
        
        
    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
