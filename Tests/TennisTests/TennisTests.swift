import Nimble
import Quick

final class TennisTests: QuickSpec {
    override func spec() {
        describe("Score") {
            var tennis = Tennis()
            beforeEach {
                tennis = Tennis()
            }
            func scrollShouldBe(_ score: String, file: StaticString = #filePath, line: UInt = #line) {
                expect(file: file, line: line, tennis.score()).to(equal(score))
            }
            func givenFirstFirstPlayerScoreTimes(_ times: Int) {
                for _ in 1 ... times {
                    tennis.firstPlayerScore()
                }
            }
            it("Should be love all") {
                scrollShouldBe("love all")
            }
            it("Should be fifteen love") {
                givenFirstFirstPlayerScoreTimes(1)
                scrollShouldBe("fifteen love")
            }

            it("Should be thirty love") {
                givenFirstFirstPlayerScoreTimes(2)
                scrollShouldBe("thirty love")
            }
        }
    }
}
