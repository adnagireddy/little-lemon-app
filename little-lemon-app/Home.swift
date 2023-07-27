//
//  Home.swift
//  little-lemon-app
//
//  Created by Ananya Nagireddy on 7/27/23.
//

import SwiftUI

struct Home: View {
    var body: some View {
        TabView(){
            let menu = Menu()
            let userProfile = UserProfile()
            menu.tabItem({Label("Menu",systemImage: "list.dash" )})
            userProfile.tabItem({Label("User Profile",systemImage: "square.and.pencil" )})
            
            
        } .navigationBarBackButtonHidden(true)

    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
