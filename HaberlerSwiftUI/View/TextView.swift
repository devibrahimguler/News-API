//
//  TextView.swift
//  HaberlerSwiftUI
//
//  Created by İbrahim Güler on 8.08.2021.
//

import SwiftUI

struct TextView: View {
    
    let textString : String
    var body: some View {
        Text(textString)
            .fontWeight(.regular)
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView(textString: "Merhaba")
    }
}
