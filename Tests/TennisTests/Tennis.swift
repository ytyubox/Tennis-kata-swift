class Tennis {
    var firstPlayerScoreTime = 0,
        secondPlayerScoreTime = 0
    func score() -> String {
        let scoreLookup = [
            0: "love",
            1: "fifteen",
            2: "thirty",
            3: "forty",
        ]
        if secondPlayerScoreTime != firstPlayerScoreTime {
            return "\(scoreLookup[firstPlayerScoreTime]!) \(scoreLookup[secondPlayerScoreTime]!)"
        }
        if firstPlayerScoreTime == 1 {
            return "fifteen all"
        }
        return "love all"
    }

    func firstPlayerScore() {
        firstPlayerScoreTime += 1
    }

    func secondPlayerScore() {
        secondPlayerScoreTime += 1
    }
}
