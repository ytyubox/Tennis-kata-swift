class Tennis {
    var firstPlayerScoreTime = 0
    func score() -> String {
        if firstPlayerScoreTime == 1 {
            return "fifteen love"
        }
        return "love all"
    }
    func firstPlayerScore() {
        firstPlayerScoreTime += 1
    }
}
