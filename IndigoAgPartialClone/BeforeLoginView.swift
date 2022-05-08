//
//  BeforeLoginView.swift
//  IndigoAgPartialClone
//
//  Created by Anthony Harvey on 5/5/22.
//

import SwiftUI

struct BeforeLoginView: View {
    @State var showLoginScreen = false
    
    var body: some View {
        ZStack {
            Color.black
            VStack {
                VStack(spacing: 0){
                    Circle().stroke(lineWidth: 6)
                        .frame(width: 19, height: 19)
                        .foregroundColor(.red)
                    Text("   I")
                        .font(.system(size: 35, weight: .bold))
                    // .font(.largeTitle)
                        .foregroundColor(.white)
                }.padding(50)
                Spacer()
                VStack(alignment: .leading) {
                    Text("Explore the next \nfrontier of farming.")
                        .font(.system(size: 37, weight: .bold))
                        .padding(.bottom, 3)
                    Text("We're working with growers across the country to drive farm profitability. It's a tough job and we're here to work with you to get it done.")
                        .font(.system(size: 16, weight: .bold))
                    
                }.foregroundColor(.white)
                    .padding(.vertical, 33)
                Button {
                    showLoginScreen = true
                } label: {
                    ZStack {
                        Capsule()
                            .foregroundColor(logInButtonColor)
                        Text("Log In").bold().foregroundColor(.white).padding()
                    }
                }
                .frame(width: screen.width - 50, height: 57)
                .padding(.bottom, 28)
            }
            .frame(width: screen.width - 50)
            .padding()
            .background(Image("Farm").resizable().scaledToFill().opacity(0.4)).edgesIgnoringSafeArea(.all)
            
            if showLoginScreen {
                LoginView()
                    .animation(.easeIn, value: showLoginScreen)
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct BeforeLoginView_Previews: PreviewProvider {
    static var previews: some View {
        BeforeLoginView()
    }
}
