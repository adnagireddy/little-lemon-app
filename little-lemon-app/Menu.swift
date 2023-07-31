//
//  Menu.swift
//  little-lemon-app
//
//  Created by Ananya Nagireddy on 7/27/23.
//

import SwiftUI

struct Menu: View {
    
    
    @State var startersIsEnabled = true
    @State var mainsIsEnabled = true
    @State var dessertsIsEnabled = true
    @State var drinksIsEnabled = true

    @State var searchText = ""

    @State var loaded = false

    @State var isKeyboardVisible = false
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
                
        VStack{
            
            Text("Little Lemon")
            Text("Allentown, PA")
            Text("We are a family-owned restaurant, determined to bring the flavors of India to your local eatery")
            
            TextField("Search Menu", text: $searchText)

            FetchedObjects(predicate: buildPredicate(), sortDescriptors: buildSortDescriptors()) { (dishes: [Dish]) in
                List{
                    ForEach(dishes, id: \.self) {dish in
                        VStack{
                            Text ("\(dish.title!)").font(.system(size: 16, weight: .bold))
                            
                            HStack{
                                Text("\(dish.price!)")
                                Spacer()
                                AsyncImage(url: URL(string: "\(dish.image!)"))
                            }
                        }
                        
                    }
                }
            }
            
        }.onAppear{MenuList.getMenuData(viewContext: viewContext)}
        
    }
    
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        return [NSSortDescriptor(key: "title",
                                  ascending: true,
                                  selector:
                                    #selector(NSString.localizedStandardCompare))]
    }

    func buildPredicate() -> NSCompoundPredicate {
        let search = searchText == "" ? NSPredicate(value: true) : NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        let starters = !startersIsEnabled ? NSPredicate(format: "category != %@", "starters") : NSPredicate(value: true)
        let mains = !mainsIsEnabled ? NSPredicate(format: "category != %@", "mains") : NSPredicate(value: true)
        let desserts = !dessertsIsEnabled ? NSPredicate(format: "category != %@", "desserts") : NSPredicate(value: true)
        let drinks = !drinksIsEnabled ? NSPredicate(format: "category != %@", "drinks") : NSPredicate(value: true)

        let compoundPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [search, starters, mains, desserts, drinks])
        return compoundPredicate
    }
}


struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}

