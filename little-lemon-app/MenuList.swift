//
//  MenuList.swift
//  little-lemon-app
//
//  Created by Ananya Nagireddy on 7/27/23.
//

import Foundation
import CoreData

struct menuList: Decodable{
    let menu : [menuItem]
    
    
    func getMenuData(viewContext: NSManagedObjectContext){
        PersistenceController.shared.clear()

        var url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")

        
        var urlRequest = URLRequest(url: url!)
        
        var urlSession = URLSession.shared
        
        var dataTask = urlSession.dataTask(with: urlRequest){data, response, error in
            if let data = data {
                var JSONDecoder = JSONDecoder()
                for dish in menu {
                    let newDish = Dish(context: viewContext)
                    newDish.title = dish.title
                    newDish.price = dish.price
                    newDish.image = dish.image
                }
                try? viewContext.save()
                
                var menu = try? JSONDecoder.decode(menuList.self, from: data)
            }
        }
        
        dataTask.resume()
        
    }
    
}


