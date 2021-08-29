//
//  SettingsView.swift
//  SettingsView
//
//  Created by Takumi Otsuka on 28/7/21.
//

import SwiftUI

struct SettingsView: View {
    
    @State var selectedIndex = 0
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width / 2)
                        .padding(.vertical, 50)
                    Text("What's up guys? Let's enjoy our music!")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.bottom)
                    
                    Divider()
                    
                    ZStack {
                        VStack {
                            Picker("", selection: $selectedIndex) {
                                Text("Post").tag(0)
                                Text("Recruit").tag(1)
                                Text("Result").tag(2)
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            .padding(.top)
                            .padding(.horizontal)
                            
                            if selectedIndex == 0 {
                                Post()
                            } else if selectedIndex == 1 {
                                Recruit()
                            } else {
                                Result()
                            }
                            
                        }
                    }
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

struct Post: View {
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, content: {
            ForEach(0..<9) { index in
                Rectangle()
                    .frame(height: UIScreen.main.bounds.height / 7)
                    .foregroundColor(.white)
                    .border(Color.black)
            }
        })
    }
}

struct Recruit: View {
    var body: some View {
        ZStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 10) {
                Text("Ed Sheeranのメンバーを募集しています！")
                Text("やる曲数：4 ~ 5曲")
                Text("主にやりたい曲：Galway Girl")
                Text("募集人数: 4 ~ 5")
                Text("ホストからの一言：20代中心でやりたいです！")
                
                Divider()
                
                VStack(spacing: 20) {
                    Text("決まっているメンバー: 4/5")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 30) {
                            ForEach(0..<5) { index in
                                Circle()
                                    .frame(width: 70, height: 70)
                            }
                        }
                    }
                }
                
            }
            .font(.subheadline)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading)
        }
        .padding(.top)
        .padding(.horizontal, UIScreen.main.bounds.width / 20)
    }
}

struct Result: View {
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, content: {
            ForEach(0..<9) { index in
                Rectangle()
                    .frame(height: UIScreen.main.bounds.height / 7)
                    .foregroundColor(.white)
                    .border(Color.black)
            }
        })
    }
}
