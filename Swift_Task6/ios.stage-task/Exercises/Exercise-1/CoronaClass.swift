// by Lisa

import Foundation

class CoronaClass {
 
    var seats = [Int]()
    var numberOfSeats = 0

    init(n: Int) {
        self.numberOfSeats = n
    }
     
    func seat() -> Int {
        if seats.count == 0 {
            seats.append(0)
            return 0
        }
        
        if (seats.count == 1) && (seats.first == 0) {
            seats.append(numberOfSeats - 1)
            return numberOfSeats - 1
        }
        
        if seats.count > 1 {
            var mostRemoteDistance = numberOfSeats - 1 - seats[seats.count-1]
            var indexOfSeat = numberOfSeats-1
            var i = 0
            
            repeat {
                let distance = (seats[i+1] - seats[i] ) / 2
                            
                if distance > mostRemoteDistance {
                    mostRemoteDistance = distance
                    indexOfSeat = seats[i] + distance
                }
                
                i += 1
                
            } while i <= seats.count - 2
            
            seats.append(indexOfSeat)
            seats.sort()
            return indexOfSeat
        }
        
        seats.append(0)
        seats.sort()
        return 0
    }
     
    func leave(_ p: Int) {
        guard let index = seats.firstIndex(of: p) else { return }
        seats.remove(at: index)
    }
}
