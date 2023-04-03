//
//  LoginView.swift
//  IndigoAgPartialClone
//
//  Created by Anthony Harvey on 5/5/22.
//

import SwiftUI

struct LoginView: View {
    @State var emailText: String = ""
    @State var pwText: String = ""
    @State var loggedIn = false
    @State var showPassword = false
    private enum Constants {
        static let email = "Email Address"
        static let password = "Password"
        static let login = "Log In"
        static let hide = "Hide"
        static let show = "Show"
        static let continueText = "Continue"
        static let forgotPassword = "Forgot Password?"
        static let privacyPolicy = "Privacy Policy."
        static let termsOfUse = "Terms of Use"
        static let byLoggingInYouAgreeToOur = "By logging in, you agree to our "
    }
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                loginHeadline
                emailTextField
                passwordTextField
                disclaimerText
                continueButton
                forgotPasswordButton
                Spacer()
            }.padding(22)
                .padding(.top)
            if loggedIn {
              HomeView()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

extension LoginView {
    @ViewBuilder var loginHeadline: some View {
        Text(Constants.login)
            .foregroundColor(.black)
            .font(.system(size: 32, weight: .semibold))
            .padding(.vertical, 10)
    }
    
    @ViewBuilder var emailTextField: some View {
        Text(Constants.email)
            .foregroundColor(grayFontColor)
            .font(.system(size: 15, weight: .semibold))
            .padding(.bottom, 20)
        ZStack(alignment: .bottom) {
            Divider()
            TextField("", text: $emailText)
                .foregroundColor(.black)
        }
    }
    
    @ViewBuilder var passwordTextField: some View {
        Text(Constants.password)
            .foregroundColor(grayFontColor)
            .font(.system(size: 15, weight: .semibold))
            .padding(.top)
        ZStack(alignment: .bottom) {
            Divider()
            HStack {
                if showPassword {
                    TextField("", text: $pwText)
                        .foregroundColor(.black)
                } else {
                    SecureField("", text: $pwText)
                        .foregroundColor(.black)
                }
                Button {
                    showPassword.toggle()
                } label: {
                    Text(showPassword ? Constants.hide : Constants.show)
                        .foregroundColor(logInButtonColor)
                        .bold()
                        .padding(.bottom, 10)
                }.padding(.trailing, 8)
            }
        }
    }
    
    @ViewBuilder var disclaimerText: some View {
        VStack(alignment: .center) {
            HStack(alignment: .firstTextBaseline, spacing: 0) {
                Text(Constants.byLoggingInYouAgreeToOur)
                    .lineLimit(1)
                    .font(.system(size: 14, weight: .regular))
                Link(Constants.termsOfUse, destination: URL(string: termsOfUseURL)!)
                    .foregroundColor(logInButtonColor)
                Text(" and")
                    .font(.system(size: 14, weight: .regular))
                
            }
            Link(Constants.privacyPolicy, destination: URL(string: privacyPolicyURL)!)
                .foregroundColor(logInButtonColor)
        }
        .foregroundColor(grayFontColor)
        .padding()
        .padding(.top, 16)
    }
    
    @ViewBuilder var continueButton: some View {
        Button {
            loggedIn = true
        } label: {
            ZStack {
                Capsule()
                    .foregroundColor(logInButtonColor)
                    .opacity(emailText.isEmpty || pwText.isEmpty ? 0.3 : 1)
                Text(Constants.continueText)
                    .bold()
                    .foregroundColor(.white)
                    .padding()
            }
        }
        .frame(width: screen.width - 50, height: 57)
    }
    
    @ViewBuilder var forgotPasswordButton: some View {
        Button {
            loggedIn = true
        } label: {
            ZStack {
                Text(Constants.forgotPassword)
                    .bold().foregroundColor(logInButtonColor).padding()
            }
        }
        .frame(width: screen.width - 50, height: 57)
        .opacity(emailText.isEmpty || pwText.isEmpty ? 0.3 : 1)
        .padding(.bottom, 28)
    }
}
