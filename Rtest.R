install.packages("pxR")


# Read the file into a raw character vector, correcting encoding
file_content <- readLines("C:/Users/morit/Desktop/Zwischenspeicher/Python_testspace/Agrarstat_CH_104.px")

# Convert to UTF-8 encoding
file_content_utf8 <- iconv(file_content, from = "iso-8859-15", to = "UTF-8")

# Write the corrected content back to a temporary file
temp_file <- tempfile(fileext = ".px")
writeLines(file_content_utf8, temp_file)

# Now read the corrected file using pxR
library(pxR)
px_data <- read.px(temp_file)

# Clean up the temporary file
unlink(temp_file)


data <- px_data$DATA$value

View(data)
