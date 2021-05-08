public class Tennis {
    public init(firstPlayerName: String,
                secondPlayerName: String)
    {
        self.firstPlayerName = firstPlayerName
        self.secondPlayerName = secondPlayerName
    }

    private var firstPlayerScoreTime = 0,
                secondPlayerScoreTime = 0
    private let firstPlayerName, secondPlayerName: String

    public func score() -> String {
        isScoreDifferent()
            ? isReadyForGamePoint()
                ? advState()
                : lookupScore()
            : isDuece()
                ? duece()
                : sameScore()
    }

    public func firstPlayerScore() {
        firstPlayerScoreTime += 1
    }

    public func secondPlayerScore() {
        secondPlayerScoreTime += 1
    }

    private func isDuece() -> Bool {
        firstPlayerScoreTime >= 3
    }

    private func sameScore() -> String {
        "\(scoreLookup[firstPlayerScoreTime]!) all"
    }

    private func duece() -> String {
        "duece"
    }

    private func isScoreDifferent() -> Bool {
        return secondPlayerScoreTime != firstPlayerScoreTime
    }

    private let scoreLookup = [
        0: "love",
        1: "fifteen",
        2: "thirty",
        3: "forty",
    ]
    private func lookupScore() -> String {
        "\(scoreLookup[firstPlayerScoreTime]!) \(scoreLookup[secondPlayerScoreTime]!)"
    }

    private func advPlayer() -> String {
        return firstPlayerScoreTime > secondPlayerScoreTime
            ? firstPlayerName
            : secondPlayerName
    }

    private func isAdv() -> Bool {
        return abs(firstPlayerScoreTime - secondPlayerScoreTime) == 1
    }

    private func advScore() -> String {
        "\(advPlayer()) adv"
    }

    private func winScore() -> String {
        "\(advPlayer()) win"
    }

    private func isReadyForGamePoint() -> Bool {
        return firstPlayerScoreTime > 3 || secondPlayerScoreTime > 3
    }

    private func advState() -> String {
        if isAdv() {
            return advScore()
        }
        return winScore()
    }
}
