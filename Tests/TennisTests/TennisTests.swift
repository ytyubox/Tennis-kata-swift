import Nimble
import Quick
import XCTest
class Tennis {
    func score() -> String {
        "love all"
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
    }
}
