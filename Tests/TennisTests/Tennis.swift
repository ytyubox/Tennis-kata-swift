class Tennis {
    var firstPlayerScoreTime = 0
    func score() -> String {
        let scoreLookup = [
            1: "fifteen",
            2: "thirty",
        ]
        if firstPlayerScoreTime == 1 || firstPlayerScoreTime == 2 {
            return "\(scoreLookup[firstPlayerScoreTime]!) love"
        }

        return "love all"
    }

    func firstPlayerScore() {
        firstPlayerScoreTime += 1
    }
}
