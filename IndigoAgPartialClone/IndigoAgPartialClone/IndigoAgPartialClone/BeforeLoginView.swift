//
//  BeforeLoginView.swift
//  IndigoAgPartialClone
//
//  Created by Anthony Harvey on 5/5/22.
//

import SwiftUI

struct BeforeLoginView: View {
    @State var showLoginScreen = false
    private enum Constants {
        static let topLine = "Explore the next \nfrontier of farming."
        static let secondLine = "We're working with growers across the country to drive farm profitability. It's a tough job and we're here to work with you to get it done."
        static let login = "Log In"
        static let nameOfBGImage = "Farm"
    }
    var body: some View {
        ZStack {
            Color.black
            VStack {
                topIcon
                Spacer()
                textAboveButton
                loginButton
            }
            .frame(width: screen.width - 50)
            .padding()
            .background(background)
            
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

extension BeforeLoginView {
    @ViewBuilder var topIcon: some View {
        VStack(spacing: 0){
            Circle().stroke(lineWidth: 6)
                .frame(width: 19, height: 19)
                .foregroundColor(.red)
            Text("   I")
                .font(.system(size: 35, weight: .bold))
                .foregroundColor(.white)
        }.padding(50)
    }
    
    @ViewBuilder var textAboveButton: some View {
        VStack(alignment: .leading) {
            Text(Constants.topLine)
                .font(.system(size: 32, weight: .bold))
                .padding(.bottom, 3)
            Text(Constants.secondLine)
                .font(.system(size: 16, weight: .bold))
        }
        .foregroundColor(.white)
        .padding(.vertical, 33)
    }
    
    @ViewBuilder var loginButton: some View {
        Button {
            showLoginScreen = true
        } label: {
            ZStack {
                Capsule()
                    .foregroundColor(logInButtonColor)
                Text(Constants.login).bold().foregroundColor(.white).padding()
            }
        }
        .frame(width: screen.width - 50, height: 57)
        .padding(.bottom, 28)
    }
    
    @ViewBuilder var background: some View {
        Image(Constants.nameOfBGImage).resizable().scaledToFill().opacity(0.4).edgesIgnoringSafeArea(.all)
    }
}
