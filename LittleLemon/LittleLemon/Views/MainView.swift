//
//  MainView.swift
//  LittleLemon
//
//  Created by Alex H. on 23.12.22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            LocationView()
                .tabItem {
                    Label("Locations", systemImage: "fork.knife")
                }
            
            ReservationView(location:Location())
                .tabItem {
                    Label("Reservation", systemImage: "square.and.pencil")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
