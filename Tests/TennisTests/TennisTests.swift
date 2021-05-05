import Nimble
import Quick


final class TennisTests: QuickSpec {
    override func spec() {
        describe("Score") {
            it("Should be love all", closure: {
                let tennis = Tennis()
                expect(tennis.score()).to(be("love all"))

            })
        }
    }
}
