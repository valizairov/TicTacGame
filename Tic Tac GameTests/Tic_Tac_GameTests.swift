//
//  Tic_Tac_GameTests.swift
//  Tic Tac GameTests
//
//  Created by Vali Zairov on 7/28/23.
//

import XCTest
@testable import Tic_Tac_Game

class Tic_Tac_GameTests: XCTestCase {

    var viewModel = ViewModel()
    
    func testLogMoveToMatrix() throws {
        //log correct moves
        viewModel.logMoveToMatrix(0, player: .circle)
        XCTAssertEqual(viewModel.boardMatrix, [[11, 0, 0], [0, 0, 0], [0, 0, 0]])
        viewModel.logMoveToMatrix(5, player: .cross)
        XCTAssertEqual(viewModel.boardMatrix, [[11, 0, 0], [0, 0, 12], [0, 0, 0]])
        viewModel.logMoveToMatrix(6, player: .circle)
        XCTAssertEqual(viewModel.boardMatrix, [[11, 0, 0], [0, 0, 12], [11, 0, 0]])
        print(viewModel.boardMatrix)

        //log incorrect moves
        viewModel.boardMatrix = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
        viewModel.logMoveToMatrix(-1, player: .cross)
        viewModel.logMoveToMatrix(9, player: .cross)
        XCTAssertEqual(viewModel.boardMatrix, [[0, 0, 0], [0, 0, 0], [0, 0, 0]])
    }

    func testCheckWhoWon() throws {
        //Nobody won
        viewModel.boardMatrix = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
        XCTAssertEqual(viewModel.checkWhoWon().0, nil)

        viewModel.boardMatrix = [[11, 0, 0], [11, 0, 0], [12, 0, 0]]
        XCTAssertEqual(viewModel.checkWhoWon().0, nil)
        
        //Someone won
        viewModel.boardMatrix = [[11, 0, 0], [11, 0, 0], [11, 0, 0]]
        XCTAssertEqual(viewModel.checkWhoWon().0, .circle)
        XCTAssertEqual(viewModel.checkWhoWon().1, 4)

        viewModel.boardMatrix = [[0, 12, 0], [0, 12, 0], [0, 12, 0]]
        XCTAssertEqual(viewModel.checkWhoWon().0, .cross)
        XCTAssertEqual(viewModel.checkWhoWon().1, 5)

        viewModel.boardMatrix = [[11, 0, 0], [0, 11, 0], [0, 0, 11]]
        XCTAssertEqual(viewModel.checkWhoWon().0, .circle)
        XCTAssertEqual(viewModel.checkWhoWon().1, 7)

    }

}
