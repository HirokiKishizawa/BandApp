//
//  AuthenticationViewModel.swift
//  BandApp
//
//  Created by Takumi Otsuka on 29/7/21.
//

import Foundation
import Firebase
import GoogleSignIn

class AuthenticationViewModel: NSObject, ObservableObject {
    // 1
    enum SignInState {
        case signedIn
        case signedOut
    }
    
    // 2
    @Published var state: SignInState = .signedOut
    
    // 3
    override init() {
        super.init()
        setupGoogleSignIn()
    }
    
    // 4
    func signIn() {
//        if GIDSignIn.sharedInstance().currentUser == nil {
//            GIDSignIn.sharedInstance().presentingViewController = GIDSignIn.sharedInstance().signIn()
//        }
    }
    
    // 5
    func signOut() {
        GIDSignIn.sharedInstance.signOut()
        
        do {
            try Auth.auth().signOut()
            state = .signedOut
        } catch let signOutError as NSError {
            print(signOutError.localizedDescription)
        }
    }
    
    // 6
    private func setupGoogleSignIn() {
//        GIDSignIn.sharedInstance().delegate = self
    }
}
