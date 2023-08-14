class ViewModel {
    
    var currentTurn: Player = .circle
    var boardMatrix = [[0,0,0],[0,0,0],[0,0,0]]

    func logMoveToMatrix(_ tag: Int, player: Player) {
        guard tag < 10, tag >= 0 else { return }
        var mark: Int
        let x = tag / 3
        let y = tag % 3
        if player == .circle {
            mark = 11
        } else {
            mark = 12
        }
        boardMatrix[x][y] = mark
    }
    
    func checkWhoWon() -> (Player?, Int) {
        var sum: Int
        
        func haveAwinner(_ sum: Int) -> Player? {
            if sum == 33 {
                return .circle
            }
            if sum == 36 {
                return .cross
            }
            return nil
        }
        
        //check horizontal win
        sum = boardMatrix[0][0] + boardMatrix[0][1] + boardMatrix[0][2]
        if let player = haveAwinner(sum) { return (player, 1) }
        sum = boardMatrix[1][0] + boardMatrix[1][1] + boardMatrix[1][2]
        if let player = haveAwinner(sum) { return (player, 2) }
        sum = boardMatrix[2][0] + boardMatrix[2][1] + boardMatrix[2][2]
        if let player = haveAwinner(sum) { return (player, 3) }
        
        //check vertical win
        sum = boardMatrix[0][0] + boardMatrix[1][0] + boardMatrix[2][0]
        if let player = haveAwinner(sum) { return (player, 4) }
        sum = boardMatrix[0][1] + boardMatrix[1][1] + boardMatrix[2][1]
        if let player = haveAwinner(sum) { return (player, 5) }
        sum = boardMatrix[0][2] + boardMatrix[1][2] + boardMatrix[2][2]
        if let player = haveAwinner(sum) { return (player, 6) }
        
        //check diagonal win
        sum = boardMatrix[0][0] + boardMatrix[1][1] + boardMatrix[2][2]
        if let player = haveAwinner(sum) { return (player, 7) }
        sum = boardMatrix[2][0] + boardMatrix[1][1] + boardMatrix[0][2]
        if let player = haveAwinner(sum) { return (player, 8) }

        return (nil, 0)
    }
}

enum Player {
    case circle
    case cross
}
