library(quantmod)

# Getting data from different sources
getSymbols("YHOO", src = "google")
getSymbols("GOOG", src = "yahoo")
getSymbols("DEXJPUS", src = "FRED")
getSymbols("XPT/USD", src = "oanda")

getSymbols("AAPL", src = "yahoo")
barChart(AAPL)

candleChart(AAPL, multi.col = TRUE, theme = "white")

chartSeries(XPTUSD, name = "Platinum (.oz) in $USD")
chartSeries(to.weekly(XPTUSD), up.col = "white", dn.col = "blue")

require(TTR)
chartSeries(AAPL)
addMACD()
addBBands()
