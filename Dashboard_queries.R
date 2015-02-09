#       cancels <- sqldf(paste("SELECT
#                           strftime('%Y-%m-01', new_end_date) as month,
#                           COUNT(distinct id) as paid_cancels
#                        FROM data
#                        WHERE churn_type != 'not'
#                           AND new_end_date BETWEEN '", as.character(input$dates[1]),"'
#                           AND '", as.character(input$dates[2]), "'
#                        GROUP BY strftime('%Y-%m-01', new_end_date)", sep = ""))

#       mon_1_conv <- sqldf(paste("SELECT
#                             strftime('%Y-%m-01', mon_1_conv) as month,
#                             SUM(CASE WHEN new_end_date > mon_1_conv THEN 1 ELSE 0 END) as convert,
#                             COUNT(id) as total
#                           FROM data
#                           WHERE mon_1_conv BETWEEN strftime('%Y-%m-01', '", as.character(input$dates[1]),"')
#                             AND '", as.character(input$dates[2]),"'
#                           GROUP BY strftime('%Y-%m-01', mon_1_conv)", sep = ""))
#       mon_1_rate <- data.frame(round(mon_1_conv$convert/as.numeric(mon_1_conv$total)*100, digits = 3))
#       colnames(mon_1_rate) <- 'mon_1_rate'

#       mon_2_conv <- sqldf(paste("SELECT
#                             strftime('%Y-%m-01', mon_2_conv) as month,
#                             SUM(CASE WHEN new_end_date > mon_2_conv THEN 1 ELSE 0 END) as convert,
#                             COUNT(id) as total
#                           FROM data
#                           WHERE mon_2_conv BETWEEN strftime('%Y-%m-01', '", as.character(input$dates[1]),"')
#                             AND '", as.character(input$dates[2]),"'
#                           GROUP BY strftime('%Y-%m-01', mon_2_conv)", sep = ""))
#       mon_2_rate <- data.frame(round(mon_2_conv$convert/mon_2_conv$total*100, digits = 3))
#       colnames(mon_2_rate) <- 'mon_2_rate'

#       mon_3_conv <- sqldf(paste("SELECT
#                             strftime('%Y-%m-01', mon_3_conv) as month,
#                             SUM(CASE WHEN new_end_date > mon_3_conv THEN 1 ELSE 0 END) as convert,
#                             COUNT(id) as total
#                           FROM data
#                           WHERE mon_3_conv BETWEEN strftime('%Y-%m-01', '", as.character(input$dates[1]),"')
#                             AND '", as.character(input$dates[2]),"'
#                           GROUP BY strftime('%Y-%m-01', mon_3_conv)", sep = ""))
#       mon_3_rate <- data.frame(round(as.numeric(mon_3_conv$convert)/as.numeric(mon_3_conv$total)*100, digits =3))
#       colnames(mon_3_rate) <- 'mon_3_rate'
