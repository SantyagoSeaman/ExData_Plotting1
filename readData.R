Sys.setlocale("LC_TIME", "C")
require (data.table, quietly = T, warn.conflicts = F)

# Harcoded filename inside archive this data
dataFilename <- "household_power_consumption.txt"

# Read and unpack archive if target file is absent
readFile <- function() {
  if (file.exists(dataFilename)) {
    return ()
  }

  url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  archiveName = "household_power_consumption.zip"
  download.file(url, "household_power_consumption.zip", method = "curl")
  unzip(archiveName)
  unlink(archiveName)
}

# Read and clean data
parseFile <- function() {
  # Download file
  readFile ()

  electric <- read.table(dataFilename,
                         sep=";",
                         header=T,
                         colClasses = c("character", "character", "numeric",
                                        "numeric", "numeric", "numeric",
                                        "numeric", "numeric", "numeric"),
                         na.strings="?")

  electric$DateTime <- strptime((paste(electric$Date, electric$Time, sep=" ")),
                                 format="%d/%m/%Y %T")
  electric <- subset(electric,
                     DateTime >= as.POSIXct("2007-02-01 00:00:00 PST") &
                       DateTime <= as.POSIXct("2007-02-02 23:59:59 PST"))
  electric <- electric[,-(1:2),drop=FALSE]

  return (electric)
}

removeFile <- function() {
  unlink(dataFilename)
}
