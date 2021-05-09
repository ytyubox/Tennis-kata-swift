import Nimble
import Quick
import XCTest
class Tennis {
    var firstPlayerScoreTimes = 0
    func score() -> String {
        if firstPlayerScoreTimes == 1 {
            return "fifteen love"
        }
        return "love all"
    }

    func firstPlayerScore() {
        firstPlayerScoreTimes += 1
    }
}

final class TennisTests: QuickSpec {
    override func spec() {
        var tennis: Tennis!
        beforeEach {
            tennis = Tennis()
        }
        it("Should be love all") {
            expect(tennis.score()).to(equal("love all"))
        }
        it("Should be fifteen love") {
            tennis.firstPlayerScore()
            expect(tennis.score()).to(equal("fifteen love"))
        }
    }
}
