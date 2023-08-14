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
    @IBOutlet weak var winLineImage: UIImageView!
    
    @IBAction func startOverAction(_ sender: UIButton) {
        resetBoard()
    }
    
    @IBAction func playerMoved(_ button: UIButton) {
        var image: UIImage
        if button.tag < 10 {
            viewModel.logMoveToMatrix(button.tag, player: viewModel.currentTurn)
            switch viewModel.currentTurn {
            case .circle:
                image = UIImage(systemName: "circle") ?? UIImage()
                viewModel.currentTurn = .cross
            case .cross:
                image = UIImage(systemName: "arrow.up.left.and.down.right.and.arrow.up.right.and.down.left") ?? UIImage()
                viewModel.currentTurn = .circle
            }
            button.setImage(image, for: .normal)
            button.tag += 10
            
            if let winner = viewModel.checkWhoWon().0 {
                drawWinningLine(viewModel.checkWhoWon().1)
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
    
    var viewModel = ViewModel()
    
    func drawWinningLine(_ line: Int) {
        winLineImage.isHidden = false
        switch line {
        case 1:
            winLineImage.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/4))
            winLineImage.center.y -= 80
        case 2:
            winLineImage.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/4))
        case 3:
            winLineImage.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/4))
            winLineImage.center.y += 80
        case 4:
            winLineImage.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/4)*3.0)
            winLineImage.center.x -= 80
        case 5:
            winLineImage.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/4)*3.0)
        case 6:
            winLineImage.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/4)*3.0)
            winLineImage.center.x += 85
        case 7:
            winLineImage.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/2))
        default: //8th diagonal
            winLineImage.transform = CGAffineTransform(rotationAngle: 0)
        }
        
        //disble buttons
        button1.isEnabled = false
        button2.isEnabled = false
        button3.isEnabled = false
        button4.isEnabled = false
        button5.isEnabled = false
        button6.isEnabled = false
        button7.isEnabled = false
        button8.isEnabled = false
        button9.isEnabled = false
        
        //animate winning line
        self.winLineImage.alpha = 0
        UIView.animate(withDuration: 0.5) {
            self.winLineImage.alpha = 1
        }
    }
    
    func resetBoard() {
        // Reset UI
        statusLabel.text = ""
        winLineImage.isHidden = true
        winLineImage.center.x = 149.0
        winLineImage.center.y = 150.5
        
        button1.isEnabled = true
        button2.isEnabled = true
        button3.isEnabled = true
        button4.isEnabled = true
        button5.isEnabled = true
        button6.isEnabled = true
        button7.isEnabled = true
        button8.isEnabled = true
        button9.isEnabled = true
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
        viewModel.boardMatrix = [[0,0,0],[0,0,0],[0,0,0]]
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        resetBoard()
    }

}

