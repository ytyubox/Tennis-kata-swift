class Tennis {
    internal init(firstPlayerName: String) {
        self.firstPlayerName = firstPlayerName
    }

    var firstPlayerScoreTime = 0,
        secondPlayerScoreTime = 0
    let firstPlayerName: String

    func score() -> String {
        if isScoreDifferent() {
            if firstPlayerScoreTime > 3 {
                if firstPlayerScoreTime - secondPlayerScoreTime == 1 {
                    return "\(firstPlayerName) adv"
                }
            }
            return lookupScore()
        }
        if isDuece() {
            return duece()
        }
        return "\(scoreLookup[firstPlayerScoreTime]!) all"
    }

    func firstPlayerScore() {
        firstPlayerScoreTime += 1
    }

    func secondPlayerScore() {
        secondPlayerScoreTime += 1
    }

    func isDuece() -> Bool {
        firstPlayerScoreTime >= 3
    }

    func duece() -> String {
        "duece"
    }

    func isScoreDifferent() -> Bool {
        return secondPlayerScoreTime != firstPlayerScoreTime
    }

    let scoreLookup = [
        0: "love",
        1: "fifteen",
        2: "thirty",
        3: "forty",
    ]
    func lookupScore() -> String {
        "\(scoreLookup[firstPlayerScoreTime]!) \(scoreLookup[secondPlayerScoreTime]!)"
    }
}
