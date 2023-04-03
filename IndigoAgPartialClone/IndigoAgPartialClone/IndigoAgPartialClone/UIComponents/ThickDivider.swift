//
//  ThickDivider.swift
//  IndigoAgPartialClone
//
//  Created by Anthony Harvey on 4/3/23.
//

import SwiftUI

struct ThickDivider: View {
    var body: some View {
        Rectangle()
            .frame(width: screen.width, height: 4)
            .foregroundColor(.gray).opacity(0.1)
            .padding(.top, -1)
    }
}

struct ThickDivider_Previews: PreviewProvider {
    static var previews: some View {
        ThickDivider()
    }
}
