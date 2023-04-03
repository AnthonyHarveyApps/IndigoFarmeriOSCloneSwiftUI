//
//  HomeView.swift
//  IndigoAgPartialClone
//
//  Created by Anthony Harvey on 5/5/22.
//

import SwiftUI

struct HomeView: View {
    @State var carbonTasksExpanded: Bool = true
    @State var buyerStoreFrontsExpanded: Bool = true
    private enum Constants {
        static let topImageName = "Farm"
        static let greeting = "Good Morning, \nCole"
        static let buyerStorefronts = "Buyer Storefronts"
        static let myCarbonTasks = "My Carbon Tasks"
        static let thirteenFieldIdentified = "13 fields identified"
        static let addFields = "Add Fields"
        static let infoCircleSymbolName = "info.circle"
        static let pageTitle = "Home"
    }
    var body: some View {
        NavigationView {
            ZStack {
                Color.white.edgesIgnoringSafeArea(.all)
                VStack {
                    topGreetingAndAddCarbonButton
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 0) {
                            buyerStorefrontExpandable
                            ThickDivider()
                            carbonTasksExpandable
                        }.padding()
                    }
                    .padding(.bottom)
                    Spacer()
                }.edgesIgnoringSafeArea(.bottom)
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    toolBarMenuButton
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    toolBarTitle
                }
            }.tint(.white)
                .onAppear {
                    onAppearSetUp()
                }
                .preferredColorScheme(.light)
        }
    }
    func onAppearSetUp() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = NavTopColor
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

extension HomeView {
    @ViewBuilder var topGreetingAndAddCarbonButton: some View {
        ZStack {
            Image(Constants.topImageName)
                .resizable()
                .scaledToFill()
            VStack {
                Spacer()
                HStack(alignment: .top) {
                    Text(Constants.greeting)
                        .font(.system(size: 29, weight: .bold))
                        .foregroundColor(.white)
                    Spacer()
                    AddCarbonEvidenceButton()
                }
                .padding()
                .frame(width: screen.width)
            }
        }.frame(width: screen.width, height: 260)
    }
    
    @ViewBuilder var buyerStorefrontExpandable: some View {
        HStack {
            ChevronToggle(expanded: $buyerStoreFrontsExpanded)
            Text(Constants.buyerStorefronts)
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
                StoreFrontView(type: .millingGrain)
            } label: {
                StorefrontRow(type: .millingGrain)
            }.buttonStyle(PlainButtonStyle())
            
            NavigationLink {
                StoreFrontView(type: .blueCreek)
            } label: {
                StorefrontRow(type: .blueCreek)
            }.buttonStyle(PlainButtonStyle())
            
            NavigationLink {
                StoreFrontView(type: .edmontonGrain)
            } label: {
                StorefrontRow(type: .edmontonGrain)
            }.buttonStyle(PlainButtonStyle())
        }
    }
    
    @ViewBuilder var carbonTasksExpandable: some View {
        HStack {
            ChevronToggle(expanded: $carbonTasksExpanded)
            
            Text(Constants.myCarbonTasks)
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
                Image(systemName: Constants.infoCircleSymbolName)
                VStack(alignment: .leading, spacing: 5) {
                    Text(Constants.addFields)
                        .font(.system(size: 19, weight: .bold))
                        .foregroundColor(grayFontColor)
                    Text(Constants.thirteenFieldIdentified)
                        .font(.system(size: 13, weight: .bold))
                        .padding(8)
                        .background(Capsule().foregroundColor(.gray)
                            .opacity(0.3))
                }
                Spacer()
            }.padding(26)
        }
    }
    
    @ViewBuilder var toolBarMenuButton: some View {
        Image(systemName: "line.3.horizontal")
            .foregroundColor(.white)
    }
    
    @ViewBuilder var toolBarTitle: some View {
        HStack {
            Text(Constants.pageTitle)
                .foregroundColor(.white)
                .padding(.trailing, (screen.width / 2) - 47)
        }
    }
}
