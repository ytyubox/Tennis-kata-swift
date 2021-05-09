import Nimble
import Quick
import XCTest

// MARK: - Tennis

class Tennis {
    var firstPlayerScoreTimes = 0
    var secondPlayerScoreTimes = 0
    func score() -> String {
        let scoreLookup = [
            1: "fifteen",
            2: "thirty",
            3: "forty",
        ]

        if (1 ... 3).contains(firstPlayerScoreTimes) {
            return "\(scoreLookup[firstPlayerScoreTimes]!) love"
        }
        if (1 ... 3).contains(secondPlayerScoreTimes) {
            return "love \(scoreLookup[secondPlayerScoreTimes]!)"
        }
        return "love all"
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
            expect(tennis.score()).to(equal("fifteen love"))
        }
        it("Should be thirty love") {
            givenFirstPlayerScore(2)
            expect(tennis.score()).to(equal("thirty love"))
        }
        it("Should be forty love") {
            givenFirstPlayerScore(3)
            expect(tennis.score()).to(equal("forty love"))
        }
        it("Should be love fifteen") {
            givenSecondPlayerScore(1)
            expect(tennis.score()).to(equal("love fifteen"))
        }
        it("Should be love thirty") {
            givenSecondPlayerScore(2)
            expect(tennis.score()).to(equal("love thirty"))
        }
        it("Should be love forty") {
            givenSecondPlayerScore(3)
            expect(tennis.score()).to(equal("love forty"))
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
