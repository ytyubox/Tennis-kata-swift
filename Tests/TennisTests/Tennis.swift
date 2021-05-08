class Tennis {
    internal init(firstPlayerName: String,
                  secondPlayerName: String)
    {
        self.firstPlayerName = firstPlayerName
        self.secondPlayerName = secondPlayerName
    }

    var firstPlayerScoreTime = 0,
        secondPlayerScoreTime = 0
    let firstPlayerName, secondPlayerName: String

    func score() -> String {
        if isScoreDifferent() {
            if firstPlayerScoreTime > 3 || secondPlayerScoreTime > 3 {
                if isAdv() {
                    return "\(advPlayer()) adv"
                }
                return "\(advPlayer()) win"
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

    fileprivate func advPlayer() -> String {
        return firstPlayerScoreTime > secondPlayerScoreTime
            ? firstPlayerName
            : secondPlayerName
    }

    fileprivate func isAdv() -> Bool {
        return abs(firstPlayerScoreTime - secondPlayerScoreTime) == 1
    }
}
