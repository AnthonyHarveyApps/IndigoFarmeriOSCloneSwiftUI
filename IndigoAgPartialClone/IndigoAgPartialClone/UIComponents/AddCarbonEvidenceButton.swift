//
//  AddCarbonEvidenceButton.swift
//  IndigoAgPartialClone
//
//  Created by Anthony Harvey on 4/3/23.
//

import SwiftUI

struct AddCarbonEvidenceButton: View {
    private enum Constants {
        static let imageName = "plus.magnifyingglass"
        static let text = "Add\nCarbon\nEvidence"
    }
    var body: some View {
        Button {
            print("Navigate to Add Carbon Evidence View")
        } label: {
            VStack {
                ZStack {
                    Circle()
                        .frame(width: 52, height: 52)
                        .foregroundColor(.white)
                    Image(systemName: Constants.imageName)
                        .font(.system(size: 26, weight: .regular))
                        .foregroundColor(.red)
                }
                Text(Constants.text)
                    .foregroundColor(.white)
                    .font(.system(size: 12, weight: .bold))
                    .multilineTextAlignment(.center)
            }
        }
    }
}

struct AddCarbonEvidenceButton_Previews: PreviewProvider {
    static var previews: some View {
        AddCarbonEvidenceButton()
    }
}
