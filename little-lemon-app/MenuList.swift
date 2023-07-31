//
//  MenuList.swift
//  little-lemon-app
//
//  Created by Ananya Nagireddy on 7/27/23.
//

import Foundation
import CoreData

struct MenuList: Decodable{
    let menu : [menuItem]
    
    enum myKeys: String, CodingKey{
        case menu = "menu"
    }
    
    static func getMenuData(viewContext: NSManagedObjectContext){
        PersistenceController.shared.clear()

        let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")

        
        let urlRequest = URLRequest(url: url!)
        
        let urlSession = URLSession.shared
        
        let dataTask = urlSession.dataTask(with: urlRequest){data, response, error in
            if let data = data {
                let JSONDecoder = JSONDecoder()
                if let entireMenu = try? JSONDecoder.decode(MenuList.self, from: data) {
                    for dish in entireMenu.menu {
                        let newDish = Dish(context: viewContext)
                        newDish.title = dish.title
                        newDish.price = dish.price
                        newDish.image = dish.image
                    }
                    try? viewContext.save()
                } else {
                    print("fail entireMenu")
                }
            } else {
                print("fail data")
            }
        }
        
        dataTask.resume()
        
    }
    
}


