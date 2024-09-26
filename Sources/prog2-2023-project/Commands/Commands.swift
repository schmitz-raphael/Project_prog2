

//this command is used whenever there's a minigame on an island
class SolveCommand: Command{

    func run(game: Game, arguments: [String]) {
        let onePiece = game as! OnePiece
        let currentIsland = onePiece.currentRoom as! Island
        
        do{
            let solved = try currentIsland.solve()
            if solved{
                onePiece.character!.inventory.addItem(item: RoadPorneglyph())
            }
        }
        catch MinigameError.NoMinigame{
            print("There's no minigame on the island")
        }
        catch{
            print("Unexpected error \(error)")
        }
    }
}
class PlayCommand: Command{
    func run(game: Game, arguments: [String]) {
        let onePiece = game as! OnePiece
        let currentIsland = onePiece.currentRoom as! Island
            

        if currentIsland.blackJack != nil{
            print("Welcome to the \(currentIsland.name) BlackJack table. \nIf you want to stop playing just enter -1 for the bet.")
            var bet: Int = 0
            while bet != -1{
                print("Enter your bet (you have \(onePiece.berries)): ", terminator: "")
                bet = Int(readLine()!)!
                if (onePiece.berries >= bet){
                    onePiece.berries -= bet
                    onePiece.berries += currentIsland.play(bet: bet)
                    
                }
                else{
                    print("You don't have enough berries.")
                }
            }
        }
        else{
            print("There's no BlackJack table on this island. Please visit Dressrosa if you want to play")
        }
    }
}

class FightCommand: Command{

    func run(game: Game, arguments: [String]) {
        let onePiece = game as! OnePiece
        let currentIsland = onePiece.currentRoom as! Island
        
        do{
            let won = try currentIsland.fight(character: onePiece.character!)
            if won{
                onePiece.character!.inventory.addItem(item: RoadPorneglyph())
    
            }
            else{
                onePiece.badEnding()
            }
        }
        catch BattleError.noBattle{
            print("We know that you want to fight, but look elsewhere. ")
        }
        catch{
            print("Unexpected error \(error)")
        }
    }
}


class CookCommand: Command{
    func run(game: Game, arguments: [String]) {
        let onePiece = game as! OnePiece
        if let character = onePiece.character{
            if character is Sanji{
                character.inventory.addItem(item: Food(value: 20, name: "Meat"))
            }
            if character is Zorro{
                print("Zorro got lost on his way to the kitchen!")
            }
            if character is Luffy{
                onePiece.secretEnding()
            }
        }
    }
}
class RestCommand: Command{
    func run(game: Game, arguments: [String]) {
        let onePiece = game as! OnePiece
        if let character = onePiece.character{
            character.health = 100
            print("Your character is well rested now and can get back to combat again")
        }
    }

    
}


