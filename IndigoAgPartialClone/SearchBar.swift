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
    var grayText: String = "Search Products"
    var body: some View {
        
        ZStack(alignment: .leading) {
            
            searcBarColor
                .frame(width: screen.width - 40, height: 46)
                .cornerRadius(8)
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .padding(.leading, 10)
                
            TextField(grayText, text: $text)
                .padding(7)
                .padding(.leading, -7)
                .background(Color.clear)
                .cornerRadius(8)
                .foregroundColor(.gray)
                .onTapGesture(perform:{
                    isEditing = true
                })
                .animation(.default, value: isEditing)
                
                if !text.isEmpty {
                
                if isLoading {
                    ProgressView()
                    
//                    Button(action: {
//                       text = ""
//                    }, label: {
//                        ActivityIndicator(style: .medium, animate: .constant(true))
//                            .configure {
//                                $0.color = .white
//                            }
//
//                    })
//                    .padding(.trailing, 32)
//                    .frame(width: 35, height: 35)
                } else {
                    Button(action: {
                       text = ""
                    }, label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                            .frame(width: 35, height: 35)
                    })
                    .padding(.trailing, 18)
  
                }
                }
//                if isEditing {
//                    Button(action: {
//                        text = ""
//                        isEditing = false
//                        hideKeyBoard()
//                    }, label: {
//                        Text("Cancel")
//                            .foregroundColor(.white)
//                    })
//                    .padding(.trailing, 10)
//                    .transition(.move(edge: .trailing))
//                    .animation(.default, value: isEditing)
//                }
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant("Corn"), isLoading: .constant(false))
    }
}
