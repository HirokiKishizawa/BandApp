//
//  textbootcamp.swift
//  B.B.B.
//
//  Created by 岸澤洋樹 on 2021/08/22.
//

import SwiftUI

struct textbootcamp: View {
    var body: some View {
        Text("こんにちは！".capitalized)
//            .font(.body)
//            .fontWeight(.heavy)
//            .bold()
//            //.underline()
//            .underline(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, color: Color.blue)
//            .italic()
//            .strikethrough(true, color: Color.red）
//            .font(.system(size: 24
//                          , weight: .semibold
//                          , design: .monospaced))
//            .baselineOffset(50.0)
//            .kerning(1.0)
            .multilineTextAlignment(.leading)
            .foregroundColor(.purple)
            .frame(width: 200, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .leading)
    }
}

struct textbootcamp_Previews: PreviewProvider {
    static var previews: some View {
        textbootcamp()
    }
}
