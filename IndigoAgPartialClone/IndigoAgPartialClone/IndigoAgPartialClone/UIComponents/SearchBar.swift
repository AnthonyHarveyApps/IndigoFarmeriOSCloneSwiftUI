//
//  SearchBar.swift
//  IndigoAgPartialClone
//
//  Created by Anthony Harvey on 5/8/22.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @Binding var isLoading: Bool
    @State private var isEditing: Bool = false
    
    private enum Constants {
        static let grayText = "Search Products"
        static let magnifyingGlassSymbolName = "magnifyingglass"
        static let xSymbolName = "xmark.circle.fill"
    }
    var body: some View {
        ZStack(alignment: .leading) {
            background
            HStack {
                magnifyingGlass
                textArea
                if !text.isEmpty {
                    if isLoading {
                        ProgressView()
                    } else {
                        xButton
                    }
                }
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant("Corn"), isLoading: .constant(false))
    }
}

extension SearchBar {
    @ViewBuilder var background: some View {
        searcBarColor
            .frame(width: screen.width - 40, height: 46)
            .cornerRadius(8)
    }
    
    @ViewBuilder var xButton: some View {
        Button(action: {
            text = ""
        }, label: {
            Image(systemName: Constants.xSymbolName)
                .foregroundColor(.gray)
                .frame(width: 35, height: 35)
        })
        .padding(.trailing, 18)
    }
    
    @ViewBuilder var magnifyingGlass: some View {
        Image(systemName: Constants.magnifyingGlassSymbolName)
            .foregroundColor(.gray)
            .padding(.leading, 10)
    }
    
    @ViewBuilder var textArea: some View {
        TextField(Constants.grayText, text: $text)
            .padding(7)
            .padding(.leading, -7)
            .background(Color.clear)
            .cornerRadius(8)
            .foregroundColor(.gray)
            .onTapGesture(perform:{
                isEditing = true
            })
            .animation(.default, value: isEditing)
    }
}
