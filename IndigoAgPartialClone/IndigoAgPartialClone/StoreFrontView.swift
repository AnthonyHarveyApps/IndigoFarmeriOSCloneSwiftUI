//
//  MillingGrainView.swift
//  IndigoAgPartialClone
//
//  Created by Anthony Harvey on 5/5/22.
//

import SwiftUI

struct StoreFrontView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var selectedProduct: String? = productList.first
    @State var isLoading = false
    @State var searchText: String = ""
    var type: StorefrontType
    
    var body: some View {
        VStack {
            customBackNavigation
            SearchBar(text: $searchText, isLoading: $isLoading)
                .padding()
            ScrollView {
                productScroller
                futuresAndBidsIncomplete
            }
            Spacer()
        }.edgesIgnoringSafeArea(.all)
        .padding()
        .navigationBarHidden(true)
    }
}

struct MillingGrainView_Previews: PreviewProvider {
    static var previews: some View {
        StoreFrontView(type: .edmontonGrain)
    }
}

extension StoreFrontView {
    @ViewBuilder var backButton: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "chevron.left")
        }
    }
    
    @ViewBuilder var customBackNavigation: some View {
        ZStack {
            Rectangle().foregroundColor(.white)
            HStack {
                backButton
                Spacer()
            }
                HStack {
                    Spacer()
                    Text(type.rawValue)
                    .bold()
                    .foregroundColor(logInButtonColor)
                Spacer()
            }
        }.frame(height: 56)
    }
    @ViewBuilder var productScroller: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 75) {
                ForEach(productList, id: \.self) { product in
                    productButton(product: product)
                }
            }.padding(.horizontal, 70)
        }.padding(.vertical)
    }
    
    @ViewBuilder var futuresAndBidsIncomplete: some View {
        Text("\(selectedProduct ?? "") Futures")
            .padding()
        Text("\(selectedProduct ?? "") Bids")
            .padding()
    }
    
    @ViewBuilder func productButton(product: String) -> some View {
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
}
