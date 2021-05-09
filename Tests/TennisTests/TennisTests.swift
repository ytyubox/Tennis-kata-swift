import Nimble
import Quick
import XCTest

// MARK: - Tennis

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

// MARK: - TennisTests

final class TennisTests: QuickSpec {
    override func spec() {
        var tennis: Tennis!
        beforeEach {
            tennis = Tennis()
        }
        it("Should be love all") {
            scoreShouldBe("love all")
        }
        it("Should be fifteen love") {
            tennis.firstPlayerScore()
            expect(tennis.score()).to(equal("fifteen love"))
        }
        func scoreShouldBe(_ score: String, file: StaticString = #filePath, line: UInt = #line) {
            expect(file: file, line: line, tennis.score()).to(equal(score))
        }
    }
}
