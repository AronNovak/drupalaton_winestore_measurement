# Visualizes multiple ApacheBench output files in one chart.
#
# Drupalaton 2013

# TODO(aaron): Achieve full conformance to
# http://google-styleguide.googlecode.com/svn/trunk/Rguide.xml

# Looping through the data files and read all the values.
files <- list.files(path=".", pattern="*dat")

for (file in files) {
  data <- read.delim(file)
  if (exists('series')) {
    series <- rbind(data, series)
  }
  else {
    series <- data
  }
}

# Orders it chronologically.
attach(series)
ordered_series <- series[order(seconds),]

# Opens the output image.
png(
  paste('perf-', as.integer(Sys.time()), '.png', sep=''),
  width=700,
  height=700
)

# Creates the chart, the total loading time is at the Y axis, the Unix
# timestamp is at the X axis.
plot(
  ordered_series[-1 * length(ordered_series),2],
  ordered_series[-1 * length(ordered_series),5],
  xlab="Unix timestamp",
  ylab="Page load time [ms]",
  main="Subsequent loading time measurements of the website"
)
dev.off()
