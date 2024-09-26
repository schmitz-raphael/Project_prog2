
enum Suit{
    case Spades, Hearts, Diamonds, Clubs
}


enum Rank: Int{
    case Two = 2
    case Three = 3
    case Four = 4
    case Five = 5
    case Six = 6
    case Seven = 7
    case Eight = 8
    case Nine = 9
    case Ten = 10
    case Jack    
    case Queen
    case King
    case Ace

    var value: Int{
        switch self{
            case .Jack, .Queen, .King: return 10
            case .Ace: return 11
            default: return self.rawValue

        }
    }
}

struct Card {
    let rank: Rank
    let suit: Suit
    
    var description: String {
        return "\(rank) of \(suit)"
    }
}

class Deck {
    var cards = [Card]()
    
    init() {
        for suit in [Suit.Spades, Suit.Hearts, Suit.Diamonds, Suit.Clubs] {
            for rank in Rank.Two.rawValue...Rank.Ace.rawValue {
                if let cardRank = Rank(rawValue: rank) {
                    let card = Card(rank: cardRank, suit: suit)
                    cards.append(card)
                }
            }
        }
        cards.shuffle()
    }
    
    func drawCard() -> Card? {
        return cards.popLast()
    }
}

class BlackJack{
    var deck: Deck
    var playerHand: [Card]
    var dealerHand: [Card]


    init(){
        self.deck = Deck()
        self.playerHand = [Card]()
        self.dealerHand = [Card]()
    }

    func calcHandValue (deck: [Card]) -> Int{
        var sum = 0
        for card in playerHand{
            sum += card.rank.value
        }
        return sum
    }
    func printHand(hand: [Card]){
        for card in hand {
            print(card.description)
        }
    }

    func resetGame(){
        deck = Deck()
        self.playerHand = [Card]()
        self.dealerHand = [Card]()
    }

    func play(bet: Int) -> Int{
        //initialising a round
        if let playerCard1 = deck.drawCard(),
           let dealerCard1 = deck.drawCard(),
           let playerCard2 = deck.drawCard(),
           let dealerCard2 = deck.drawCard() {
            playerHand.append(playerCard1)
            playerHand.append(playerCard2)
            dealerHand.append(dealerCard1)
            dealerHand.append(dealerCard2)
        }

        // hit or stand
        while calcHandValue(deck: playerHand) < 21{
            print("Player's Hand:\n")
            printHand(hand: playerHand)
            print("Player's Hand Value: \(calcHandValue(deck: playerHand))")
            print("Hit or Stand? (h/s): ", terminator: "")
            let input = readLine()

            if let input = input{
                if input.lowercased() == "h"{
                    if let card = deck.drawCard() {
                    playerHand.append(card)
                    }
                }
                else if input.lowercased() == "s"{
                    break
                }
            }
            else{
                print("Invalid Input, please reenter")
            }
        }
        //dealer gets his cards
        while calcHandValue(deck: dealerHand) < 17 {
            if let card = deck.drawCard() {
                dealerHand.append(card)
            }
        }

        //printing the hands with values and determining who wins, resetting the deck and returning money to the player
        print("Player's Hand: \n")
        printHand(hand: playerHand)
        print("Player's Hand Value: \(calcHandValue(deck: playerHand))\n")
        print("Dealer's Hand: \n")
        printHand(hand: dealerHand)
        print("Dealer's Hand Value: \(calcHandValue(deck: dealerHand))")

         if calcHandValue(deck: playerHand) > 21 {
            print("Player busts! Dealer wins.")
            resetGame()
            return 0
        } else if calcHandValue(deck: dealerHand) > 21 {
            print("Dealer busts! Player wins.")
            resetGame()
            return bet * 2
        } else if calcHandValue(deck: playerHand) == calcHandValue(deck: dealerHand) {
            print("It's a tie!")
            resetGame()
            return bet
        } else if calcHandValue(deck: playerHand) > calcHandValue(deck: dealerHand){
            print("Player wins!")
            resetGame()
            return bet * 2
        } else {
            print("Dealer wins!")
            resetGame()
            return 0
        }
    }
}