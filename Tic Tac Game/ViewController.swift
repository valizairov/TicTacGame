//
//  ViewController.swift
//  Tic Tac Game
//
//  Created by Vali Zairov on 7/28/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var statusTextField: UITextField!
    @IBOutlet weak var startResetButton: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    
    @IBAction func startResetAction(_ sender: UIButton) {
        // Start/Reset the game
    }
    
    func setupUI() {
        //setupBoard()
        //Reset all squares on UI
        //Clear status field, change Start Button to Reset
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

}

