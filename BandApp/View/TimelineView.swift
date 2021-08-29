//
//  TimelineView.swift
//  TimelineView
//
//  Created by Takumi Otsuka on 28/7/21.
//

import SwiftUI

struct TimelineView: View {
    
    // MARK: - PROPERTIES
    @State var num: Int = 0
    @State var onClicked: Bool = false
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(0..<20) { index in
                    NavigationLink(
                        destination: singlePost,
                        label: {
                            singlePost
                        })
                        .foregroundColor(.black)
                }
            }
            .navigationTitle("Timelines")
            .navigationBarHidden(true)
        }
    }
}

//  MARK: - PREVIEWS
struct TimelineView_Previews: PreviewProvider {
    static var previews: some View {
        TimelineView()
    }
}

// MARK: - EXTENSIONS and FUNCTIONS
extension TimelineView {
    
    private var timelineRow: some View {
        Rectangle()
            .frame(height: UIScreen.main.bounds.height / 3)
            .foregroundColor(.white)
            .shadow(color: .black.opacity(0.1), radius: 10, x: 0.0, y: 2.5)
    }
    
    private var timelineRowContent: some View {
        VStack {
            // First Layer
            HStack {
                NavigationLink(
                    destination: SettingsView(),
                    label: {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                    })
                VStack {
                    HStack(spacing: 40) {
                        Text("Hiroki Kishizawa")
                        Text("6th Aug 2021, 12pm")
                            .font(.footnote)
                    }
                    HStack {
                        Text("リハーサル練習")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .padding(.leading, 5)
                        Spacer()
                    }
                }
            }
            .padding()
            // Second Layer
            Text("今日はバンド練習をしてきました。")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
            // Image
            Image("school_man 1")
            HStack {
                HStack(spacing: 16) {
                    Button(action: { onClicked.toggle() }, label: {
                        Image(systemName: onClicked ? "hand.thumbsup.fill" : "hand.thumbsup")
                    })
                    Text("\(onClicked ? (num + 1) : num)")
                }
                .foregroundColor(.accentColor)
                .padding(.horizontal)
                // Search Bar
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 25.0)
                        .foregroundColor(Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)))
                        .frame(width: 200, height: 50)
                    Text("Add a comment")
                        .font(.caption)
                        .padding(.leading)
                }
            }
            .padding(.vertical)
            
            Divider()
        }
    }
    
    private var singlePost: some View {
        ZStack(alignment: .leading) {
            timelineRow
            timelineRowContent
        }
    }
    
}
