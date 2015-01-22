library(RMySQL)

# Set up a connection to your database management system.
con <- dbConnect(MySQL(),
                 user = 'mitch.main',
                 password = 'fu810nD@t@',
                 host = 'dalreportdb01c-report.dal.moz.com',
                 dbname='report')
# NOTE: Above you must have the dbname equal to the database you are going to query. Cross-db queries
#       may not be possible within an R script.

# Function to make it easier to query 
query <- function(...) dbGetQuery(con, ...)

# Get the UCSC gene name, start and end sites for the first 10 genes on Chromosome 12
query("SELECT * FROM report.all_signups_monthly")
