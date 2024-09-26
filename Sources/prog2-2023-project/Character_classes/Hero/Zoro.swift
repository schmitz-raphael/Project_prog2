class Zorro : Hero{
    init(){

        let attack1 = Attack(name: "One Sword Style Flying Dragon Blaze", damage: 35) // requires 1 sword 
        let attack2 = Attack(name: "One Sword Style 108 Pound Phoenix", damage: 30) // requires 1 sword 
        let attack3 = Attack(name: "Two Sword Style Gorilla Cut", damage: 40) // requires 2 swords
        let attack4 = Attack(name: "Three Sword Style Oni Giri", damage: 30) // requires 3 swords
        let attack5 = Attack(name: "Nine Sword Style Ashura Bakkai", damage: 60) // requires 3 swords, including Enma 

        let zoroAttacks = [attack1, attack2, attack3, attack4, attack5]
        super.init(name: "Zorro", attacks: zoroAttacks)
    }
}