//
//  Onboarding.swift
//  little-lemon-app
//
//  Created by Ananya Nagireddy on 7/27/23.
//

import SwiftUI

// User Defaults
let kFirst = "First Name Key"
let kLast = "Last Name Key"
let kEmail = "Email Key"
let kIsLoggedIn = "Logged In Key"


struct Onboarding: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var isLoggedIn: Bool = false
   
    var body: some View {
     
        NavigationView{
            VStack{
                
                NavigationLink(destination:Home(), isActive: $isLoggedIn){
                    EmptyView()
                }
                

                
                TextField("First Name",
                          text: $firstName)
                
                TextField("Last Name", text: $lastName)
                
                TextField("Email", text: $email)
                
                Button(action:{
                    if firstName != "" && lastName != "" && email != ""{
                        UserDefaults.standard.set(firstName, forKey: kFirst)
                        UserDefaults.standard.set(lastName, forKey: kLast)
                        UserDefaults.standard.set(email, forKey: kEmail)
                        isLoggedIn = true
                        UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                        
                    }
                    
                }) {
                    Text("Register")
                }
                
            }.onAppear(perform: {
                if UserDefaults.standard.bool(forKey: kIsLoggedIn){
                    isLoggedIn = true
                }
            })
            
        }
        
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        
        Onboarding()
    }
}
