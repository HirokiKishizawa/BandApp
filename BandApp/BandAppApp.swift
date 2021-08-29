//
//  BandAppApp.swift
//  BandApp
//
//  Created by Takumi Otsuka on 17/7/21.
//

import SwiftUI
import Firebase
import GoogleSignIn

@main
struct BandAppApp: App {
    
    init() {
        setupAuthentication()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

extension BandAppApp {
    private func setupAuthentication() {
        FirebaseApp.configure()
//        GIDSignIn.sharedInstance.clientID = FirebaseApp.app()?.options.clientID
    }
}
