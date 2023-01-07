//
//  HomeView.swift
//  Turf
//
//  Created by Jim Lambert on 1/4/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var session: SessionServiceImpl
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 16) {
                Text("First Name: \(session.userDetails?.firstName ?? "N/A")")
                Text("Last Name: \(session.userDetails?.lastName ?? "N/A")")
                Text("Email: \(session.userDetails?.email ?? "N/A")")
            }
            ButtonView(title: "Logout") {
                session.logOut()
            }
        }.padding(.horizontal, 16).navigationTitle("Home")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView { HomeView().environmentObject(SessionServiceImpl()) }
    }
}

