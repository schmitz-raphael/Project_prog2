class Villain: Character {
    var name: String
    var health: Int    
    var attacks: [Attack] = []

    init(name: String, attacks: [Attack]){
        self.name = name
        self.health = 250
        self.attacks = attacks
        
    }
    func nextAttack() -> Attack?{
        guard !attacks.isEmpty else {
            return nil
        }
        
        let randomIndex = Int.random(in: 0..<attacks.count)
        let attack = attacks[randomIndex]
        
        return attack
    }
}