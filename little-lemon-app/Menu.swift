//
//  Menu.swift
//  little-lemon-app
//
//  Created by Ananya Nagireddy on 7/27/23.
//

import SwiftUI

struct Menu: View {
    var body: some View {
        VStack{
            
            Text("Little Lemon")
            Text("Allentown, PA")
            Text("We are a family-owned restaurant, determined to bring the flavors of India to your local eatery")
            List{
                
            }
        }

    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
