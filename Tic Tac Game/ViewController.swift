import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBAction func startOverAction(_ sender: UIButton) {
        resetBoard()
    }
    
    @IBAction func playerMoved(_ button: UIButton) {
        var image: UIImage
        if button.tag < 10 {
            logMoveToMatrix(button.tag, player: currentTurn)
            switch currentTurn {
            case .circle:
                image = UIImage(systemName: "circle") ?? UIImage()
                currentTurn = .cross
            case .cross:
                image = UIImage(systemName: "arrow.up.left.and.down.right.and.arrow.up.right.and.down.left") ?? UIImage()
                currentTurn = .circle
            }
            button.setImage(image, for: .normal)
            button.tag += 10
            
            if let winner = checkWhoWon() {
                if winner == .circle {
                    statusLabel.text = "Winner is Player 1"
                } else {
                    statusLabel.text = "Winner is Player 2"
                }
            }
        } else {
            button.imageView?.backgroundColor = .red
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut) {
                button.imageView?.backgroundColor = .white
            }
        }
    }
    
    func resetBoard() {
        // Reset UI
        statusLabel.text = ""
        button1.imageView?.image = nil
        button2.imageView?.image = nil
        button3.imageView?.image = nil
        button4.imageView?.image = nil
        button5.imageView?.image = nil
        button6.imageView?.image = nil
        button7.imageView?.image = nil
        button8.imageView?.image = nil
        button9.imageView?.image = nil
        
        //Tags
        button1.tag = 0
        button2.tag = 1
        button3.tag = 2
        button4.tag = 3
        button5.tag = 4
        button6.tag = 5
        button7.tag = 6
        button8.tag = 7
        button9.tag = 8

        // Reset Matrix
        boardMatrix = [[0,0,0],[0,0,0],[0,0,0]]
    }
    
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
    
    func checkWhoWon() -> Player? {
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
        if let player = haveAwinner(sum) { return player }
        sum = boardMatrix[1][0] + boardMatrix[1][1] + boardMatrix[1][2]
        if let player = haveAwinner(sum) { return player }
        sum = boardMatrix[2][0] + boardMatrix[2][1] + boardMatrix[2][2]
        if let player = haveAwinner(sum) { return player }
        
        //check vertical win
        sum = boardMatrix[0][0] + boardMatrix[1][0] + boardMatrix[2][0]
        if let player = haveAwinner(sum) { return player }
        sum = boardMatrix[0][1] + boardMatrix[1][1] + boardMatrix[2][1]
        if let player = haveAwinner(sum) { return player }
        sum = boardMatrix[0][2] + boardMatrix[1][2] + boardMatrix[2][2]
        if let player = haveAwinner(sum) { return player }
        
        //check diagonal win
        sum = boardMatrix[0][0] + boardMatrix[1][1] + boardMatrix[2][2]
        if let player = haveAwinner(sum) { return player }
        sum = boardMatrix[2][0] + boardMatrix[1][1] + boardMatrix[0][2]
        if let player = haveAwinner(sum) { return player }

        return nil
    }
    
    enum Player {
        case circle
        case cross
    }
    
    var currentTurn: Player = .circle
    var boardMatrix = [[0,0,0],[0,0,0],[0,0,0]]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        resetBoard()
    }

}

