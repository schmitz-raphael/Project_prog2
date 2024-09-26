struct HeroAttacks: CustomStringConvertible {
    let name: String
    let damage: Int
    let stamina: Int

    
    var description: String {
        return "\(name) (damage: \(damage), SP: \(stamina))"
    }
}