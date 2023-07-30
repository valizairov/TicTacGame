struct Game {
    enum symbol: String {
        case x = "x", o = "o", empty = ""
    }
    var board:[[symbol]] = [[.empty,.empty,.empty],[.empty,.empty,.empty],[.empty,.empty,.empty]]
    
    enum status {
        case active, player1Won, player2Won, draw
    }
    
    var whoseTurn: Player = .Player1 // Start with Player 1

    func checkStatus() -> status {
        //check if 1 has full row, full column or full diagonal
            //return player1Won
        //check if 2 has full row, full column or full diagonal
            //return player2Won
        //check if none of them is 0
            //return draw
        //else
            return .active
    }
    
    mutating func turn(player: Player, coordinates: (Int, Int)) {
        if board[coordinates.0][coordinates.1] == .empty {
            if player == .Player1 {
                board[coordinates.0][coordinates.1] = .x
                whoseTurn = .Player2
            } else {
                board[coordinates.0][coordinates.1] = .o
                whoseTurn = .Player1
            }
            
        } else {
            // nothing happens, square is taken
        }
        
        if checkStatus() != .active {
            //Update status message with a winner name, or game over with a draw, and replace "start" button with "restart"
        }
    }

}

enum Player {
    case Player1, Player2
}
