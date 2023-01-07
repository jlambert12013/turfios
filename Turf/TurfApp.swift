//
//  TurfApp.swift
//  Turf
//
//  Created by Jim Lambert on 12/28/22.
// “The only way to do great work is to love what you do” - Steve Jobs

import FirebaseCore
import SwiftUI

final class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main struct TurfApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var session = SessionServiceImpl()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                switch session.state {
                case .loggedIn: HomeView().environmentObject(session)
                case .loggedOut: LoginView()
                }
            }
        }
    }
}

