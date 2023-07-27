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
            menu.tabItem({Label("Menu",systemImage: "list.dash" )})
        } .navigationBarBackButtonHidden(true)

    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
