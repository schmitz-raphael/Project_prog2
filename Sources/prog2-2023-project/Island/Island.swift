
class Island: Room{
    private (set) var minigame: Minigame?
    var blackJack: BlackJack?

    //initialising the name and the minigames and battles if there are any
    init(name: String, minigame: Minigame? = nil, hasBlackJack: Bool = false){
        self.minigame = minigame
        if (hasBlackJack){
            self.blackJack = BlackJack()
        }
        else{
            self.blackJack = nil
        }
        super.init(name: name)
    }

    //function to solve the minigame on the island
    func solve() throws -> Bool{
        if let minigame = minigame{
            if (minigame.play()){
                print("Congrats by solving this very difficult trial, and have now collected one road-porneglyph")
                self.minigame = nil
                return true
            }
            else{
                print("Unfortunately, you failed this trial")
                return false
            }
        }
        else{
            throw MinigameError.NoMinigame
        }
    }
    //function to play Black Jack
    func play(bet: Int) -> Int{
        if let blackJack = blackJack{
            
            return blackJack.play(bet: bet)
        }
        else{
            return 0
        }
    }
}