class Hero: Character {

    var name: String
    var health: Int
    var inventory : Inventory
    var attacks: [Attack] = []
    var baseAttack: Int
    var berries: Int


    init(name: String, attacks: [Attack]){
        self.name = name
        self.health = 100
        self.inventory = Inventory()
        self.attacks = attacks
        self.baseAttack = 20
        self.berries = 1000
    }
    func addAttack(attack: Attack) {
        self.attacks.append(attack)
        print("\(self.name) learned \(attack) ")
    }
    func printAttack(){
        for (index,attack) in attacks.enumerated() {
            print("\(index + 1). \(attack)")
        }
    }
}