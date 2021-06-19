import Foundation

protocol DeckBaseCompatible: Codable {
    var cards: [Card] {get set}
    var type: DeckType {get}
    var total: Int {get}
    var trump: Suit? {get}
}

enum DeckType:Int, CaseIterable, Codable {
    case deck36 = 36
}

struct Deck: DeckBaseCompatible {

    //MARK: - Properties

    var cards = [Card]()
    var type: DeckType
    var trump: Suit?

    var total:Int {
        return type.rawValue
    }
}

extension Deck {

    init(with type: DeckType) {
        self.type = type
        self.cards = createDeck(suits: [.clubs, .spades, .hearts, .diamonds], values: [.six, .seven, .eight,.nine, .ten, .jack, .queen, .king, .ace])
        self.trump = nil
    }

    public func createDeck(suits:[Suit], values:[Value]) -> [Card] {
        var cards = [Card]()
        
        for suit in suits {
            for value in values {
                cards.append(Card(suit: suit, value: value))
            }
        }
        return cards
    }

    public mutating func shuffle() {
        self.cards.shuffle()
    }

    public mutating func defineTrump() {
        guard let trumpDEF = self.cards.last?.suit else {
            return
        }        
        self.trump = trumpDEF
        
        for i in 0...cards.count-1 {
            if cards[i].suit == trumpDEF {
                cards[i].isTrump = true
            }
        }
    }

    public mutating func initialCardsDealForPlayers(players: [Player]) {
        if (cards.count == 0) || (players.count > 6) || (players.count == 0){
            return
        }
        for i in 0...players.count-1 {
            for _ in 1...6 {
                let someCard = cards.removeLast()
                
                if players[i].hand == nil {
                        players[i].hand = [someCard]
                } else {
                    players[i].hand?.append(someCard)                    
                }
            }
        }
    }
}
