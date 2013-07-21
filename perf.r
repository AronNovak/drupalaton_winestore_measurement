files <- list.files(path=".", pattern="*dat")

# series <- c()

for (file in files) {
  data <- read.delim(file)
  if (exists('series')) {
    series <- rbind(data, series)
  }
  else {
    series <- data
  }
}

attach(series)
ordered_series <- series[order(seconds),]

ordered_series

png('perf.png')
plot(ordered_series[-1 * length(ordered_series),5])
dev.off()
