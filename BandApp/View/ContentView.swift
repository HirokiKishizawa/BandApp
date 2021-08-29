//
//  ContentView.swift
//  BandApp
//
//  Created by Takumi Otsuka on 17/7/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("検索")
                }
            TimelineView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("カレンダー")
                }
            BookmarkView()
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("お気に入り")
                }
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("設定")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HomeView: View {
    @State var text1: String = ""
    @State var text2: String = ""
    var body: some View {
        NavigationView {
            ScrollView {
                // MARK: - LOGO Header
//                Image(systemName: "checkmark.circle.fill")
//                    .foregroundColor(Color.accentColor)
                // MARK: - 何か探す？
                HomeViewSearchWhat
                // MARK: - フリーワード検索
                HomeViewFreeWord
                // MARK: - 最近検索した履歴「りれき」
                HomeViewRecentSearch
            }
            .navigationTitle("B.B.B")
            .navigationBarTitleDisplayMode(.inline)
//            .navigationBarHidden(true)
        }
    }
}

extension HomeView {
    
    private var HomeViewSearchWhat: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("何か探す？")
                    .foregroundColor(.primary)
                    .font(.system(size: 20, weight: .semibold, design: .default))
                    .padding(.horizontal)
                    .padding(.top)
                HStack {
                    SquareView(image: "placeholder-2")
                    SquareView(image: "train")
                    SquareView(image: "drum")
                }
                
                TextField("まとめて検索", text: $text1)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .overlay(
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .padding(.trailing)
                        ,alignment: .trailing
                    )
                    .cornerRadius(25.0)
                    .padding(.horizontal)
                    .padding(.bottom)
            }
            .foregroundColor(Color(.secondarySystemBackground))
            .padding(.horizontal, 30)
        }
    }
    
    private var HomeViewFreeWord: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text("フリーワード検索")
                    .foregroundColor(.primary)
                    .font(.system(size: 20, weight: .semibold, design: .default))
                    .padding(.horizontal)
                TextField("フリーワード検索", text: $text2)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(25.0)
                    .padding(.horizontal)
            }
            .padding(.horizontal, 30)
        }
    }
    
    private var HomeViewRecentSearch: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text("最近検索した履歴")
                    .foregroundColor(.primary)
                    .font(.system(size: 20, weight: .semibold, design: .default))
                    .padding(.horizontal)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0 ..< 3) { item in
                            Rectangle()
                                .frame(width: UIScreen.main.bounds.width / 1.5, height: UIScreen.main.bounds.height / 15)
                                .cornerRadius(25.0)
                                .padding(.leading)
                        }
                    }
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0 ..< 20) { item in
                            Circle()
                                .frame(width: UIScreen.main.bounds.width / 10, height: UIScreen.main.bounds.height / 10)
                                .padding(.leading)
                        }
                    }
                }
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        ForEach(0 ..< 10) { item in
                            Rectangle()
                                .frame(width: UIScreen.main.bounds.width / 1.25, height: UIScreen.main.bounds.height / 3.5)
                                .cornerRadius(10.0)
                                .padding()
                        }
                    }
                }
                
            }
            .foregroundColor(Color(.secondarySystemBackground))
            .padding()
            .padding(.horizontal, 20)
        }
    }
    
}

struct SquareView: View {
    
    let image: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .frame(width: UIScreen.main.bounds.width / 5, height: UIScreen.main.bounds.height / 10)
                .padding(.horizontal)
            Image(image)
                .resizable()
                .scaledToFit()
                .foregroundColor(.black)
                .frame(width: 50, height: 50)
        }
    }
}
