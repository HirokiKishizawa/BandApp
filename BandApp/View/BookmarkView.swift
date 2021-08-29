//
//  BookmarkView.swift
//  BookmarkView
//
//  Created by Takumi Otsuka on 28/7/21.
//

import SwiftUI

struct BookmarkView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<100) { _ in
                    Text("[バンド募集！]Bruno Marsやりませんか？")
                }
            }
            .navigationTitle("Favourites")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
    }
}

struct BookmarkView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkView()
    }
}
