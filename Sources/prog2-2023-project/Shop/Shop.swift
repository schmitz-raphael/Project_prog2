class Shop {
    var items: [String: Int]

    init(items: [String: Int]) {
        self.items = items
    }

    func buyItem(hero: Hero) {
        print("Welcome to the shop!")
        print("Here are the buyable items:")
        var itemQuantities: [String: Int] = [:] 
        for (itemName, price) in items {
            if let quantity = itemQuantities[itemName] {
                itemQuantities[itemName] = quantity + 1
            } else {
                itemQuantities[itemName] = 1
            }
            
        }
        for (itemName, quantity) in itemQuantities {
            if quantity > 1 {
                print("\(quantity)x \(itemName) - \(items[itemName]!) berries")
            } else {
                print("\(itemName) - \(items[itemName]!) berries")
            }
        }

        print("Which item would you like to buy? (Type the exact name of the item to purchase it or -1 to exit)")

        if let itemName = readLine(), itemName != "-1" {
            if let price = items[itemName] {
                if hero.berries >= price {
                    hero.berries -= price
                    items.removeValue(forKey: itemName)
                    print("Congratulations, you have purchased \(itemName)!")
                } else {
                    print("Sorry, you don't have enough berries to buy \(itemName). Do more battles to gain Berries.")
                }
            } else {
                print("Sorry, we don't have \(itemName) in stock.")
            }
        } else {
            print("Thanks for visiting the shop!")
        }
    }
}
