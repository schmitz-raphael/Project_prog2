
enum Choice: String{
    case Rock = "Rock", Paper = "Paper", Scissors = "Scissors"
}

class RockPaperScissors: Minigame{
    var strongAgainst : [Choice: Choice] = [:]

    init(){
        self.strongAgainst[.Rock] = .Scissors
        self.strongAgainst[.Scissors] = .Paper
        self.strongAgainst[.Paper] = .Rock
    }
    func play() -> Bool {
        var winCounter: Int = 0
        var loseCounter: Int = 0
        while (winCounter != 3 && loseCounter != 3){
            print("What do you want to play (Rock-Paper-Scissors): ", terminator: "")
            let text = readLine()
            let choice = Choice(rawValue: text!)

            if let choice = choice{
                let opponentChoice = strongAgainst.values.randomElement()!

                if strongAgainst[choice] == opponentChoice{
                    winCounter += 1
                    print("The opponent chose \(opponentChoice), congrats you won this one")
                }
                else if (choice == opponentChoice){
                    print("The opponent chose \(opponentChoice), the round will be reset")
                }
                else{
                    print("The opponent chose \(opponentChoice), you lose")
                    loseCounter += 1
                }
            }
            print("Score: \(winCounter) - \(loseCounter)")
        }
        if winCounter == 3{
            return true
        }
        else{
            return false
        }
    }
}