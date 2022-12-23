//
//  LocationView.swift
//  LittleLemon
//
//  Created by Alex H. on 23.12.22.
//

import SwiftUI

struct LocationView: View {
    
    var locations:[Location] = Location().getLocations()
    
    var body: some View {
        NavigationView {
            VStack{
                LogoView()
                
                List(locations) { location in
                    NavigationLink(destination:
                                    ReservationView(location: location)) {
                            LocationRow(location: location)
                        }
                }
                .listStyle(.plain)
                .frame(width: UIScreen.main.bounds.width - 10)
            }
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}
