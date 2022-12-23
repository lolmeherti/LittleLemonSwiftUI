//
//  Location.swift
//  LittleLemon
//
//  Created by Alex H. on 23.12.22.
//

import Foundation

struct Location: Identifiable
{
    var id:UUID = UUID()
    var city:String = ""
    var detail:String = ""
    var phoneNumber:String = ""
    
    func getLocations() -> [Location]
    {
        var locations:[Location] = []
        
        locations.append(Location(city: "Las Vegas", detail: "Downtown", phoneNumber: "(702) 555-9898"))
        locations.append(Location(city: "Los Angeles", detail: "North Hollywood", phoneNumber: "(213) 555-1453"))
        locations.append(Location(city: "Los Angeles", detail: "Venice", phoneNumber: "(310) 555-1222"))
        locations.append(Location(city: "Nevada", detail: "Venice", phoneNumber: "(725) 555-5454"))
        locations.append(Location(city: "San Francisco", detail: "North Beach", phoneNumber: "(415) 555-1345"))
        locations.append(Location(city: "San Francisco", detail: "Union Square", phoneNumber: "(415) 555-9813"))
        
        return locations
    }
}


