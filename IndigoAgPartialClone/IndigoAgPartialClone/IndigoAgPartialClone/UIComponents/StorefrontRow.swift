//
//  StorefrontRow.swift
//  IndigoAgPartialClone
//
//  Created by Anthony Harvey on 5/8/22.
//

import SwiftUI

enum StorefrontType : String {
    case millingGrain = "Milling Grain"
    case blueCreek = "Blue Creek Coop"
    case edmontonGrain = "Edmonton Grain"
}

struct StorefrontRow: View {
    var type: StorefrontType
    var body: some View {
        HStack(alignment: .center) {
            Label {
                VStack(alignment: .leading) {
                    text
                    Divider().padding(.top, 23)
                }
            } icon: {
                icon
            }
            Spacer()
            blueChevron
        }
        .padding(.top, 29)
        .padding(.horizontal, 30)
    }
    
    func correctTextForType() -> String {
        switch type {
        case .millingGrain:
            return "Milling Grain"
        case .blueCreek:
            return "Blue Creek Coop"
        case .edmontonGrain:
            return "Edmonton Grain"
        }
    }
    
    func correctImageForType() -> some View {
        switch type {
        case .millingGrain:
            return AnyView(Image(systemName: "leaf.fill").foregroundColor(.green))
        case .blueCreek:
            return AnyView(Image(systemName: "drop.fill").foregroundColor(.blue))
        case .edmontonGrain:
            return AnyView(Image(systemName: "building.columns.fill").foregroundColor(.brown))
        }
    }
}

struct StorefrontRow_Previews: PreviewProvider {
    static var previews: some View {
        StorefrontRow(type: .edmontonGrain)
    }
}

extension StorefrontRow {
    @ViewBuilder var icon: some View {
        correctImageForType()
            .font(.system(size: 28, weight: .semibold))
            .frame(width: 25, height: 25)
            .padding()
            .background(Color.white)
            .clipShape(Circle())
            .shadow(color: .gray, radius: 0.2, x: 0.5, y: 0.5)
    }
    
    @ViewBuilder var text: some View {
        Text(correctTextForType())
            .font(.system(size: 19, weight: .semibold))
            .foregroundColor(grayFontColor)
    }
    
    @ViewBuilder var blueChevron: some View {
        Image(systemName: "chevron.forward")
            .foregroundColor(.blue)
            .padding(.bottom)
    }
}
