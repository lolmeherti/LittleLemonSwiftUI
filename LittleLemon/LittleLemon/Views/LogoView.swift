//
//  LogoView.swift
//  LittleLemon
//
//  Created by Alex H. on 23.12.22.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        VStack{
            HStack{
                Image("lemon_icon")
                    .resizable()
                    .frame(width: 100, height:100)
                
                Text("Little Lemon")
                .font(.system(.largeTitle, design: .serif))
                .bold()
                .foregroundColor(.green)
            }
            
            Capsule()
                .fill(Color("lighterGray"))
                .overlay(
                    Text("Select a location"))
                .frame(width:180, height:30)
        }
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}
