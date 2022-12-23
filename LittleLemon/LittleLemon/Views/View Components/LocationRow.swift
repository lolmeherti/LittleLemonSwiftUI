//
//  LocationRow.swift
//  LittleLemon
//
//  Created by Alex H. on 23.12.22.
//

import SwiftUI

struct LocationRow: View {
    
    var location:Location
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(location.city)
                HStack{
                    Text(location.detail + " - " + location.phoneNumber).font(.subheadline).foregroundColor(.gray)
                        .padding(.leading)
                }
            }
        }
    }
}

struct LocationRow_Previews: PreviewProvider {
    static var previews: some View {
        LocationRow(location: Location())
    }
}
