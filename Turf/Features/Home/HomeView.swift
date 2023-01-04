//
//  HomeView.swift
//  Turf
//
//  Created by Jim Lambert on 1/4/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing: 16) {
            VStack(alignment: .leading,
                   spacing: 16) {
               
                Text("First Name: <Placeholder>")
                Text("Last Name: <Placeholder>")
                Text("Email: <Placeholder>")
                
                
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
