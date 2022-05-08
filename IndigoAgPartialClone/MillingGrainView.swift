//
//  MillingGrainView.swift
//  IndigoAgPartialClone
//
//  Created by Anthony Harvey on 5/5/22.
//

import SwiftUI

struct MillingGrainView: View {
    @Environment(\.presentationMode) var presentationMode
    let productList = ["Corn", "Wheat", "Radish", "Carrots", "Lettuce"]
    @State var selectedProduct = "Corn"
    @State var isLoading = false
    @State var searchText: String = ""
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle().foregroundColor(.white)
                HStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(logInButtonColor)
                    }
                    Spacer()
                }
                    HStack {
                        Spacer()
                    Text("Milling Grain")
                        .bold()
                        .foregroundColor(logInButtonColor)
                    Spacer()
                }
            }.frame(height: 56)
            SearchBar(text: $searchText, isLoading: $isLoading)
                .padding()
            
            ScrollView {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 75) {
                        ForEach(productList, id: \.self) { product in
                            VStack(spacing: 14) {
                                Image(product)
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    .clipShape(Circle())
                                Text(product)
                            }.onTapGesture {
                                selectedProduct = product
                            }
                            .opacity(product == selectedProduct ? 1 : 0.7)
                        }
                        
                    }.padding(.horizontal, 70)
                }.padding(.vertical)
                Text("\(selectedProduct) Futures")
                    .padding()
                Text("\(selectedProduct) Bids")
                    .padding()
            }
            
           
            
            Spacer()
        }
        .padding()
        .navigationBarHidden(true)
    }
}

struct MillingGrainView_Previews: PreviewProvider {
    static var previews: some View {
       // NavigationView {
            MillingGrainView()
      //  }
    }
}
