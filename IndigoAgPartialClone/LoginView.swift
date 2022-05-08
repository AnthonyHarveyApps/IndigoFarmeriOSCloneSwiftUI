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
    
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                Text("Log In")
                    .foregroundColor(.black)
                    .font(.system(size: 32, weight: .semibold))
                    .padding(.vertical, 10)
                
                Text("Email Address")
                    .foregroundColor(grayFontColor)
                    .font(.system(size: 15, weight: .semibold))
                    .padding(.bottom, 20)
                ZStack(alignment: .bottom) {
                    Divider()
                    TextField("", text: $emailText)
                        .foregroundColor(.black)
                }
                Text("Password")
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
                            Text(showPassword ? "Hide" : "Show")
                                .foregroundColor(logInButtonColor)
                                .bold()
                                .padding(.bottom, 10)
                        }.padding(.trailing, 8)
                        
                    }
                    
                }
                VStack(alignment: .center) {
                    HStack(alignment: .firstTextBaseline, spacing: 0) {
                        Text("By logging in, you agree to our ")
                            .lineLimit(1)
                            .font(.system(size: 14, weight: .regular))
                        Link("Terms of Use", destination: URL(string: "https://www.indigoag.com/forms/softwaretou")!)
                            .foregroundColor(logInButtonColor)
            
                        Text(" and")
                            .font(.system(size: 14, weight: .regular))
                        
                    }
                    Link("Privacy Policy.", destination: URL(string: "https://www.indigoag.com/forms/softwaretou")!)
                        .foregroundColor(logInButtonColor)
                }
                .foregroundColor(grayFontColor)
                .padding()
                .padding(.top, 16)
                
                Button {
                    loggedIn = true
                } label: {
                    ZStack {
                        Capsule()
                            .foregroundColor(logInButtonColor)
                            .opacity(emailText.isEmpty || pwText.isEmpty ? 0.3 : 1)
                        Text("Continue")
                            .bold()
                            .foregroundColor(.white)
                            .padding()
                        
                    }
                }
                .frame(width: screen.width - 50, height: 57)
                
                Button {
                    loggedIn = true
                } label: {
                    ZStack {
                        Text("Forgot Password?")
                            .bold().foregroundColor(logInButtonColor).padding()
                        
                    }
                }
                .frame(width: screen.width - 50, height: 57)
                .opacity(emailText.isEmpty || pwText.isEmpty ? 0.3 : 1)
                .padding(.bottom, 28)

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
