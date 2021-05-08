import Nimble
import Quick

final class TennisTests: QuickSpec {
    override func spec() {
        describe("Score") {
            var tennis: Tennis!
            beforeEach {
                tennis = Tennis(firstPlayerName: "YU", secondPlayerName: "Tom")
            }

            it("Should be love all") {
                scoreShouldBe("love all")
            }
            it("Should be fifteen love") {
                givenFirstFirstPlayerScoreTimes(1)
                scoreShouldBe("fifteen love")
            }

            it("Should be thirty love") {
                givenFirstFirstPlayerScoreTimes(2)
                scoreShouldBe("thirty love")
            }
            it("Should be forty love") {
                givenFirstFirstPlayerScoreTimes(3)
                scoreShouldBe("forty love")
            }
            it("Should be love fifteen") {
                givenSecondPlayerScoreTimes(1)
                scoreShouldBe("love fifteen")
            }
            it("Should be love thirty") {
                givenSecondPlayerScoreTimes(2)
                scoreShouldBe("love thirty")
            }
            it("Should be love forty") {
                givenSecondPlayerScoreTimes(3)
                scoreShouldBe("love forty")
            }
            it("Should be fifteen all") {
                givenFirstFirstPlayerScoreTimes(1)
                givenSecondPlayerScoreTimes(1)
                scoreShouldBe("fifteen all")
            }
            it("Should be thirty all") {
                givenFirstFirstPlayerScoreTimes(2)
                givenSecondPlayerScoreTimes(2)
                scoreShouldBe("thirty all")
            }
            it("Should be duece") {
                givenDuece()
                scoreShouldBe("duece")
            }
            it("should be first player adv") {
                givenDuece()
                givenFirstFirstPlayerScoreTimes(1)
                scoreShouldBe("YU adv")
            }
            it("should be second player adv") {
                givenDuece()
                givenSecondPlayerScoreTimes(1)
                scoreShouldBe("Tom adv")
            }
            it("should be second player win") {
                givenDuece()
                givenSecondPlayerScoreTimes(2)
                scoreShouldBe("Tom win")
            }
            func scoreShouldBe(_ score: String, file: StaticString = #filePath, line: UInt = #line) {
                expect(file: file, line: line, tennis.score()).to(equal(score))
            }
            func givenFirstFirstPlayerScoreTimes(_ times: Int) {
                for _ in 1 ... times {
                    tennis.firstPlayerScore()
                }
            }
            func givenSecondPlayerScoreTimes(_ times: Int) {
                for _ in 1 ... times {
                    tennis.secondPlayerScore()
                }
            }
            func givenDuece() {
                givenFirstFirstPlayerScoreTimes(3)
                givenSecondPlayerScoreTimes(3)
            }
        }
    }
}
