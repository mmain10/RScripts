## Modelling Project
# Created By: Mitch Main
# Created Date: 2015-02-20
## 

# Import Data
library(RMySQL)

#define the function for use in querying
GizmoDBquery <- function(db_name, query){
  
  # Creates a connection to the database to be queried
  db = dbConnect(MySQL(),
                 user = 'mitch.main',
                 password = 'fu810nD@t@',
                 host = 'dalreportdb01c-report.dal.moz.com',
                 dbname = db_name)
  
  # This sends the query to the database to compile the results
  rs = dbSendQuery(db, query)
  
  # This part then retrieves the data and stores in a dataframe object
  data <- fetch(rs, n=-1)
  
  # Close the connection
  dbDisconnect(db)
  
  return(data)
}

query <- "
SELECT
  COUNT(id) as Trialers,
	SUM(free_trial_convert) as Vests,
	DATE_FORMAT(paid_start_date, '%M-%Y') as month
FROM (
	SELECT
		id,
		DATE_ADD(start_date, INTERVAL free_trial_length DAY) as paid_start_date,
		free_trial_convert
	FROM metrics.relationships_clean
	WHERE free_trial_length IS NOT NULL AND free_trial_convert IS NOT NULL
) as sub
WHERE paid_start_date < DATE_ADD(CURDATE(), INTERVAL 31 DAY)
GROUP BY month
ORDER BY paid_start_date"

dataFrame <- GizmoDBquery('metrics', query)


plot(dataFrame$Trialers, dataFrame$Vests)

