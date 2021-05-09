import Nimble
import Quick
import XCTest

// MARK: - Tennis

class Tennis {
    var firstPlayerScoreTimes = 0
    var secondPlayerScoreTimes = 0
    func score() -> String {
        let scoreLookup = [
            0: "love",
            1: "fifteen",
            2: "thirty",
            3: "forty",
        ]

        if firstPlayerScoreTimes != secondPlayerScoreTimes {
            return "\(scoreLookup[firstPlayerScoreTimes]!) \(scoreLookup[secondPlayerScoreTimes]!)"
        }
        if firstPlayerScoreTimes >= 3, secondPlayerScoreTimes >= 3 {
            return "duece"
        }
        return "\(scoreLookup[firstPlayerScoreTimes]!) all"
    }

    func firstPlayerScore() {
        firstPlayerScoreTimes += 1
    }

    func secondPlayerScore() {
        secondPlayerScoreTimes += 1
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
            givenFirstPlayerScore(1)
            scoreShouldBe("fifteen love")
        }
        it("Should be thirty love") {
            givenFirstPlayerScore(2)
            scoreShouldBe("thirty love")
        }
        it("Should be forty love") {
            givenFirstPlayerScore(3)
            scoreShouldBe("forty love")
        }
        it("Should be love fifteen") {
            givenSecondPlayerScore(1)
            scoreShouldBe("love fifteen")
        }
        it("Should be love thirty") {
            givenSecondPlayerScore(2)
            scoreShouldBe("love thirty")
        }
        it("Should be love forty") {
            givenSecondPlayerScore(3)
            scoreShouldBe("love forty")
        }
        it("Should be fifteen all") {
            givenFirstPlayerScore(1)
            givenSecondPlayerScore(1)
            scoreShouldBe("fifteen all")
        }
        it("Should be thirty all") {
            givenFirstPlayerScore(2)
            givenSecondPlayerScore(2)
            scoreShouldBe("thirty all")
        }
        it("Should be duece") {
            givenFirstPlayerScore(3)
            givenSecondPlayerScore(3)
            scoreShouldBe("duece")
        }

        func scoreShouldBe(_ score: String, file: StaticString = #filePath, line: UInt = #line) {
            expect(file: file, line: line, tennis.score()).to(equal(score))
        }
        func givenFirstPlayerScore(_ times: Int) {
            for _ in 1 ... times {
                tennis.firstPlayerScore()
            }
        }
        func givenSecondPlayerScore(_ times: Int) {
            for _ in 1 ... times {
                tennis.secondPlayerScore()
            }
        }
    }
}
