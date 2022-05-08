//
//  Constants.swift
//  IndigoAgPartialClone
//
//  Created by Anthony Harvey on 5/6/22.
//

import Foundation
import SwiftUI

let screen = UIScreen.main.bounds

let logInButtonColor = Color(uiColor: UIColor(red: 14/255.0, green: 112/255.0, blue: 169/255.0, alpha: 1.000))

let grayFontColor = Color(uiColor: UIColor(red: 67/255.0, green: 67/255.0, blue: 68/255.0, alpha: 1.000))

let NavTopColor = UIColor(red: 14/255.0, green: 112/255.0, blue: 169/255.0, alpha: 1.000)

let searcBarColor = Color(uiColor: UIColor(red: 239/255.0, green: 247/255.0, blue: 249/255.0, alpha: 1.000))


extension View {
    func hideKeyBoard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from:  nil, for: nil)
    }
}
