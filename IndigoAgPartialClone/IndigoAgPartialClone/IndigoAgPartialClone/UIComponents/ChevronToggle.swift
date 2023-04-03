//
//  ChevronToggle.swift
//  IndigoAgPartialClone
//
//  Created by Anthony Harvey on 4/3/23.
//

import SwiftUI

struct ChevronToggle: View {
    @Binding var expanded: Bool
    var body: some View {
        Image(systemName: expanded ? "chevron.down" : "chevron.forward")
            .foregroundColor(grayFontColor)
    }
}

struct ChevronToggle_Previews: PreviewProvider {
    static var previews: some View {
        ChevronToggle(expanded: .constant(true))
    }
}
