//
//  CryptoView.swift
//  Crypto
//
//  Created by Jhon Diaz on 16/10/23.
//

import Foundation
import SwiftUI

struct CryptoView: View {
    
    //Almacenamos todo el viewmodel en la siguiente variable para utilizarlo en la vista
    @StateObject var viewModelCrypto = CryptoViewModel()
    

    
    init() {
        
    }
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(viewModelCrypto.datos, id: \.uuid) { coino in
                    NavigationLink(destination: CryptoDetailView(crypto1: CryptoViewModel(/*coin: coino*/))){
                        
                        VStack{
                            
                            //Firt
                            HStack{
                                Image(systemName: "fotico.fill")
                                    .data(url: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQaMU3B9VmN0Oia7G07_3U789m6OStH6whwlJJjcy-ncA&s")!)
                                    .frame(width:30, height:30)
                                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/ )
                                
                                Spacer()
                            }
                            
                            
                            HStack{
                                
                                Text("\(coino.name)")
                                    .font(.title2)
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                    .padding(5)
                                    
                                
                                Spacer()
                                
                                //Info
                                HStack{
                                    
                                    Text(String("$\(coino.price)".prefix(9)))
                                        .font(.title3)
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                                        .padding(5)
                                    
                                }
                            }
                            
                            //Second
                            HStack{
                                HStack{
                                    
                                    Text("\(coino.symbol)")
                                        .font(. callout)
                                        .foregroundColor(.white)
                                        .fontWeight(.light)
                                        .foregroundColor(.gray)
                                        .padding(6)
                                    
                                    Spacer()
                                }
                                
                                HStack{
                                    Text("\(coino.change)")
                                        .font(.callout)
                                        .foregroundColor(.red)
                                        .foregroundColor(.red)
                                        .padding(5)
                                }
                                
                                Spacer()
                                
                            }
                            
                            
                        }
                        .background(Color.gray)
                        .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                        .cornerRadius(10)
                        .padding(0.5)
                        
                    }
                }
                .navigationTitle("Home")
            }
            .onAppear {
                // Llama a la función para obtener los datos
                viewModelCrypto.getListCrypto()
                
            }
        }
        
        
        
    }
}


//Extension de imagen para darle manejo a la url de la misma
extension Image {
    
    func data(url:URL) -> Self{
        if let data = try? Data(contentsOf: url){
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        }
        return self
            .resizable()
    }
    
}

struct CryptoView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoView()
    }
}


