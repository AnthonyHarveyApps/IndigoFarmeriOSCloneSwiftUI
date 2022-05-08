//
//  StorefrontRow.swift
//  IndigoAgPartialClone
//
//  Created by Anthony Harvey on 5/8/22.
//

import SwiftUI

struct StorefrontRow: View {
    let title: String
    let iconName: String
    let iconColor: Color
    
    
    var body: some View {
        HStack(alignment: .center) {
            Label {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.system(size: 19, weight: .semibold))
                        .foregroundColor(grayFontColor)
                    Divider().padding(.top, 23)
                }
            } icon: {
                Image(systemName: iconName)
                    .font(.system(size: 28, weight: .semibold))
                    .frame(width: 25, height: 25)
                    .foregroundColor(iconColor)
                    .padding()
                    .background(Color.white)
                    .clipShape(Circle())
                    .shadow(color: .gray, radius: 0.2, x: 0.5, y: 0.5)
            }
            Spacer()
            Image(systemName: "chevron.forward")
                .foregroundColor(.blue)
                .padding(.bottom)
        }
        .padding(.top, 29)
        .padding(.horizontal, 30)
    }
}

struct StorefrontRow_Previews: PreviewProvider {
    static var previews: some View {
        StorefrontRow(title: "Title Here", iconName: "cloud", iconColor: .red)
    }
}
