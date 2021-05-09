import Nimble
import Quick
import XCTest

// MARK: - Tennis

class Tennis {
    var firstPlayerScoreTimes = 0
    func score() -> String {
        let scoreLookup = [
            1: "fifteen",
            2: "thirty",
            3: "forty",
        ]
        if (1 ... 3).contains(firstPlayerScoreTimes) {
            return "\(scoreLookup[firstPlayerScoreTimes]!) love"
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
            givenFirstScore(1)
            expect(tennis.score()).to(equal("fifteen love"))
        }
        it("Should be thirty love") {
            givenFirstScore(2)
            expect(tennis.score()).to(equal("thirty love"))
        }
        it("Should be forty love") {
            givenFirstScore(3)
            expect(tennis.score()).to(equal("forty love"))
        }
        func scoreShouldBe(_ score: String, file: StaticString = #filePath, line: UInt = #line) {
            expect(file: file, line: line, tennis.score()).to(equal(score))
        }
        func givenFirstScore(_ times: Int) {
            for _ in 1 ... times {
                tennis.firstPlayerScore()
            }
        }
    }
}
