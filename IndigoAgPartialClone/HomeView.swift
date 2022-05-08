//
//  HomeView.swift
//  IndigoAgPartialClone
//
//  Created by Anthony Harvey on 5/5/22.
//

import SwiftUI

struct HomeView: View {
    @State var zoomedIn: Bool = false
    let timer = Timer.publish(every: 10, on: .main, in: .common).autoconnect()
    @State var carbonTasksExpanded: Bool = true
    @State var buyerStoreFrontsExpanded: Bool = true
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.white.edgesIgnoringSafeArea(.all)
                VStack {
                    ZStack {
                        Image("Farm")
                            .resizable()
                            .scaledToFill()
                        VStack {
                            Spacer()
                            HStack(alignment: .top) {
                                Text("Good Morning, \nCole")
                                    .font(.system(size: 29, weight: .bold))
                                    .foregroundColor(.white)
                                Spacer()
                                VStack {
                                    ZStack {
                                        Circle()
                                            .frame(width: 52, height: 52)
                                            .foregroundColor(.white)
                                        Image(systemName: "plus.magnifyingglass")
                                            .font(.system(size: 26, weight: .regular))
                                            .foregroundColor(.red)
                                    }
                                    Text("Add\nCarbon\nEvidence")
                                        .foregroundColor(.white)
                                        .font(.system(size: 12, weight: .bold))
                                        .multilineTextAlignment(.center)
                                }
                            }
                            .padding()
                            .frame(width: screen.width)
                        }
                    }.frame(width: screen.width, height: 260)
                    
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 0) {
                            
                            HStack {
                                Image(systemName: buyerStoreFrontsExpanded ? "chevron.down" : "chevron.forward")
                                    .foregroundColor(grayFontColor)
                                
                                Text("Buyer Storefronts")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.black)
                                    .onTapGesture {
                                        withAnimation {
                                            buyerStoreFrontsExpanded.toggle()
                                        }
                                    }
                                Spacer()
                            }.padding(20)
                            
                            if buyerStoreFrontsExpanded {
                                NavigationLink {
                                    MillingGrainView()
                                } label: {
                                    StorefrontRow(title: "Milling Grain", iconName: "leaf.fill", iconColor: .green)
                                }.buttonStyle(PlainButtonStyle())

                                
                                
                                StorefrontRow(title: "Blue Creek Coop", iconName: "drop.fill", iconColor: .blue)
                                
                                StorefrontRow(title: "Edmonton Grain", iconName: "building.columns.fill", iconColor: .brown)
                            }
                            Rectangle()
                                .frame(width: screen.width, height: 4)
                                .foregroundColor(.gray).opacity(0.1)
                                .padding(.top, -1)
                            
                            HStack {
                                Image(systemName: carbonTasksExpanded ? "chevron.down" : "chevron.forward")
                                    .foregroundColor(grayFontColor)
                                
                                Text("My Carbon Tasks")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.black)
                                    .onTapGesture {
                                        withAnimation {
                                            carbonTasksExpanded.toggle()
                                        }
                                    }
                                Spacer()
                                ZStack(alignment: .center) {
                                    Circle().frame(width: 28, height: 28)
                                        .foregroundColor(.red)
                                        .opacity(0.75)
                                    Text("1")
                                        .foregroundColor(.white)
                                }
                            }.padding(20)
                            
                            if carbonTasksExpanded {
                                HStack {
                                    Image(systemName: "info.circle")
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text("Add Fields")
                                            .font(.system(size: 19, weight: .bold))
                                            .foregroundColor(grayFontColor)
                                        Text("13 fields identified")
                                            .font(.system(size: 13, weight: .bold))
                                            .padding(7)
                                            .background(Capsule().foregroundColor(.gray)
                                                .opacity(0.3))
                                    }
                                    Spacer()
                                }.padding(26)
                            }
                        }.padding()
                    }
                    Spacer()
                }.edgesIgnoringSafeArea(.bottom)
            }.navigationTitle("")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.white)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack {
                            //Spacer()
                            Text("Home")
                                .foregroundColor(.white)
                                .padding(.trailing, (screen.width / 2) - 47)
                        }
                    }
                }.tint(.white)
                .onAppear {
                    let appearance = UINavigationBarAppearance()
                    appearance.backgroundColor = NavTopColor
                    UINavigationBar.appearance().standardAppearance = appearance
                    UINavigationBar.appearance().scrollEdgeAppearance = appearance
                }
                .preferredColorScheme(.light)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


