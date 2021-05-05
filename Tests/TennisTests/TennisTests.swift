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
            it("Should be love all") {
                scrollShouldBe("love all")
            }
            it("Should be fifteen love") {
                tennis.firstPlayerScore()
                scrollShouldBe("fifteen love")
            }

            it("Should be thirty love") {
                tennis.firstPlayerScore()
                tennis.firstPlayerScore()
                scrollShouldBe("thirty love")
            }
        }
    }
}
