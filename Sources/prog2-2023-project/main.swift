import Foundation

/*
    ->Fishman Island ------> Dressrosa <------> Zou <-----------------> Land of Wano
            |                                  |                          |
            |                                  |                          |
            |                                  |                          |
            Laugh Tale                   Whole cake island <---------->  Elbaf  ----> Fishman Island
*/ 

class OnePiece:Game{
    
    lazy var controller = Controller(game: self)

    lazy var parser = Parser(controller: self.controller)


    var character: Hero?
    var berries: Int = 1000
    var finished = false

    var rooms: [Room]

    var currentRoom: Room{
        didSet{
            print(currentRoom)
        }
    }
    var porneglyphCounter: Int

    init(){
        self.rooms = OnePiece.createMap()
        self.currentRoom = self.rooms.first!
        self.porneglyphCounter = 0
        self.addCommands()
    }

    private class func createMap() -> [Room]{
        //initalise minigames
        let rockPaperScissors = RockPaperScissors()
        let ticTacToe = TicTacToe()

        let fishmanIsland = Island(name:"Fishman Island")
        let dressrosa = Island(name: "Dressrosa", hasBlackJack: true)
        let zou = Island(name: "Zou", minigame: rockPaperScissors)
        let wholeCakeIsland = Island(name:"Whole Cake Island")
        let landOfWano = Island(name: "Land of Wano")
        let elbaf = Island(name: "Elbaf", minigame: ticTacToe)
        
        //Adjusting the exits of all the islands
        fishmanIsland.exits = [.East: dressrosa]
        dressrosa.exits = [.East: zou]
        zou.exits = [.East: landOfWano, .South: wholeCakeIsland, .West: dressrosa]
        wholeCakeIsland.exits = [.East: elbaf, .North: zou]
        landOfWano.exits = [.South: elbaf, .West: zou]
        elbaf.exits = [.West: wholeCakeIsland, .North: landOfWano, .East:fishmanIsland]

        //adding descriptions for the user to further understand the politics and history of the island
        return [fishmanIsland, dressrosa, zou, wholeCakeIsland, landOfWano, elbaf]
    }
    private func addCommands(){
        self.controller.register(keyword: "help", command: HelpCommand())
        self.controller.register(keyword: "sail", command: SailCommand())
        self.controller.register(keyword: "stop", command: StopCommand())
        self.controller.register(keyword: "solve", command: SolveCommand())
        self.controller.register(keyword: "play", command: PlayCommand())
    }
    private func createCharacter(args: String) throws -> Hero{
        if (args == "Vinsmoke Sanji"){
            return Sanji()
        }
        else if (args == "Roronoa Zorro"){
            return Zorro()
        }
        else if (args == "Monkey D. Luffy"){
            return Luffy()
        }
        else{
            throw CharacterCreationError.CharacterDoesNotExist
        }
    }
     private func intro() {
        //the game starts off with the legend that started everything
        print("Wealth, fame, power. The world had it all won by one man: the Pirate King, Gold Roger.")
        print("At his death, the words he spoke drove countless men out to sea.") 
        print("My treasure? It's yours if you want it. Find it! I left all the world has there!")
        print("And so men set sights on the Grand Line, in pursuit of their dreams.")
        print()
        //character selection
        print("You, the player take the role of one of the Straw hat pirates, a rising pirate crew in the pursuit of the legendary treasure")
        print("You have the choice between playing as\n1. Monkey D. Luffy, the always hungry captain of the crew")
        print("2. Roronoa Zorro, the swordsman of the ship with a very bad sense of direction")
        print("3. Vinsmoke Sanji, the cook of the ship who loses his entire composure when it comes to women")
        print("Enter the full name of the character which you want to play: ", terminator: "")
        while self.character == nil{
            let txt = readLine()!
            do{
                self.character =  try createCharacter(args: txt)
                print("You've chosen to play as \(txt)")
                break
            }catch CharacterCreationError.CharacterDoesNotExist{
                print("Please enter the name of a playable character named above")
            }catch{
                print("Unknown Error: \(error)")
            }
        }



        print("Your journey starts on Fishman Island, the first island of the 2nd half of the Grand Line, called the New World.")
    }
    private func outro() {
        print("By reaching the secret island Laugh Tale and obtaining the legendary treasure the One Piece, Monkey D. Luffy arises to the title of Pirate King and who knows what he's up to in the future")
    }

    //play function
    func play() {
        intro()
        while !self.finished {
            print("\n\(self.currentRoom)\n")
            
            do {
                try parser.readCommand()
            } catch ParserError.noInputGiven {
                print("No input given")
            } catch CommandError.commandNotFound(let keyword) {
                print("No command found for keyword '\(keyword)'")
            } catch {
                print("Unexpected error: \(error)")
            }

            if (self.currentRoom.name == "Zou"){
            }
            if (porneglyphCounter == 2){
                let laughTale = Room(name: "Laugh Tale")
                rooms.append(laughTale)
                rooms[0].exits = [.East: rooms[1], .South: laughTale]
                print("By acquiring the 4 Road-Porneglyphes, the location of the secret island has been revealed and it seems as though you were already very close at the start.")
                porneglyphCounter = 0
            }
            if (self.currentRoom.name == "Laugh Tale"){
                outro()
                self.finished = true
            }
        }
    }
}
let g = OnePiece()
g.play()

