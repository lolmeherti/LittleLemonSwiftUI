//
//  ReservationView.swift
//  LittleLemon
//
//  Created by Alex H. on 23.12.22.
//

import SwiftUI

struct ReservationView: View {
    
    let location:Location
    @State var party:Int = 1
    @State var dateTime = Date.now
    @State var name:String = ""
    @State var phoneNumber:String = ""
    @State var email:String = ""
    @State var optionalRequest:String = ""
    
    //ERROR DISPLAY VAR
    @State private var showingAlert = false
    
    //ERROR VARS
    @State var nameError = ""
    @State var phoneError = ""
    @State var emailError = ""
    
    
    
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Text(location.detail + " - " + location.phoneNumber).font(.subheadline).foregroundColor(.gray)
                        .padding(.leading)
                    Spacer()
                }
                
                List{
                    HStack{
                        VStack(alignment: .leading){
                            Text("Party: \(party)")
                            Stepper("",
                                    value:$party,
                                    in:1...30,
                                    step: 1
                            )
                            .labelsHidden()
                        }
                        VStack{
                            Text(" ")
                                DatePicker("", selection: $dateTime)
                                    .labelsHidden()
                        }
                    }
                    
                    Group{
                        VStack {
                            HStack{
                                Text("NAME:")
                                TextField("Your name...", text:$name)
                            }
                        }
                        
                        VStack{
                            HStack{
                                Text("PHONE:")
                                TextField("Your phone number...", text: $phoneNumber)
                            }
                        }

                        VStack{
                            HStack{
                                Text("E-MAIL:")
                                TextField("Your e-mail...", text: $email)
                            }
                        }
                        
                        HStack(){
                            Spacer()
                            TextField("add any special request (optional)", text:$optionalRequest)
                                .padding()
                                .frame(width:300)
                                .background(RoundedRectangle(cornerRadius: 24).stroke()).opacity(0.50)
                            Spacer()
                        }
                    }
                    
                    Button(action: {
                        
                        //VALIDATE INPUTS
                        
                        //NAME ERROR
                        if(name.count < 3){
                            nameError = "Names can only contain letters and must have at least 3 characters"
                            showingAlert = true
                        }
                        
                        //PHONE ERROR
                        if(phoneNumber.count < 1){
                            phoneError = "The phone number cannot be blank."
                            showingAlert = true
                        }
                        
                        //EMAIL ERROR
                        if(!isValidEmail(email) || email.count < 1){
                            emailError = "The e-mail is invalid and cannot be blank."
                            showingAlert = true
                        }
                        
                    }) {
                        Text("CONFIRM RESERVATION")
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .font(.system(size: 18))
                            .padding()
                            .foregroundColor(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.white, lineWidth: 2)
                        )
                    }
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text("Error"),
                              message: Text("""
                                            Found these errors in the form:
                                            
                                            \(nameError)
                                            
                                            \(phoneError)
                                            
                                            \(emailError)
                                            """),
                              dismissButton: .default(Text("Got it!"),action:{
                            self.emailError = ""
                            self.phoneError = ""
                            self.nameError = ""
                        }))
                    }
                    .background(Color.blue) // If you have this
                    .cornerRadius(25)
                    
                }
                .listStyle(.plain)
                .navigationTitle(Text(location.city))
            }
        }
    }
}

struct ReservationView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationView(location:Location(city: "Las Vegas", detail: "Downtown", phoneNumber: "(702) 555-9898"))
    }
}
