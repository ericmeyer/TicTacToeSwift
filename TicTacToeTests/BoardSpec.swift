import TicTacToe
import Quick
import Nimble

class BoardSpec: QuickSpec {

    override func spec() {
        describe("Making a move") {
            it("places a mark for X") {
                let board = Board()
                board.place(.X, at: 0)
                expect(board.tokenAt(0)).to(equal(PlayerToken.X))
            }

            it("places a mark for O") {
                let board = Board()
                board.place(.O, at: 2)
                expect(board.tokenAt(2)).to(equal(PlayerToken.O))
            }

            it("can keep track of multiple moves") {
                let board = Board()
                board.place(.X, at: 3)
                board.place(.O, at: 2)

                expect(board.tokenAt(3)).to(equal(PlayerToken.X))
            }

            it("starts with each position empty") {
                let board = Board()

                expect(board.tokenAt(3)).to(equal(PlayerToken.Empty))
            }

            it("can clear a position") {
                let board = Board()
                board.place(.X, at: 3)
                board.place(.Empty, at: 3)

                expect(board.tokenAt(3)).to(equal(PlayerToken.Empty))
            }
        }

        describe("Whether or not the board is full") {
            it("is full when all spaces are taken") {
                let board = Board()
                for position in 0...8 {
                    board.place(.X, at: position)
                }

                expect(board.isFull()).to(beTrue())
            }

            it("does not include empty spaces") {
                let board = Board()
                for position in 0...8 {
                    board.place(.X, at: position)
                }
                board.place(.Empty, at: 4)

                expect(board.isFull()).to(beFalse())
            }
        }
    }
    
}
