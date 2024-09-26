class Sanji : Hero{
    let hasRaidSuit: Bool
    init(){
        self.hasRaidSuit = false
        //declaring attacks

        let attack1 = Attack(name: "Flambage Shot", damage: 30)
        let attack2 = Attack(name: "Concasse", damage: 35)
        let attack3 = Attack(name: "Collier Strike", damage: 35)
        let attack4 = Attack(name: "Diable Jambe Mutton Shot", damage: 40)
        let attack5 = Attack(name: "Raid Suit Aerial Kick", damage: 60) //requires Raid Suit

        let sanjiAttacks = [attack1, attack2, attack3, attack4, attack5]
        super.init(name: "Sanji", attacks: sanjiAttacks)
    }
}