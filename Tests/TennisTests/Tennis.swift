class Tennis {
    var firstPlayerScoreTime = 0,
        secondPlayerScoreTime = 0
    func score() -> String {
        let scoreLookup = [
            1: "fifteen",
            2: "thirty",
            3: "forty",
        ]
        if secondPlayerScoreTime == 1 {
            return "love fifteen"
        }
        if secondPlayerScoreTime == 2 {
            return "love thirty"
        }
        if firstPlayerScoreTime > 0 {
            return "\(scoreLookup[firstPlayerScoreTime]!) love"
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
