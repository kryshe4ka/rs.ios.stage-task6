import Foundation

protocol PlayerBaseCompatible {
    var hand: [Card]? { get set }
}

final class Player: PlayerBaseCompatible {
    var hand: [Card]?

    func checkIfCanTossWhenAttacking(card: Card) -> Bool {
        
        guard let hand = hand else { return false }
        
        for cardInHand in hand {
            if cardInHand.value == card.value {
                return true
            }
        }
        return false
    }

    func checkIfCanTossWhenTossing(table: [Card: Card]) -> Bool {
        
        guard let hand = hand else { return false }
        
        let keys = table.keys
        let values = table.values
        
        for cardInHand in hand {
            for key in keys {
                if cardInHand.value == key.value {
                    return true
                }
            }
            for val in values {
                if cardInHand.value == val.value {
                    return true
                }
            }
        }
        return false
    }
}
