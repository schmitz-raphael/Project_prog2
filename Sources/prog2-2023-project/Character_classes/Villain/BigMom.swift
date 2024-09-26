class BigMom: Villain{
    
    init(){
        let attack1 = Attack(name: "Soul Pocus", damage: 30) //only works on enemies that are afraid of big mom
        let attack2 = Attack(name: "Zeus Thunderbolt", damage: 12)
        let attack3 = Attack(name: "Heavenly Fire", damage: 13)
        let attack4 = Attack(name: "Ryou Blast", damage: 15)
        let attack5 = Attack(name: "Conqueror's haki", damage: 0) //can knock out heros below 40% health (doesn't work on luffy)
        let attacks = [attack1, attack2, attack3, attack4, attack5]
        super.init(name: "Big Mom ", attacks: attacks)
    }
}