

class Inventory{
    var inv: [Item]

    init(){
        self.inv = []
    }

    func printInv(){
        print("Player inventory:")
        for item in inv{
            print(item)
        }
    }
    func addItem(item: Item){
        inv.append(item)
    }
    func useItem(itemName: String) -> Item?{
        for (i, item) in inv.enumerated(){
            if itemName == item.name{
                inv.remove(at: i)
                return item
            }
        }
        return nil
    }
    func countPorneglyph() -> Int{
        var count = 0
        for item in inv{
            if item is RoadPorneglyph{
                count += 1
            }
        }
        return count
    }
    func removePorneglyphs(){
        for (i, item) in inv.enumerated(){
            if item.name == "Road-Porneglyph"{
                inv.remove(at: i)
            }
        }
    }
}