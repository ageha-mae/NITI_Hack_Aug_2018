#Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jre1.8.0_181')
library(lubridate)
library(data.table)

rake_data_incoming <- read.csv(file="C:\\Users\\Rajesh Bhat\\Documents\\PortDwellTime\\INDIAN_RAILWAYS_JNPT_DATA_JAN_JUN_2018.csv", 
           header=T, stringsAsFactors = F)
rake_data_outgoing <- read.csv(file="C:\\Users\\Rajesh Bhat\\Documents\\PortDwellTime\\INDIAN_RAILWAYS_JNPT_OUTWARD_DATA_JAN_JUN_2018.csv", 
                               header=T, stringsAsFactors = F)

import_jan <- read.csv(file="C:\\Users\\Rajesh Bhat\\Documents\\PortDwellTime\\JNPT_Port_Operations_January_2018_IMPORT.csv", 
                       header=T, stringsAsFactors = F)
export_jan <- read.csv(file="C:\\Users\\Rajesh Bhat\\Documents\\PortDwellTime\\JNPT_Port_Operations_January_2018_EXPORT.csv", 
                        header=T, stringsAsFactors = F)

import_feb <- read.csv(file="C:\\Users\\Rajesh Bhat\\Documents\\PortDwellTime\\JNPT_Port_Operations_February_2018_IMPORT.csv", 
                       header=T, stringsAsFactors = F)
export_feb <- read.csv(file="C:\\Users\\Rajesh Bhat\\Documents\\PortDwellTime\\JNPT_Port_Operations_February_2018_EXPORT.csv", 
                       header=T, stringsAsFactors = F)

import_mar <- read.csv(file="C:\\Users\\Rajesh Bhat\\Documents\\PortDwellTime\\JNPT_Port_Operations_March_2018_IMPORT.csv", 
                       header=T, stringsAsFactors = F)
export_mar <- read.csv(file="C:\\Users\\Rajesh Bhat\\Documents\\PortDwellTime\\JNPT_Port_Operations_March_2018_EXPORT.csv", 
                       header=T, stringsAsFactors = F)

import_apr <- read.csv(file="C:\\Users\\Rajesh Bhat\\Documents\\PortDwellTime\\JNPT_Port_Operations_April_2018_IMPORT.csv", 
                       header=T, stringsAsFactors = F)
export_apr <- read.csv(file="C:\\Users\\Rajesh Bhat\\Documents\\PortDwellTime\\JNPT_Port_Operations_April_2018_EXPORT.csv", 
                       header=T, stringsAsFactors = F)

import_may <- read.csv(file="C:\\Users\\Rajesh Bhat\\Documents\\PortDwellTime\\JNPT_Port_Operations_May_2018_IMPORT.csv", 
                       header=T, stringsAsFactors = F)
export_may <- read.csv(file="C:\\Users\\Rajesh Bhat\\Documents\\PortDwellTime\\JNPT_Port_Operations_May_2018_EXPORT.csv", 
                       header=T, stringsAsFactors = F)

import_jun <- read.csv(file="C:\\Users\\Rajesh Bhat\\Documents\\PortDwellTime\\JNPT_Port_Operations_June_2018_IMPORT.csv", 
                       header=T, stringsAsFactors = F)
export_jun <- read.csv(file="C:\\Users\\Rajesh Bhat\\Documents\\PortDwellTime\\JNPT_Port_Operations_June_2018_EXPORT.csv", 
                       header=T, stringsAsFactors = F)


setDT(rake_data_incoming)
setDT(rake_data_outgoing)
setDT(import_jan)
setDT(export_jan)
setDT(import_feb)
setDT(export_feb)
setDT(import_mar)
setDT(export_mar)
setDT(import_apr)
setDT(export_apr)
setDT(import_may)
setDT(export_may)
setDT(import_jun)
setDT(export_jun)


rake_data_incoming[, USER.INDENT.REGISTRATION.TIME:= as.POSIXct(USER.INDENT.REGISTRATION.TIME,
                                                       format="%d/%m/%Y %H:%M")]
rake_data_incoming[, USER.INDENT.REGISTRATION.TIME:= USER.INDENT.REGISTRATION.TIME %m+% years(2000)]

rake_data_incoming[, SOURCE.DEPARTURE.TIME:= as.POSIXct(SOURCE.DEPARTURE.TIME,
                                               format="%d/%m/%Y %H:%M")]
rake_data_incoming[, SOURCE.DEPARTURE.TIME:= SOURCE.DEPARTURE.TIME %m+% years(2000)]

rake_data_incoming[, DESTINATION.ARRIVAL.TIME:= as.POSIXct(DESTINATION.ARRIVAL.TIME,
                                                  format="%d/%m/%Y %H:%M")]
rake_data_incoming[, DESTINATION.ARRIVAL.TIME:= DESTINATION.ARRIVAL.TIME %m+% years(2000)]

rake_data_incoming[, UNLOADING.END.TIME..DESTINATION.:= as.POSIXct(UNLOADING.END.TIME..DESTINATION.,
                                                          format="%d/%m/%Y %H:%M")]
rake_data_incoming[, UNLOADING.END.TIME..DESTINATION.:= UNLOADING.END.TIME..DESTINATION. %m+% years(2000)]

rake_data_incoming[, UNLOADING.START.TIME..DESTINATION.:= as.POSIXct(UNLOADING.START.TIME..DESTINATION.,
                                                            format="%d/%m/%Y %H:%M")]
rake_data_incoming[, UNLOADING.START.TIME..DESTINATION.:= UNLOADING.START.TIME..DESTINATION. %m+% years(2000)]

rake_data_outgoing[, USER.INDENT.REGISTRATION.TIME:= as.POSIXct(USER.INDENT.REGISTRATION.TIME,
                                                                format="%d/%m/%Y %H:%M")]
rake_data_outgoing[, USER.INDENT.REGISTRATION.TIME:= USER.INDENT.REGISTRATION.TIME %m+% years(2000)]

rake_data_outgoing[, LOADING.START.TIME...JNPT.. := as.POSIXct(LOADING.START.TIME...JNPT..,
                                                                format="%d/%m/%Y %H:%M")]
rake_data_outgoing[, LOADING.START.TIME...JNPT.. := LOADING.START.TIME...JNPT.. %m+% years(2000)]

rake_data_outgoing[, LOADING.END.TIME...JNPT.. := as.POSIXct(LOADING.END.TIME...JNPT..,
                                                               format="%d/%m/%Y %H:%M")]
rake_data_outgoing[, LOADING.END.TIME...JNPT.. := LOADING.END.TIME...JNPT.. %m+% years(2000)]

rake_data_outgoing[, JNPT..DEPARTURE.TIME := as.POSIXct(JNPT..DEPARTURE.TIME,
                                                             format="%d/%m/%Y %H:%M")]
rake_data_outgoing[, JNPT..DEPARTURE.TIME := JNPT..DEPARTURE.TIME %m+% years(2000)]

rake_data_outgoing[, DESTINATION.ARRIVAL.TIME := as.POSIXct(DESTINATION.ARRIVAL.TIME,
                                                        format="%d/%m/%Y %H:%M")]
rake_data_outgoing[, DESTINATION.ARRIVAL.TIME := DESTINATION.ARRIVAL.TIME %m+% years(2000)]

#########January########################
export_jan[, IN_TIME_OF_CONTAINER:=as.POSIXct(IN_TIME_OF_CONTAINER, format="%d/%b/%Y %H:%M")]
export_jan[, OUT_TIME:=as.POSIXct(OUT_TIME, format="%d/%b/%Y %H:%M")]
export_jan[, VESSEL_SAILING_TIME:=as.POSIXct(VESSEL_SAILING_TIME, format="%d/%b/%Y %H:%M")]

export_jan_rail <- export_jan[Carrier == 'RAIL']
setkey(export_jan_rail, IN_TIME_OF_CONTAINER)
export_jan_rail[, IN_TIME_OF_CONTAINER_COPY := IN_TIME_OF_CONTAINER]

setkey(rake_data_incoming, DESTINATION.ARRIVAL.TIME)

export_rake_join_jan <- rake_data_incoming[export_jan_rail, roll=T]
export_rake_join_jan <- export_rake_join_jan[!is.na(DWELL_TIME)]


import_jan[, Entry.Inward.or.Vessel.Arrival.Date.and.Time:=as.POSIXct(Entry.Inward.or.Vessel.Arrival.Date.and.Time, format="%d/%b/%Y %H:%M")]
import_jan[, CONTAINER_DISCHARGE:=as.POSIXct(CONTAINER_DISCHARGE, format="%d/%b/%Y %H:%M")]
import_jan[, CONTAINER_OUT_TIME:=as.POSIXct(CONTAINER_OUT_TIME, format="%d/%b/%Y %H:%M")]
import_jan[, VESSEL_BERTHING_TIME:=as.POSIXct(VESSEL_BERTHING_TIME, format="%d/%b/%Y %H:%M")]

import_jan_rail <- import_jan[Carrier == 'RAIL']
setkey(import_jan_rail, CONTAINER_OUT_TIME)
import_jan_rail[, CONTAINER_OUT_TIME_COPY := CONTAINER_OUT_TIME]

setkey(rake_data_outgoing, JNPT..DEPARTURE.TIME)

import_rake_join_jan <- rake_data_outgoing[import_jan_rail, roll=T]
import_rake_join_jan <- import_rake_join_jan[!is.na(DWELL_TIME)]

############February##

export_feb[, IN_TIME_OF_CONTAINER:=as.POSIXct(IN_TIME_OF_CONTAINER, format="%d/%b/%Y %H:%M")]
export_feb[, OUT_TIME:=as.POSIXct(OUT_TIME, format="%d/%b/%Y %H:%M")]
export_feb[, VESSEL_SAILING_TIME:=as.POSIXct(VESSEL_SAILING_TIME, format="%d/%b/%Y %H:%M")]

export_feb_rail <- export_feb[Carrier == 'RAIL']
setkey(export_feb_rail, IN_TIME_OF_CONTAINER)
export_feb_rail[, IN_TIME_OF_CONTAINER_COPY := IN_TIME_OF_CONTAINER]

setkey(rake_data_incoming, DESTINATION.ARRIVAL.TIME)

export_rake_join_feb <- rake_data_incoming[export_feb_rail, roll=T]
export_rake_join_feb <- export_rake_join_feb[!is.na(DWELL_TIME)]


import_feb[, Entry.Inward.or.Vessel.Arrival.Date.and.Time:=as.POSIXct(Entry.Inward.or.Vessel.Arrival.Date.and.Time, format="%d/%b/%Y %H:%M")]
import_feb[, CONTAINER_DISCHARGE:=as.POSIXct(CONTAINER_DISCHARGE, format="%d/%b/%Y %H:%M")]
import_feb[, CONTAINER_OUT_TIME:=as.POSIXct(CONTAINER_OUT_TIME, format="%d/%b/%Y %H:%M")]
import_feb[, VESSEL_BERTHING_TIME:=as.POSIXct(VESSEL_BERTHING_TIME, format="%d/%b/%Y %H:%M")]

import_feb_rail <- import_feb[Carrier == 'RAIL']
setkey(import_feb_rail, CONTAINER_OUT_TIME)
import_feb_rail[, CONTAINER_OUT_TIME_COPY := CONTAINER_OUT_TIME]

setkey(rake_data_outgoing, JNPT..DEPARTURE.TIME)

import_rake_join_feb <- rake_data_outgoing[import_feb_rail, roll=T]
import_rake_join_feb <- import_rake_join_feb[!is.na(DWELL_TIME)]

###############March####

export_mar[, IN_TIME_OF_CONTAINER:=as.POSIXct(IN_TIME_OF_CONTAINER, format="%d/%b/%Y %H:%M")]
export_mar[, OUT_TIME:=as.POSIXct(OUT_TIME, format="%d/%b/%Y %H:%M")]
export_mar[, VESSEL_SAILING_TIME:=as.POSIXct(VESSEL_SAILING_TIME, format="%d/%b/%Y %H:%M")]

export_mar_rail <- export_mar[Carrier == 'RAIL']
setkey(export_mar_rail, IN_TIME_OF_CONTAINER)
export_mar_rail[, IN_TIME_OF_CONTAINER_COPY := IN_TIME_OF_CONTAINER]

setkey(rake_data_incoming, DESTINATION.ARRIVAL.TIME)

export_rake_join_mar <- rake_data_incoming[export_mar_rail, roll=T]
export_rake_join_mar <- export_rake_join_mar[!is.na(DWELL_TIME)]


import_mar[, Entry.Inward.or.Vessel.Arrival.Date.and.Time:=as.POSIXct(Entry.Inward.or.Vessel.Arrival.Date.and.Time, format="%d/%b/%Y %H:%M")]
import_mar[, CONTAINER_DISCHARGE:=as.POSIXct(CONTAINER_DISCHARGE, format="%d/%b/%Y %H:%M")]
import_mar[, CONTAINER_OUT_TIME:=as.POSIXct(CONTAINER_OUT_TIME, format="%d/%b/%Y %H:%M")]
import_mar[, VESSEL_BERTHING_TIME:=as.POSIXct(VESSEL_BERTHING_TIME, format="%d/%b/%Y %H:%M")]

import_mar_rail <- import_mar[Carrier == 'RAIL']
setkey(import_mar_rail, CONTAINER_OUT_TIME)
import_mar_rail[, CONTAINER_OUT_TIME_COPY := CONTAINER_OUT_TIME]

setkey(rake_data_outgoing, JNPT..DEPARTURE.TIME)

import_rake_join_mar <- rake_data_outgoing[import_mar_rail]
import_rake_join_mar <- import_rake_join_mar[!is.na(DWELL_TIME)]

###############April###########

export_apr[, IN_TIME_OF_CONTAINER:=as.POSIXct(IN_TIME_OF_CONTAINER, format="%d/%b/%Y %H:%M")]
export_apr[, OUT_TIME:=as.POSIXct(OUT_TIME, format="%d/%b/%Y %H:%M")]
export_apr[, VESSEL_SAILING_TIME:=as.POSIXct(VESSEL_SAILING_TIME, format="%d/%b/%Y %H:%M")]

export_apr_rail <- export_apr[Carrier == 'RAIL']
setkey(export_apr_rail, IN_TIME_OF_CONTAINER)
export_apr_rail[, IN_TIME_OF_CONTAINER_COPY := IN_TIME_OF_CONTAINER]

setkey(rake_data_incoming, DESTINATION.ARRIVAL.TIME)

export_rake_join_apr <- rake_data_incoming[export_apr_rail, roll=T]
export_rake_join_apr <- export_rake_join_apr[!is.na(DWELL_TIME)]


import_apr[, Entry.Inward.or.Vessel.Arrival.Date.and.Time:=as.POSIXct(Entry.Inward.or.Vessel.Arrival.Date.and.Time, format="%d/%b/%Y %H:%M")]
import_apr[, CONTAINER_DISCHARGE:=as.POSIXct(CONTAINER_DISCHARGE, format="%d/%b/%Y %H:%M")]
import_apr[, CONTAINER_OUT_TIME:=as.POSIXct(CONTAINER_OUT_TIME, format="%d/%b/%Y %H:%M")]
import_apr[, VESSEL_BERTHING_TIME:=as.POSIXct(VESSEL_BERTHING_TIME, format="%d/%b/%Y %H:%M")]

import_apr_rail <- import_apr[Carrier == 'RAIL']
setkey(import_apr_rail, CONTAINER_OUT_TIME)
import_apr_rail[, CONTAINER_OUT_TIME_COPY := CONTAINER_OUT_TIME]

setkey(rake_data_outgoing, JNPT..DEPARTURE.TIME)

import_rake_join_apr <- rake_data_outgoing[import_apr_rail, roll=T]
import_rake_join_apr <- import_rake_join_apr[!is.na(DWELL_TIME)]

############May###

export_may[, IN_TIME_OF_CONTAINER:=as.POSIXct(IN_TIME_OF_CONTAINER, format="%d/%b/%Y %H:%M")]
export_may[, OUT_TIME:=as.POSIXct(OUT_TIME, format="%d/%b/%Y %H:%M")]
export_may[, VESSEL_SAILING_TIME:=as.POSIXct(VESSEL_SAILING_TIME, format="%d/%b/%Y %H:%M")]

export_may_rail <- export_may[Carrier == 'RAIL']
setkey(export_may_rail, IN_TIME_OF_CONTAINER)
export_may_rail[, IN_TIME_OF_CONTAINER_COPY := IN_TIME_OF_CONTAINER]

setkey(rake_data_incoming, DESTINATION.ARRIVAL.TIME)

export_rake_join_may <- rake_data_incoming[export_may_rail, roll=T]
export_rake_join_may <- export_rake_join_may[!is.na(DWELL_TIME)]


import_may[, Entry.Inward.or.Vessel.Arrival.Date.and.Time:=as.POSIXct(Entry.Inward.or.Vessel.Arrival.Date.and.Time, format="%d/%b/%Y %H:%M")]
import_may[, CONTAINER_DISCHARGE:=as.POSIXct(CONTAINER_DISCHARGE, format="%d/%b/%Y %H:%M")]
import_may[, CONTAINER_OUT_TIME:=as.POSIXct(CONTAINER_OUT_TIME, format="%d/%b/%Y %H:%M")]
import_may[, VESSEL_BERTHING_TIME:=as.POSIXct(VESSEL_BERTHING_TIME, format="%d/%b/%Y %H:%M")]

import_may_rail <- import_may[Carrier == 'RAIL']
setkey(import_may_rail, CONTAINER_OUT_TIME)
import_may_rail[, CONTAINER_OUT_TIME_COPY := CONTAINER_OUT_TIME]

setkey(rake_data_outgoing, JNPT..DEPARTURE.TIME)

import_rake_join_may <- rake_data_outgoing[import_may_rail, roll=T]
import_rake_join_may <- import_rake_join_may[!is.na(DWELL_TIME)]

##############June##########

export_jun[, IN_TIME_OF_CONTAINER:=as.POSIXct(IN_TIME_OF_CONTAINER, format="%d/%b/%Y %H:%M")]
export_jun[, OUT_TIME:=as.POSIXct(OUT_TIME, format="%d/%b/%Y %H:%M")]
export_jun[, VESSEL_SAILING_TIME:=as.POSIXct(VESSEL_SAILING_TIME, format="%d/%b/%Y %H:%M")]

export_jun_rail <- export_jun[Carrier == 'RAIL']
setkey(export_jun_rail, IN_TIME_OF_CONTAINER)
export_jun_rail[, IN_TIME_OF_CONTAINER_COPY := IN_TIME_OF_CONTAINER]

setkey(rake_data_incoming, DESTINATION.ARRIVAL.TIME)

export_rake_join_jun <- rake_data_incoming[export_jun_rail, roll=T]
export_rake_join_jun <- export_rake_join_jun[!is.na(DWELL_TIME)]


import_jun[, Entry.Inward.or.Vessel.Arrival.Date.and.Time:=as.POSIXct(Entry.Inward.or.Vessel.Arrival.Date.and.Time, format="%d/%b/%Y %H:%M")]
import_jun[, CONTAINER_DISCHARGE:=as.POSIXct(CONTAINER_DISCHARGE, format="%d/%b/%Y %H:%M")]
import_jun[, CONTAINER_OUT_TIME:=as.POSIXct(CONTAINER_OUT_TIME, format="%d/%b/%Y %H:%M")]
import_jun[, VESSEL_BERTHING_TIME:=as.POSIXct(VESSEL_BERTHING_TIME, format="%d/%b/%Y %H:%M")]

import_jun_rail <- import_jun[Carrier == 'RAIL']
setkey(import_jun_rail, CONTAINER_OUT_TIME)
import_jun_rail[, CONTAINER_OUT_TIME_COPY := CONTAINER_OUT_TIME]

setkey(rake_data_outgoing, JNPT..DEPARTURE.TIME)

import_rake_join_jun <- rake_data_outgoing[import_jun_rail, roll=T]
import_rake_join_jun <- import_rake_join_jun[!is.na(DWELL_TIME)]

#############Dwell Time Model#############

export_rake_join_jan[, IN_VISIT_ID := NULL]
export_rake_join_feb[, IN_VISIT_ID := NULL]
export_rake_join_mar[, IN_VISIT_ID := NULL]
export_rake_join_apr[, IN_VISIT_ID := NULL]
export_rake_join_may[, IN_VISIT_ID := NULL]
export_rake_join_jun[, IN_VISIT_ID := NULL]
export_training <- do.call('rbind', 
                           list(export_rake_join_jan,
                                export_rake_join_feb,
                                export_rake_join_mar,
                                export_rake_join_apr,
                                export_rake_join_may))

export_training[is.na(SOURCE.STATION.CODE), SOURCE.STATION.CODE := 'UNKNOWN']
export_training[, DWELL_TIME := as.numeric(DWELL_TIME)]
export_training[, DWELL_TIME_DISCRETE := cut(DWELL_TIME, breaks = c(-1, 4.8, 50),
                                             labels = c(4, 50))]

export_training[,GROSS_WEIGHT_DISCRETE := cut(GROSS_WEIGHT, 
                                              breaks = c(-1, 10, 22, 28, 100),
                                              labels = c(10, 22, 28, 100))]

# View(export_training[, c(as.list(summary(DWELL_TIME)), .N), 
#                      .(GROSS_WEIGHT_DISCRETE, STATUS, SIZE, SOURCE.STATION.CODE)])
# 
# View(export_training[, .(prob_3 = sum(DWELL_TIME_DISCRETE == 3)/ .N,
#                          prob_5 = sum(DWELL_TIME_DISCRETE == 5)/ .N,
#                          prob_9 = sum(DWELL_TIME_DISCRETE == 9)/ .N,
#                          prob_50 = sum(DWELL_TIME_DISCRETE == 50)/ .N,
#                          sample_size = .N), 
#                      .(GROSS_WEIGHT_DISCRETE, STATUS, SIZE, SOURCE.STATION.CODE)])

export_dwell_time_means <- export_training[, .(group_mean = mean(DWELL_TIME),
                                               group_prob = .N/nrow(export_training),
                                               group_count = .N), 
                                           DWELL_TIME_DISCRETE]


export_source_probs <- export_training[, .(prob= as.numeric(.N)/
                                             export_dwell_time_means[DWELL_TIME_DISCRETE == 
                                                                       .BY$DWELL_TIME_DISCRETE]$group_count), 
                                       .(SOURCE.STATION.CODE, DWELL_TIME_DISCRETE)]

export_size_probs <- export_training[, .(prob= as.numeric(.N)/
                                           export_dwell_time_means[DWELL_TIME_DISCRETE == 
                                                                     .BY$DWELL_TIME_DISCRETE]$group_count), 
                                     .(SIZE, DWELL_TIME_DISCRETE)]


export_weight_probs <- export_training[, .(prob= as.numeric(.N)/
                                             export_dwell_time_means[DWELL_TIME_DISCRETE == 
                                                                       .BY$DWELL_TIME_DISCRETE]$group_count), 
                                       .(GROSS_WEIGHT_DISCRETE, DWELL_TIME_DISCRETE)]

export_status_probs <- export_training[, .(prob= as.numeric(.N)/
                                             export_dwell_time_means[DWELL_TIME_DISCRETE == 
                                                                       .BY$DWELL_TIME_DISCRETE]$group_count), 
                                       .(STATUS, DWELL_TIME_DISCRETE)]

####################Prediction##############

PredictDwellProb <- function(SIZE_IN, WEIGHT_IN, STATUS_IN, SOURCE_STATION, GRP = 1){
  
  if(GRP %% 1000 == 0) print(GRP)
  
  prob_4 <- export_size_probs[SIZE==SIZE_IN & DWELL_TIME_DISCRETE==4]$prob*
    export_weight_probs[GROSS_WEIGHT_DISCRETE==WEIGHT_IN & DWELL_TIME_DISCRETE==4]$prob*
    export_status_probs[STATUS==STATUS_IN & DWELL_TIME_DISCRETE==4]$prob*
    export_source_probs[SOURCE.STATION.CODE==SOURCE_STATION & DWELL_TIME_DISCRETE==4]$prob*
    export_dwell_time_means[DWELL_TIME_DISCRETE == 4]$group_prob
  
  # prob_6 <- export_size_probs[SIZE==SIZE_IN & DWELL_TIME_DISCRETE==6]$prob*
  #   export_weight_probs[GROSS_WEIGHT_DISCRETE==WEIGHT_IN & DWELL_TIME_DISCRETE==6]$prob*
  #   export_status_probs[STATUS==STATUS_IN & DWELL_TIME_DISCRETE==6]$prob*
  #   export_source_probs[SOURCE.STATION.CODE==SOURCE_STATION & DWELL_TIME_DISCRETE==6]$prob*
  #   export_dwell_time_means[DWELL_TIME_DISCRETE == 6]$group_prob
  # 
  
  prob_50 <- export_size_probs[SIZE==SIZE_IN & DWELL_TIME_DISCRETE==50]$prob*
    export_weight_probs[GROSS_WEIGHT_DISCRETE==WEIGHT_IN & DWELL_TIME_DISCRETE==50]$prob*
    export_status_probs[STATUS==STATUS_IN & DWELL_TIME_DISCRETE==50]$prob*
    export_source_probs[SOURCE.STATION.CODE==SOURCE_STATION & DWELL_TIME_DISCRETE==50]$prob*
    export_dwell_time_means[DWELL_TIME_DISCRETE == 50]$group_prob
  
  prob_4_cond <- prob_4/(prob_4 + prob_50)
  # prob_6_cond <- prob_6/(prob_4 + prob_6 + prob_50)
  prob_50_cond <- prob_50/(prob_4 + prob_50)
  
  probs_ratio <- c(prob_4_cond/export_dwell_time_means[DWELL_TIME_DISCRETE == 4]$group_prob,
  #           prob_6_cond/export_dwell_time_means[DWELL_TIME_DISCRETE == 6]$group_prob,
             prob_50_cond/export_dwell_time_means[DWELL_TIME_DISCRETE == 50]$group_prob)

  # probs_ratio <- c(prob_4_cond, 
  #                  prob_5_cond, 
  #                  prob_9_cond, 
  #                  prob_50_cond)
  
  probs_class <- c(4, 50)
  
  #print(probs_ratio)
  
  dwell_time_prediction <- prob_4_cond * export_dwell_time_means[DWELL_TIME_DISCRETE == 4]$group_mean +
    #prob_6_cond * export_dwell_time_means[DWELL_TIME_DISCRETE == 6]$group_mean +
    prob_50_cond * export_dwell_time_means[DWELL_TIME_DISCRETE == 50]$group_mean

  return(list(DWELL_TIME_PREDICTION = dwell_time_prediction, 
              DWELL_TIME_PREDICTION_CLASS = probs_class[which.max(probs_ratio)]))
  
}

export_training[, c("DWELL_TIME_PREDICTION", "DWELL_TIME_PREDICTION_CLASS") := 
                  PredictDwellProb(SIZE, GROSS_WEIGHT_DISCRETE,
                                                            STATUS, SOURCE.STATION.CODE, .GRP),
                1:nrow(export_training)]

table(export_training[,.(DWELL_TIME_DISCRETE, DWELL_TIME_PREDICTION_CLASS)])
table(export_training[,.(DWELL_TIME > 4.9, DWELL_TIME_PREDICTION > 4.9)])
(export_training[,as.list(summary(abs(DWELL_TIME - DWELL_TIME_PREDICTION)))])

export_training[3001:3100][, c(DWELL_TIME,PredictDwellProb(SIZE, GROSS_WEIGHT_DISCRETE,
                                                STATUS, SOURCE.STATION.CODE, .GRP)),
                1:100]


export_rake_join_jun[is.na(SOURCE.STATION.CODE), SOURCE.STATION.CODE := 'UNKNOWN']
export_rake_join_jun[, SOURCE.STATION.CODE.PRED := SOURCE.STATION.CODE]
export_rake_join_jun[!(SOURCE.STATION.CODE.PRED %in% unique(export_training$SOURCE.STATION.CODE)), 
                     SOURCE.STATION.CODE.PRED := 'UNKNOWN']
export_rake_join_jun[, DWELL_TIME := as.numeric(DWELL_TIME)]
export_rake_join_jun[, DWELL_TIME_DISCRETE := cut(DWELL_TIME, breaks = c(-1, 4.8, 50),
                                             labels = c(4, 50))]

export_rake_join_jun[,GROSS_WEIGHT_DISCRETE := cut(GROSS_WEIGHT, 
                                              breaks = c(-1, 10, 22, 28, 100),
                                              labels = c(10, 22, 28, 100))]


export_rake_join_jun[, c("DWELL_TIME_PREDICTION", "DWELL_TIME_PREDICTION_CLASS") := 
                  PredictDwellProb(SIZE, GROSS_WEIGHT_DISCRETE,
                                   STATUS, SOURCE.STATION.CODE.PRED, .GRP),
                1:nrow(export_rake_join_jun)]

table(export_rake_join_jun[,.(DWELL_TIME_DISCRETE, DWELL_TIME_PREDICTION_CLASS)])
table(export_rake_join_jun[,.(DWELL_TIME > 5, DWELL_TIME_PREDICTION > 5)])
(export_rake_join_jun[,as.list(summary(abs(DWELL_TIME - DWELL_TIME_PREDICTION)))])

#############Finding Max Number of containers########

export_training[, SOURCE.STATION.CODE.PRED := SOURCE.STATION.CODE]
export_containers <- export_rake_join_jun

export_containers[, CONTAINER_ID := paste0('CONT_', .I)]

export_containers <- export_containers[!is.na(UNLOADING.END.TIME..DESTINATION.)]
unloading_time_start <- min(export_containers$UNLOADING.END.TIME..DESTINATION.)

curr_window_start <- unloading_time_start
curr_window_end <- unloading_time_start %m+% minutes(60)

windows <- NULL
while(curr_window_end < max(export_containers$OUT_TIME)){
  print(paste(curr_window_start, curr_window_end))
  curr_window <- data.table(win_start = curr_window_start,
                            win_end = curr_window_end,
                          IN_40 = nrow(export_containers[SIZE==40][UNLOADING.END.TIME..DESTINATION. >= curr_window_start & 
                                                          UNLOADING.END.TIME..DESTINATION. < curr_window_end]),
                            OUT_40 = nrow(export_containers[SIZE==40][OUT_TIME >= curr_window_start & 
                                                           OUT_TIME < curr_window_end]),
                            IN_20 = nrow(export_containers[SIZE==20][UNLOADING.END.TIME..DESTINATION. >= curr_window_start & 
                                                                       UNLOADING.END.TIME..DESTINATION. < curr_window_end]),
                            OUT_20 = nrow(export_containers[SIZE==20][OUT_TIME >= curr_window_start & 
                                                                        OUT_TIME < curr_window_end]),
                            IN_40_4 = nrow(export_containers[SIZE==40][DWELL_TIME_PREDICTION_CLASS == 4][UNLOADING.END.TIME..DESTINATION. >= curr_window_start & 
                                                                       UNLOADING.END.TIME..DESTINATION. < curr_window_end]),
                            OUT_40_4 = nrow(export_containers[SIZE==40][DWELL_TIME_PREDICTION_CLASS==4][OUT_TIME >= curr_window_start & 
                                                                        OUT_TIME < curr_window_end]),
                            IN_20_4 = nrow(export_containers[SIZE==20][DWELL_TIME_PREDICTION_CLASS==4][UNLOADING.END.TIME..DESTINATION. >= curr_window_start & 
                                                                       UNLOADING.END.TIME..DESTINATION. < curr_window_end]),
                            OUT_20_4 = nrow(export_containers[SIZE==20][DWELL_TIME_PREDICTION_CLASS==4][OUT_TIME >= curr_window_start & 
                                                                        OUT_TIME < curr_window_end]),
                            IN_40_low = nrow(export_containers[SIZE==40][DWELL_TIME_PREDICTION < 4.9][UNLOADING.END.TIME..DESTINATION. >= curr_window_start & 
                                                                                                    UNLOADING.END.TIME..DESTINATION. < curr_window_end]),
                            OUT_40_low = nrow(export_containers[SIZE==40][DWELL_TIME_PREDICTION < 4.9][OUT_TIME >= curr_window_start & 
                                                                                                          OUT_TIME < curr_window_end]),
                            IN_20_low = nrow(export_containers[SIZE==20][DWELL_TIME_PREDICTION < 5][UNLOADING.END.TIME..DESTINATION. >= curr_window_start & 
                                                                                                         UNLOADING.END.TIME..DESTINATION. < curr_window_end]),
                            OUT_20_low = nrow(export_containers[SIZE==20][DWELL_TIME_PREDICTION < 5][OUT_TIME >= curr_window_start & 
                                                                                                          OUT_TIME < curr_window_end]),
                            IN_40_50 = nrow(export_containers[SIZE==40][DWELL_TIME_PREDICTION_CLASS==50][UNLOADING.END.TIME..DESTINATION. >= curr_window_start & 
                                                                                                         UNLOADING.END.TIME..DESTINATION. < curr_window_end]),
                            OUT_40_50 = nrow(export_containers[SIZE==40][DWELL_TIME_PREDICTION_CLASS==50][OUT_TIME >= curr_window_start & 
                                                                                                          OUT_TIME < curr_window_end]),
                            IN_20_50 = nrow(export_containers[SIZE==20][DWELL_TIME_PREDICTION_CLASS==50][UNLOADING.END.TIME..DESTINATION. >= curr_window_start & 
                                                                                                         UNLOADING.END.TIME..DESTINATION. < curr_window_end]),
                            OUT_20_50 = nrow(export_containers[SIZE==20][DWELL_TIME_PREDICTION_CLASS==50][OUT_TIME >= curr_window_start & 
                                                                                                          OUT_TIME < curr_window_end]),
                            IN_40_high = nrow(export_containers[SIZE==40][DWELL_TIME_PREDICTION >= 4.9][UNLOADING.END.TIME..DESTINATION. >= curr_window_start & 
                                                                                                        UNLOADING.END.TIME..DESTINATION. < curr_window_end]),
                            OUT_40_high = nrow(export_containers[SIZE==40][DWELL_TIME_PREDICTION >= 4.9][OUT_TIME >= curr_window_start & 
                                                                                                         OUT_TIME < curr_window_end]),
                            IN_20_high = nrow(export_containers[SIZE==20][DWELL_TIME_PREDICTION >= 5][UNLOADING.END.TIME..DESTINATION. >= curr_window_start & 
                                                                                                        UNLOADING.END.TIME..DESTINATION. < curr_window_end]),
                            OUT_20_high = nrow(export_containers[SIZE==20][DWELL_TIME_PREDICTION >= 5][OUT_TIME >= curr_window_start & 
                                                                                                         OUT_TIME < curr_window_end]))
  windows <- rbind.data.frame(windows, curr_window)
  
  curr_window_start <- curr_window_end
  curr_window_end <- curr_window_start %m+% minutes(60)
}

windows[, IN_40_CUM := cumsum(IN_40)]
windows[, OUT_40_CUM := cumsum(OUT_40)]
windows[, IN_20_CUM := cumsum(IN_20)]
windows[, OUT_20_CUM := cumsum(OUT_20)]
windows[, IN_40_4_CUM := cumsum(IN_40_4)]
windows[, OUT_40_4_CUM := cumsum(OUT_40_4)]
windows[, IN_20_4_CUM := cumsum(IN_20_4)]
windows[, OUT_20_4_CUM := cumsum(OUT_20_4)]
windows[, IN_40_low_CUM := cumsum(IN_40_low)]
windows[, OUT_40_low_CUM := cumsum(OUT_40_low)]
windows[, IN_20_low_CUM := cumsum(IN_20_low)]
windows[, OUT_20_low_CUM := cumsum(OUT_20_low)]
windows[, IN_40_50_CUM := cumsum(IN_40_50)]
windows[, OUT_40_50_CUM := cumsum(OUT_40_50)]
windows[, IN_20_50_CUM := cumsum(IN_20_50)]
windows[, OUT_20_50_CUM := cumsum(OUT_20_50)]
windows[, IN_40_high_CUM := cumsum(IN_40_high)]
windows[, OUT_40_high_CUM := cumsum(OUT_40_high)]
windows[, IN_20_high_CUM := cumsum(IN_20_high)]
windows[, OUT_20_high_CUM := cumsum(OUT_20_high)]

windows[, IN_QUEUE_40 := IN_40_CUM - OUT_40_CUM]
windows[, IN_QUEUE_20 := IN_20_CUM - OUT_20_CUM]
windows[, IN_QUEUE_40_4 := IN_40_4_CUM - OUT_40_4_CUM]
windows[, IN_QUEUE_20_4 := IN_20_4_CUM - OUT_20_4_CUM]
windows[, IN_QUEUE_40_low := IN_40_low_CUM - OUT_40_low_CUM]
windows[, IN_QUEUE_20_low := IN_20_low_CUM - OUT_20_low_CUM]
windows[, IN_QUEUE_40_50 := IN_40_50_CUM - OUT_40_50_CUM]
windows[, IN_QUEUE_20_50 := IN_20_50_CUM - OUT_20_50_CUM]
windows[, IN_QUEUE_40_high := IN_40_high_CUM - OUT_40_high_CUM]
windows[, IN_QUEUE_20_high := IN_20_high_CUM - OUT_20_high_CUM]

#######Rehandles Simulation#############

stack_20_seq_temp <- data.table(r1 = rep('EMPTY', 9),
                            r2 = rep('EMPTY', 9),
                            r3 = rep('EMPTY', 9),
                            r4 = rep('EMPTY', 9),
                            r5 = rep('EMPTY', 9),
                            r6 = rep('EMPTY', 9),
                            r7 = rep('EMPTY', 9),
                            r8 = rep('EMPTY', 9),
                            r9 = rep('EMPTY', 9),
                            r10 = rep('EMPTY', 9))

stack_20_seq <- stack_20_seq_temp
for(i in 2:12){
  stack_20_seq2 <- stack_20_seq_temp
  colnames(stack_20_seq2) <- paste0(colnames(stack_20_seq_temp), i)
  stack_20_seq<- cbind(stack_20_seq, stack_20_seq2)
}


stack_40_seq_temp <- data.table(d3r1 = rep('EMPTY', 7),
                       d3r2 = rep('EMPTY', 7),
                       d3r3 = rep('EMPTY', 7),
                       d3r4 = rep('EMPTY', 7),
                       d3r5 = rep('EMPTY', 7),
                       d3r6 = rep('EMPTY', 7),
                       d3r7 = rep('EMPTY', 7),
                       d3r8 = rep('EMPTY', 7),
                       d3r9 = rep('EMPTY', 7),
                       d3r10 = rep('EMPTY', 7))

stack_40_seq <- stack_40_seq_temp
for(i in 2:12){
  stack_40_seq2 <- stack_40_seq_temp
  colnames(stack_40_seq2) <- paste0(colnames(stack_40_seq_temp), i)
  stack_40_seq<- cbind(stack_40_seq, stack_40_seq2)
}


###Sequntial Loading##################

time_points <- sort(unique(c(export_containers$UNLOADING.END.TIME..DESTINATION.,
                             export_containers$OUT_TIME)))
                    

curr_row_index_20 <- 1
curr_col_index_20 <- 1
curr_row_index_40 <- 1
curr_col_index_40 <- 1


rehandles_seq <- NULL


lapply(time_points, function(time_point){
  print(time_point)
  
  curr_rehandles <- 0
  curr_loading_containers_20 <- export_containers[SIZE==20][UNLOADING.END.TIME..DESTINATION. == time_point]$CONTAINER_ID
  curr_unloading_containers_20 <- export_containers[SIZE==20][OUT_TIME == time_point]$CONTAINER_ID
  
  curr_loading_containers_40 <- export_containers[SIZE==40][UNLOADING.END.TIME..DESTINATION. == time_point]$CONTAINER_ID
  curr_unloading_containers_40 <- export_containers[SIZE==40][OUT_TIME == time_point]$CONTAINER_ID
  
  if(length(curr_loading_containers_20) > 0){
    for(curr_cont in curr_loading_containers_20){
      
      
      
      curr_col_index_20 <- which.min(apply(stack_20_seq, 2, function(x){
        return(all(x !='EMPTY'))
      }))
      
      curr_row_index_20 <- min(which(stack_20_seq[, get(colnames(stack_20_seq)[curr_col_index_20])]=='EMPTY'))
      
      stack_20_seq[curr_row_index_20, curr_col_index_20] <<- curr_cont
      print(paste(curr_row_index_20, curr_col_index_20))
      
      
    }
  }
  
  if(length(curr_loading_containers_40) > 0){
    for(curr_cont in curr_loading_containers_40){
      
      curr_col_index_40 <- which.min(apply(stack_40_seq, 2, function(x){
        return(all(x !='EMPTY'))
      }))
      
      curr_row_index_40 <- min(which(stack_40_seq[, get(colnames(stack_40_seq)[curr_col_index_40])]=='EMPTY'))
      
      stack_40_seq[curr_row_index_40, curr_col_index_40] <<- curr_cont
      print(paste(curr_row_index_40, curr_col_index_40))
      
      
    }
  }
  
  if(length(curr_unloading_containers_20) > 0){
    for(curr_cont in curr_unloading_containers_20){
      print(curr_cont)
      
      curr_col_rep <- which(apply(stack_20_seq, 2, function(x){return(curr_cont %in% x)}))
      
      
      curr_stack <- stack_20_seq[, get(colnames(stack_20_seq)[curr_col_rep])]
      curr_row_rep <- which(curr_stack == curr_cont)
      
      
      if(curr_row_rep == length(curr_stack)){
        curr_stack_above <- c()
      }else{
        curr_stack_above <- curr_stack[(curr_row_rep+1):length(curr_stack)]
      }
      
      if(curr_row_rep == 1){
        curr_stack_below <- c()
      }else{
        curr_stack_below <- curr_stack[1:(curr_row_rep-1)]
      }
      
      stack_20_seq[, curr_col_rep] <<- c(curr_stack_below, curr_stack_above, 'EMPTY')
      
      curr_rehandles <- curr_rehandles + sum(curr_stack_above != 'EMPTY')
    }
  }
  
  
  if(length(curr_unloading_containers_40) > 0){
    for(curr_cont in curr_unloading_containers_40){
      print(curr_cont)
      
      curr_col <- which(apply(stack_40_seq, 2, function(x){return(curr_cont %in% x)}))
      
      
      curr_stack <- stack_40_seq[, get(colnames(stack_40_seq)[curr_col])]
      curr_row <- which(curr_stack == curr_cont)
      
      if(curr_row == length(curr_stack)){
        curr_stack_above <- c()
      }else{
        curr_stack_above <- curr_stack[(curr_row+1):length(curr_stack)]
      }
      
      if(curr_row == 1){
        curr_stack_below <- c()
      }else{
        curr_stack_below <- curr_stack[1:(curr_row-1)]
      }
      
      stack_40_seq[, curr_col] <<- c(curr_stack_below, curr_stack_above, 'EMPTY')
      
      curr_rehandles <- curr_rehandles + sum(curr_stack_above != 'EMPTY')
    }
  }
  
  rehandles_seq <<- rbind.data.frame(rehandles_seq,
                                     data.table(time_pt = time_point,
                                                rehandles = curr_rehandles))
})

################By Dwell ####

stack_20_dwell_temp_low <- data.table(r1 = rep('EMPTY', 8),
                                r2 = rep('EMPTY', 8),
                                r3 = rep('EMPTY', 8),
                                r4 = rep('EMPTY', 8),
                                r5 = rep('EMPTY', 8))

stack_20_dwell_low <- stack_20_dwell_temp_low
for(i in 2:9){
  stack_20_dwell2_low <- stack_20_dwell_temp_low
  colnames(stack_20_dwell2_low) <- paste0(colnames(stack_20_dwell_temp_low), i)
  stack_20_dwell_low<- cbind(stack_20_dwell_low, stack_20_dwell2_low)
}

stack_20_dwell_temp_high <- data.table(r1 = rep('EMPTY', 9),
                                      r2 = rep('EMPTY', 9),
                                      r3 = rep('EMPTY', 9),
                                      r4 = rep('EMPTY', 9),
                                      r5 = rep('EMPTY', 9))

stack_20_dwell_high <- stack_20_dwell_temp_high
for(i in 2:15){
  stack_20_dwell2_high <- stack_20_dwell_temp_high
  colnames(stack_20_dwell2_high) <- paste0(colnames(stack_20_dwell_temp_high), i)
  stack_20_dwell_high<- cbind(stack_20_dwell_high, stack_20_dwell2_high)
}


stack_40_dwell_temp_low <- data.table(r1 = rep('EMPTY', 6),
                                      r2 = rep('EMPTY', 6),
                                      r3 = rep('EMPTY', 6),
                                      r4 = rep('EMPTY', 6),
                                      r5 = rep('EMPTY', 6),
                                      r6 = rep('EMPTY', 6),
                                      r7 = rep('EMPTY', 6),
                                      r8 = rep('EMPTY', 6),
                                      r9 = rep('EMPTY', 6),
                                      r10 = rep('EMPTY', 6))

stack_40_dwell_low <- stack_40_dwell_temp_low
for(i in 2:8){
  stack_40_dwell2_low <- stack_40_dwell_temp_low
  colnames(stack_40_dwell2_low) <- paste0(colnames(stack_40_dwell_temp_low), i)
  stack_40_dwell_low<- cbind(stack_40_dwell_low, stack_40_dwell2_low)
}

stack_40_dwell_low2 <- data.table(r1 = rep('EMPTY', 12),
                                      r2 = rep('EMPTY', 12),
                                      r3 = rep('EMPTY', 12),
                                      r4 = rep('EMPTY', 12),
                                      r5 = rep('EMPTY', 12),
                                      r6 = rep('EMPTY', 12),
                                      r7 = rep('EMPTY', 12),
                                      r8 = rep('EMPTY', 12),
                                      r9 = rep('EMPTY', 12),
                                      r10 = rep('EMPTY', 12))

stack_40_dwell_temp_high <- data.table(r1 = rep('EMPTY', 7),
                                       r2 = rep('EMPTY', 7),
                                       r3 = rep('EMPTY', 7),
                                       r4 = rep('EMPTY', 7),
                                       r5 = rep('EMPTY', 7),
                                       r6 = rep('EMPTY', 7),
                                       r7 = rep('EMPTY', 7),
                                       r8 = rep('EMPTY', 7),
                                       r9 = rep('EMPTY', 7),
                                       r10 = rep('EMPTY', 7))

stack_40_dwell_high <- stack_40_dwell_temp_high
for(i in 2:3){
  stack_40_dwell2_high <- stack_40_dwell_temp_high
  colnames(stack_40_dwell2_high) <- paste0(colnames(stack_40_dwell_temp_high), i)
  stack_40_dwell_high<- cbind(stack_40_dwell_high, stack_40_dwell2_high)
}

rehandles_dwell <- NULL


lapply(time_points, function(time_point){
  print(time_point)
  
  curr_rehandles <- 0
  curr_loading_containers_20 <- export_containers[SIZE==20][UNLOADING.END.TIME..DESTINATION. == time_point]$CONTAINER_ID
  curr_unloading_containers_20 <- export_containers[SIZE==20][OUT_TIME == time_point]$CONTAINER_ID
  
  curr_loading_containers_40 <- export_containers[SIZE==40][UNLOADING.END.TIME..DESTINATION. == time_point]$CONTAINER_ID
  curr_unloading_containers_40 <- export_containers[SIZE==40][OUT_TIME == time_point]$CONTAINER_ID
  
  if(length(curr_loading_containers_20) > 0){
    for(curr_cont in curr_loading_containers_20){
      
      curr_dwell <- export_containers[CONTAINER_ID == curr_cont]$DWELL_TIME_PREDICTION_CLASS
      
      
      if(curr_dwell == 4){
        # col_heights <- apply(stack_20_dwell_low, 2, function(x){
        #   if(any(x == 'EMPTY')){
        #     return(min(which(x == 'EMPTY')))
        #   }else{
        #     return(0)
        #   }
        # })
        # 
        # curr_row_index_20 <- max(col_heights)
        # curr_col_index_20 <- which.max(col_heights)

        # curr_row_index_20 <- which.min(apply(stack_20_dwell_low, 1, function(x){
        #   return(all(x !='EMPTY'))
        # }))
        # curr_col_index_20 <- min(which(stack_20_dwell_low[curr_row_index_20]=='EMPTY'))

        curr_col_index_20 <- which.min(apply(stack_20_dwell_low, 2, function(x){
          return(all(x !='EMPTY'))
        }))
        
        
        curr_row_index_20 <- min(which(stack_20_dwell_low[, get(colnames(stack_20_dwell_low)[curr_col_index_20])]=='EMPTY'))
        
        stack_20_dwell_low[curr_row_index_20, curr_col_index_20] <<- curr_cont
        print(paste(curr_row_index_20, curr_col_index_20))
        
        
      }else{
        # curr_row_index_20 <- which.min(apply(stack_20_dwell_high, 1, function(x){
        #   return(all(x !='EMPTY'))
        # }))
        # curr_col_index_20 <- min(which(stack_20_dwell_high[curr_row_index_20]=='EMPTY'))
        
        curr_col_index_20 <- which.min(apply(stack_20_dwell_high, 2, function(x){
          return(all(x !='EMPTY'))
        }))
        
        curr_row_index_20 <- min(which(stack_20_dwell_high[, get(colnames(stack_20_dwell_high)[curr_col_index_20])]=='EMPTY'))
        
        stack_20_dwell_high[curr_row_index_20, curr_col_index_20] <<- curr_cont
        print(paste(curr_row_index_20, curr_col_index_20))
        
      }
    }
  }
  
  if(length(curr_loading_containers_40) > 0){
    for(curr_cont in curr_loading_containers_40){
      
      curr_dwell <- export_containers[CONTAINER_ID == curr_cont]$DWELL_TIME_PREDICTION_CLASS
      
      
      if(curr_dwell == 4){
        # col_heights <- apply(stack_40_dwell_low, 2, function(x){
        #   if(any(x == 'EMPTY')){
        #     return(min(which(x == 'EMPTY')))
        #   }else{
        #     return(0)
        #   }
        # })
        # 
        # curr_row_index_40 <- max(col_heights)
        # curr_col_index_40 <- which.max(col_heights)

        # curr_row_index_40 <- which.min(apply(stack_40_dwell_low, 1, function(x){
        #   return(all(x !='EMPTY'))
        # }))
        # curr_col_index_40 <- min(which(stack_40_dwell_low[curr_row_index_40]=='EMPTY'))
        
        if(any(stack_40_dwell_low=='EMPTY')){
          curr_col_index_40 <- which.min(apply(stack_40_dwell_low, 2, function(x){
            return(all(x !='EMPTY'))
          }))
          
          
          curr_row_index_40 <- min(which(stack_40_dwell_low[, get(colnames(stack_40_dwell_low)[curr_col_index_40])]=='EMPTY'))
          
          stack_40_dwell_low[curr_row_index_40, curr_col_index_40] <<- curr_cont
          print(paste(curr_row_index_40, curr_col_index_40))
        }else{
          curr_col_index_40 <- which.min(apply(stack_40_dwell_low2, 2, function(x){
            return(all(x !='EMPTY'))
          }))
          
          
          curr_row_index_40 <- min(which(stack_40_dwell_low2[, get(colnames(stack_40_dwell_low2)[curr_col_index_40])]=='EMPTY'))
          
          stack_40_dwell_low2[curr_row_index_40, curr_col_index_40] <<- curr_cont
          print(paste(curr_row_index_40, curr_col_index_40))
        }
        
        
        
      }else{
        # curr_row_index_40 <- which.min(apply(stack_40_dwell_high, 1, function(x){
        #   return(all(x !='EMPTY'))
        # }))
        # curr_col_index_40 <- min(which(stack_40_dwell_high[curr_row_index_40]=='EMPTY'))
        
        curr_col_index_40 <- which.min(apply(stack_40_dwell_high, 2, function(x){
          return(all(x !='EMPTY'))
        }))
        
        
        curr_row_index_40 <- min(which(stack_40_dwell_high[, get(colnames(stack_40_dwell_high)[curr_col_index_40])]=='EMPTY'))
        
        
        stack_40_dwell_high[curr_row_index_40, curr_col_index_40] <<- curr_cont
        print(paste(curr_row_index_40, curr_col_index_40))
        
      }
      
    }
  }
  
  if(length(curr_unloading_containers_20) > 0){
    for(curr_cont in curr_unloading_containers_20){
      print(curr_cont)
      
      curr_dwell <- export_containers[CONTAINER_ID == curr_cont]$DWELL_TIME_PREDICTION_CLASS
      
      if(curr_dwell == 4){
        curr_col_rep <- which(apply(stack_20_dwell_low, 2, function(x){return(curr_cont %in% x)}))
        
        
        curr_stack <- stack_20_dwell_low[, get(colnames(stack_20_dwell_low)[curr_col_rep])]
        curr_row_rep <- which(curr_stack == curr_cont)
        
        
        if(curr_row_rep == length(curr_stack)){
          curr_stack_above <- c()
        }else{
          curr_stack_above <- curr_stack[(curr_row_rep+1):length(curr_stack)]
        }
        
        if(curr_row_rep == 1){
          curr_stack_below <- c()
        }else{
          curr_stack_below <- curr_stack[1:(curr_row_rep-1)]
        }
        
        stack_20_dwell_low[, curr_col_rep] <<- c(curr_stack_below, curr_stack_above, 'EMPTY')
        
        curr_rehandles <- curr_rehandles + sum(curr_stack_above != 'EMPTY')
      }else{
        curr_col_rep <- which(apply(stack_20_dwell_high, 2, function(x){return(curr_cont %in% x)}))
        
        
        curr_stack <- stack_20_dwell_high[, get(colnames(stack_20_dwell_high)[curr_col_rep])]
        curr_row_rep <- which(curr_stack == curr_cont)
        
        
        if(curr_row_rep == length(curr_stack)){
          curr_stack_above <- c()
        }else{
          curr_stack_above <- curr_stack[(curr_row_rep+1):length(curr_stack)]
        }
        
        if(curr_row_rep == 1){
          curr_stack_below <- c()
        }else{
          curr_stack_below <- curr_stack[1:(curr_row_rep-1)]
        }
        
        stack_20_dwell_high[, curr_col_rep] <<- c(curr_stack_below, curr_stack_above, 'EMPTY')
        
        curr_rehandles <- curr_rehandles + sum(curr_stack_above != 'EMPTY')
      }
      
      
    }
  }
  
  
  if(length(curr_unloading_containers_40) > 0){
    for(curr_cont in curr_unloading_containers_40){
      print(curr_cont)
      
      curr_dwell <- export_containers[CONTAINER_ID == curr_cont]$DWELL_TIME_PREDICTION_CLASS
      
      if(curr_dwell == 4){
        curr_low_search <- apply(stack_40_dwell_low, 2, function(x){return(curr_cont %in% x)})
        if(any(curr_low_search)){
          curr_col_rep <- which(curr_low_search)
          
          
          curr_stack <- stack_40_dwell_low[, get(colnames(stack_40_dwell_low)[curr_col_rep])]
          curr_row_rep <- which(curr_stack == curr_cont)
          
          
          if(curr_row_rep == length(curr_stack)){
            curr_stack_above <- c()
          }else{
            curr_stack_above <- curr_stack[(curr_row_rep+1):length(curr_stack)]
          }
          
          if(curr_row_rep == 1){
            curr_stack_below <- c()
          }else{
            curr_stack_below <- curr_stack[1:(curr_row_rep-1)]
          }
          
          stack_40_dwell_low[, curr_col_rep] <<- c(curr_stack_below, curr_stack_above, 'EMPTY')
          
          curr_rehandles <- curr_rehandles + sum(curr_stack_above != 'EMPTY')
        }else{
          curr_col_rep <- which(apply(stack_40_dwell_low2, 2, function(x){return(curr_cont %in% x)}))
          
          
          curr_stack <- stack_40_dwell_low2[, get(colnames(stack_40_dwell_low2)[curr_col_rep])]
          curr_row_rep <- which(curr_stack == curr_cont)
          
          
          if(curr_row_rep == length(curr_stack)){
            curr_stack_above <- c()
          }else{
            curr_stack_above <- curr_stack[(curr_row_rep+1):length(curr_stack)]
          }
          
          if(curr_row_rep == 1){
            curr_stack_below <- c()
          }else{
            curr_stack_below <- curr_stack[1:(curr_row_rep-1)]
          }
          
          stack_40_dwell_low2[, curr_col_rep] <<- c(curr_stack_below, curr_stack_above, 'EMPTY')
          
          curr_rehandles <- curr_rehandles + sum(curr_stack_above != 'EMPTY')
        }
        
      }else{
        curr_col_rep <- which(apply(stack_40_dwell_high, 2, function(x){return(curr_cont %in% x)}))
        
        
        curr_stack <- stack_40_dwell_high[, get(colnames(stack_40_dwell_high)[curr_col_rep])]
        curr_row_rep <- which(curr_stack == curr_cont)
        
        
        if(curr_row_rep == length(curr_stack)){
          curr_stack_above <- c()
        }else{
          curr_stack_above <- curr_stack[(curr_row_rep+1):length(curr_stack)]
        }
        
        if(curr_row_rep == 1){
          curr_stack_below <- c()
        }else{
          curr_stack_below <- curr_stack[1:(curr_row_rep-1)]
        }
        
        stack_40_dwell_high[, curr_col_rep] <<- c(curr_stack_below, curr_stack_above, 'EMPTY')
        
        curr_rehandles <- curr_rehandles + sum(curr_stack_above != 'EMPTY')
      }
      
      
    }
  }
  
  rehandles_dwell <<- rbind.data.frame(rehandles_dwell,
                                     data.table(time_pt = time_point,
                                                rehandles = curr_rehandles))
})


###############Random##################

random_rehandles <- NULL

for(j in 1:5){
  
  stack_20_rand_temp <- data.table(r1 = rep('EMPTY', 9),
                                   r2 = rep('EMPTY', 9),
                                   r3 = rep('EMPTY', 9),
                                   r4 = rep('EMPTY', 9),
                                   r5 = rep('EMPTY', 9),
                                   r6 = rep('EMPTY', 9),
                                   r7 = rep('EMPTY', 9),
                                   r8 = rep('EMPTY', 9),
                                   r9 = rep('EMPTY', 9),
                                   r10 = rep('EMPTY', 9))
  
  stack_20_rand <- stack_20_rand_temp
  for(i in 2:12){
    stack_20_rand2 <- stack_20_rand_temp
    colnames(stack_20_rand2) <- paste0(colnames(stack_20_rand_temp), i)
    stack_20_rand<- cbind(stack_20_rand, stack_20_rand2)
  }
  
  
  stack_40_rand_temp <- data.table(d3r1 = rep('EMPTY', 7),
                                   d3r2 = rep('EMPTY', 7),
                                   d3r3 = rep('EMPTY', 7),
                                   d3r4 = rep('EMPTY', 7),
                                   d3r5 = rep('EMPTY', 7),
                                   d3r6 = rep('EMPTY', 7),
                                   d3r7 = rep('EMPTY', 7),
                                   d3r8 = rep('EMPTY', 7),
                                   d3r9 = rep('EMPTY', 7),
                                   d3r10 = rep('EMPTY', 7))
  
  stack_40_rand <- stack_40_rand_temp
  for(i in 2:12){
    stack_40_rand2 <- stack_40_rand_temp
    colnames(stack_40_rand2) <- paste0(colnames(stack_40_rand_temp), i)
    stack_40_rand<- cbind(stack_40_rand, stack_40_rand2)
  }
  
  
  
  
  rehandles_rand <- NULL
  
  
  lapply(time_points, function(time_point){
    print(time_point)
    
    curr_rehandles <- 0
    curr_loading_containers_20 <- export_containers[SIZE==20][UNLOADING.END.TIME..DESTINATION. == time_point]$CONTAINER_ID
    curr_unloading_containers_20 <- export_containers[SIZE==20][OUT_TIME == time_point]$CONTAINER_ID
    
    curr_loading_containers_40 <- export_containers[SIZE==40][UNLOADING.END.TIME..DESTINATION. == time_point]$CONTAINER_ID
    curr_unloading_containers_40 <- export_containers[SIZE==40][OUT_TIME == time_point]$CONTAINER_ID
    
    if(length(curr_loading_containers_20) > 0){
      for(curr_cont in curr_loading_containers_20){
        
        curr_col_index_20 <- sample(120, 1)
        while(all(stack_20_rand[, get(colnames(stack_20_rand)[curr_col_index_20])] !='EMPTY')){
          curr_col_index_20 <- sample(120, 1)
        }
        
        curr_row_index_20 <- min(which(stack_20_rand[, get(colnames(stack_20_rand)[curr_col_index_20])]=='EMPTY'))
        
        stack_20_rand[curr_row_index_20, curr_col_index_20] <<- curr_cont
        print(paste(curr_row_index_20, curr_col_index_20))
        
        
      }
    }
    
    if(length(curr_loading_containers_40) > 0){
      for(curr_cont in curr_loading_containers_40){
        
        curr_col_index_40 <- sample(120, 1)
        while(all(stack_40_rand[, get(colnames(stack_40_rand)[curr_col_index_40])] !='EMPTY')){
          curr_col_index_40 <- sample(120, 1)
        }
        
        curr_row_index_40 <- min(which(stack_40_rand[, get(colnames(stack_40_rand)[curr_col_index_40])]=='EMPTY'))
        
        stack_40_rand[curr_row_index_40, curr_col_index_40] <<- curr_cont
        
        print(paste(curr_row_index_40, curr_col_index_40))
        
        
      }
    }
    
    if(length(curr_unloading_containers_20) > 0){
      for(curr_cont in curr_unloading_containers_20){
        print(curr_cont)
        
        curr_col_rep <- which(apply(stack_20_rand, 2, function(x){return(curr_cont %in% x)}))
        
        
        curr_stack <- stack_20_rand[, get(colnames(stack_20_rand)[curr_col_rep])]
        curr_row_rep <- which(curr_stack == curr_cont)
        
        
        if(curr_row_rep == length(curr_stack)){
          curr_stack_above <- c()
        }else{
          curr_stack_above <- curr_stack[(curr_row_rep+1):length(curr_stack)]
        }
        
        if(curr_row_rep == 1){
          curr_stack_below <- c()
        }else{
          curr_stack_below <- curr_stack[1:(curr_row_rep-1)]
        }
        
        stack_20_rand[, curr_col_rep] <<- c(curr_stack_below, curr_stack_above, 'EMPTY')
        
        curr_rehandles <- curr_rehandles + sum(curr_stack_above != 'EMPTY')
      }
    }
    
    
    if(length(curr_unloading_containers_40) > 0){
      for(curr_cont in curr_unloading_containers_40){
        print(curr_cont)
        
        curr_col <- which(apply(stack_40_rand, 2, function(x){return(curr_cont %in% x)}))
        
        
        curr_stack <- stack_40_rand[, get(colnames(stack_40_rand)[curr_col])]
        curr_row <- which(curr_stack == curr_cont)
        
        if(curr_row == length(curr_stack)){
          curr_stack_above <- c()
        }else{
          curr_stack_above <- curr_stack[(curr_row+1):length(curr_stack)]
        }
        
        if(curr_row == 1){
          curr_stack_below <- c()
        }else{
          curr_stack_below <- curr_stack[1:(curr_row-1)]
        }
        
        stack_40_rand[, curr_col] <<- c(curr_stack_below, curr_stack_above, 'EMPTY')
        
        curr_rehandles <- curr_rehandles + sum(curr_stack_above != 'EMPTY')
      }
    }
    
    rehandles_rand <<- rbind.data.frame(rehandles_rand,
                                        data.table(time_pt = time_point,
                                                   rehandles = curr_rehandles))
  })
  
  random_rehandles <- rbind.data.frame(random_rehandles,
                                       data.table(iteration = j,
                                                  rehandles = sum(rehandles_rand$rehandles)))
  
}


################By Dwell Random####

stack_20_dwell_rand_temp_low <- data.table(r1 = rep('EMPTY', 8),
                                      r2 = rep('EMPTY', 8),
                                      r3 = rep('EMPTY', 8),
                                      r4 = rep('EMPTY', 8),
                                      r5 = rep('EMPTY', 8))

stack_20_dwell_rand_low <- stack_20_dwell_rand_temp_low
for(i in 2:10){
  stack_20_dwell_rand2_low <- stack_20_dwell_rand_temp_low
  colnames(stack_20_dwell_rand2_low) <- paste0(colnames(stack_20_dwell_rand_temp_low), i)
  stack_20_dwell_rand_low<- cbind(stack_20_dwell_rand_low, stack_20_dwell_rand2_low)
}

stack_20_dwell_rand_temp_high <- data.table(r1 = rep('EMPTY', 9),
                                       r2 = rep('EMPTY', 9),
                                       r3 = rep('EMPTY', 9),
                                       r4 = rep('EMPTY', 9),
                                       r5 = rep('EMPTY', 9))

stack_20_dwell_rand_high <- stack_20_dwell_rand_temp_high
for(i in 2:15){
  stack_20_dwell_rand2_high <- stack_20_dwell_rand_temp_high
  colnames(stack_20_dwell_rand2_high) <- paste0(colnames(stack_20_dwell_rand_temp_high), i)
  stack_20_dwell_rand_high<- cbind(stack_20_dwell_rand_high, stack_20_dwell_rand2_high)
}


stack_40_dwell_rand_temp_low <- data.table(r1 = rep('EMPTY', 6),
                                      r2 = rep('EMPTY', 6),
                                      r3 = rep('EMPTY', 6),
                                      r4 = rep('EMPTY', 6),
                                      r5 = rep('EMPTY', 6))

stack_40_dwell_rand_low <- stack_40_dwell_rand_temp_low
for(i in 2:17){
  stack_40_dwell_rand2_low <- stack_40_dwell_rand_temp_low
  colnames(stack_40_dwell_rand2_low) <- paste0(colnames(stack_40_dwell_rand_temp_low), i)
  stack_40_dwell_rand_low<- cbind(stack_40_dwell_rand_low, stack_40_dwell_rand2_low)
}

stack_40_dwell_rand_temp_low2 <- data.table(r1 = rep('EMPTY', 18),
                                  r2 = rep('EMPTY', 18),
                                  r3 = rep('EMPTY', 18),
                                  r4 = rep('EMPTY', 18),
                                  r5 = rep('EMPTY', 18))

stack_40_dwell_rand_low2 <- stack_40_dwell_rand_temp_low2
for(i in 2:3){
  stack_40_dwell_rand2_low2 <- stack_40_dwell_rand_temp_low2
  colnames(stack_40_dwell_rand2_low2) <- paste0(colnames(stack_40_dwell_rand_temp_low2), i)
  stack_40_dwell_rand_low2<- cbind(stack_40_dwell_rand_low2, stack_40_dwell_rand2_low2)
}

stack_40_dwell_rand_temp_high <- data.table(r1 = rep('EMPTY', 7),
                                       r2 = rep('EMPTY', 7),
                                       r3 = rep('EMPTY', 7),
                                       r4 = rep('EMPTY', 7),
                                       r5 = rep('EMPTY', 7),
                                       r6 = rep('EMPTY', 7),
                                       r7 = rep('EMPTY', 7),
                                       r8 = rep('EMPTY', 7),
                                       r9 = rep('EMPTY', 7),
                                       r10 = rep('EMPTY', 7))

stack_40_dwell_rand_high <- stack_40_dwell_rand_temp_high
for(i in 2:3){
  stack_40_dwell_rand2_high <- stack_40_dwell_rand_temp_high
  colnames(stack_40_dwell_rand2_high) <- paste0(colnames(stack_40_dwell_rand_temp_high), i)
  stack_40_dwell_rand_high<- cbind(stack_40_dwell_rand_high, stack_40_dwell_rand2_high)
}

rehandles_dwell_rand <- NULL


lapply(time_points, function(time_point){
  print(time_point)
  
  curr_rehandles <- 0
  curr_loading_containers_20 <- export_containers[SIZE==20][UNLOADING.END.TIME..DESTINATION. == time_point]$CONTAINER_ID
  curr_unloading_containers_20 <- export_containers[SIZE==20][OUT_TIME == time_point]$CONTAINER_ID
  
  curr_loading_containers_40 <- export_containers[SIZE==40][UNLOADING.END.TIME..DESTINATION. == time_point]$CONTAINER_ID
  curr_unloading_containers_40 <- export_containers[SIZE==40][OUT_TIME == time_point]$CONTAINER_ID
  
  if(length(curr_loading_containers_20) > 0){
    for(curr_cont in curr_loading_containers_20){
      
      curr_dwell_rand <- export_containers[CONTAINER_ID == curr_cont]$DWELL_TIME_PREDICTION_CLASS
      
      
      if(curr_dwell_rand == 4){
        # col_heights <- apply(stack_20_dwell_rand_low, 2, function(x){
        #   if(any(x == 'EMPTY')){
        #     return(min(which(x == 'EMPTY')))
        #   }else{
        #     return(0)
        #   }
        # })
        # 
        # curr_row_index_20 <- max(col_heights)
        # curr_col_index_20 <- which.max(col_heights)
        
        # curr_row_index_20 <- which.min(apply(stack_20_dwell_rand_low, 1, function(x){
        #   return(all(x !='EMPTY'))
        # }))
        # curr_col_index_20 <- min(which(stack_20_dwell_rand_low[curr_row_index_20]=='EMPTY'))
        
        curr_col_index_20 <- sample(45, 1)
        while(all(stack_20_dwell_rand_low[, get(colnames(stack_20_dwell_rand_low)[curr_col_index_20])] !='EMPTY')){
          curr_col_index_20 <- sample(45, 1)
        }
        
        
        curr_row_index_20 <- min(which(stack_20_dwell_rand_low[, get(colnames(stack_20_dwell_rand_low)[curr_col_index_20])]=='EMPTY'))
        
        stack_20_dwell_rand_low[curr_row_index_20, curr_col_index_20] <<- curr_cont
        print(paste(curr_row_index_20, curr_col_index_20))
        
        
      }else{
        # curr_row_index_20 <- which.min(apply(stack_20_dwell_rand_high, 1, function(x){
        #   return(all(x !='EMPTY'))
        # }))
        # curr_col_index_20 <- min(which(stack_20_dwell_rand_high[curr_row_index_20]=='EMPTY'))
        
        curr_col_index_20 <- sample(75, 1)
        while(all(stack_20_dwell_rand_high[, get(colnames(stack_20_dwell_rand_high)[curr_col_index_20])] !='EMPTY')){
          curr_col_index_20 <- sample(75, 1)
        }
        
        
        curr_row_index_20 <- min(which(stack_20_dwell_rand_high[, get(colnames(stack_20_dwell_rand_high)[curr_col_index_20])]=='EMPTY'))
        
        stack_20_dwell_rand_high[curr_row_index_20, curr_col_index_20] <<- curr_cont
        print(paste(curr_row_index_20, curr_col_index_20))
        
      }
    }
  }
  
  if(length(curr_loading_containers_40) > 0){
    for(curr_cont in curr_loading_containers_40){
      
      curr_dwell_rand <- export_containers[CONTAINER_ID == curr_cont]$DWELL_TIME_PREDICTION_CLASS
      
      
      if(curr_dwell_rand == 4){
        # col_heights <- apply(stack_40_dwell_rand_low, 2, function(x){
        #   if(any(x == 'EMPTY')){
        #     return(min(which(x == 'EMPTY')))
        #   }else{
        #     return(0)
        #   }
        # })
        # 
        # curr_row_index_40 <- max(col_heights)
        # curr_col_index_40 <- which.max(col_heights)
        
        # curr_row_index_40 <- which.min(apply(stack_40_dwell_rand_low, 1, function(x){
        #   return(all(x !='EMPTY'))
        # }))
        # curr_col_index_40 <- min(which(stack_40_dwell_rand_low[curr_row_index_40]=='EMPTY'))
        
        if(any(stack_40_dwell_rand_low=='EMPTY')){
          curr_col_index_40 <- sample(85, 1)
          while(all(stack_40_dwell_rand_low[, get(colnames(stack_40_dwell_rand_low)[curr_col_index_40])] !='EMPTY')){
            curr_col_index_40 <- sample(85, 1)
          }
          
          
          curr_row_index_40 <- min(which(stack_40_dwell_rand_low[, get(colnames(stack_40_dwell_rand_low)[curr_col_index_40])]=='EMPTY'))
          
          stack_40_dwell_rand_low[curr_row_index_40, curr_col_index_40] <<- curr_cont
          print(paste(curr_row_index_40, curr_col_index_40))
        }else{
          curr_col_index_40 <- sample(5, 1)
          while(all(stack_40_dwell_rand_low2[, get(colnames(stack_40_dwell_rand_low2)[curr_col_index_40])] !='EMPTY')){
            curr_col_index_40 <- sample(5, 1)
          }
          
          
          curr_row_index_40 <- min(which(stack_40_dwell_rand_low2[, get(colnames(stack_40_dwell_rand_low2)[curr_col_index_40])]=='EMPTY'))
          
          stack_40_dwell_rand_low2[curr_row_index_40, curr_col_index_40] <<- curr_cont
          print(paste(curr_row_index_40, curr_col_index_40))
        }
        
        
        
      }else{
        # curr_row_index_40 <- which.min(apply(stack_40_dwell_rand_high, 1, function(x){
        #   return(all(x !='EMPTY'))
        # }))
        # curr_col_index_40 <- min(which(stack_40_dwell_rand_high[curr_row_index_40]=='EMPTY'))
        
        curr_col_index_40 <- sample(30, 1)
        while(all(stack_40_dwell_rand_high[, get(colnames(stack_40_dwell_rand_high)[curr_col_index_40])] !='EMPTY')){
          curr_col_index_40 <- sample(30, 1)
        }
        
        
        curr_row_index_40 <- min(which(stack_40_dwell_rand_high[, get(colnames(stack_40_dwell_rand_high)[curr_col_index_40])]=='EMPTY'))
        
        
        stack_40_dwell_rand_high[curr_row_index_40, curr_col_index_40] <<- curr_cont
        print(paste(curr_row_index_40, curr_col_index_40))
        
      }
      
    }
  }
  
  if(length(curr_unloading_containers_20) > 0){
    for(curr_cont in curr_unloading_containers_20){
      print(curr_cont)
      
      curr_dwell_rand <- export_containers[CONTAINER_ID == curr_cont]$DWELL_TIME_PREDICTION_CLASS
      
      if(curr_dwell_rand == 4){
        curr_col_rep <- which(apply(stack_20_dwell_rand_low, 2, function(x){return(curr_cont %in% x)}))
        
        
        curr_stack <- stack_20_dwell_rand_low[, get(colnames(stack_20_dwell_rand_low)[curr_col_rep])]
        curr_row_rep <- which(curr_stack == curr_cont)
        
        
        if(curr_row_rep == length(curr_stack)){
          curr_stack_above <- c()
        }else{
          curr_stack_above <- curr_stack[(curr_row_rep+1):length(curr_stack)]
        }
        
        if(curr_row_rep == 1){
          curr_stack_below <- c()
        }else{
          curr_stack_below <- curr_stack[1:(curr_row_rep-1)]
        }
        
        stack_20_dwell_rand_low[, curr_col_rep] <<- c(curr_stack_below, curr_stack_above, 'EMPTY')
        
        curr_rehandles <- curr_rehandles + sum(curr_stack_above != 'EMPTY')
      }else{
        curr_col_rep <- which(apply(stack_20_dwell_rand_high, 2, function(x){return(curr_cont %in% x)}))
        
        
        curr_stack <- stack_20_dwell_rand_high[, get(colnames(stack_20_dwell_rand_high)[curr_col_rep])]
        curr_row_rep <- which(curr_stack == curr_cont)
        
        
        if(curr_row_rep == length(curr_stack)){
          curr_stack_above <- c()
        }else{
          curr_stack_above <- curr_stack[(curr_row_rep+1):length(curr_stack)]
        }
        
        if(curr_row_rep == 1){
          curr_stack_below <- c()
        }else{
          curr_stack_below <- curr_stack[1:(curr_row_rep-1)]
        }
        
        stack_20_dwell_rand_high[, curr_col_rep] <<- c(curr_stack_below, curr_stack_above, 'EMPTY')
        
        curr_rehandles <- curr_rehandles + sum(curr_stack_above != 'EMPTY')
      }
      
      
    }
  }
  
  
  if(length(curr_unloading_containers_40) > 0){
    for(curr_cont in curr_unloading_containers_40){
      print(curr_cont)
      
      curr_dwell_rand <- export_containers[CONTAINER_ID == curr_cont]$DWELL_TIME_PREDICTION_CLASS
      
      if(curr_dwell_rand == 4){
        curr_low_search <- apply(stack_40_dwell_rand_low, 2, function(x){return(curr_cont %in% x)})
        if(any(curr_low_search)){
          curr_col_rep <- which(curr_low_search)
          
          
          curr_stack <- stack_40_dwell_rand_low[, get(colnames(stack_40_dwell_rand_low)[curr_col_rep])]
          curr_row_rep <- which(curr_stack == curr_cont)
          
          
          if(curr_row_rep == length(curr_stack)){
            curr_stack_above <- c()
          }else{
            curr_stack_above <- curr_stack[(curr_row_rep+1):length(curr_stack)]
          }
          
          if(curr_row_rep == 1){
            curr_stack_below <- c()
          }else{
            curr_stack_below <- curr_stack[1:(curr_row_rep-1)]
          }
          
          stack_40_dwell_rand_low[, curr_col_rep] <<- c(curr_stack_below, curr_stack_above, 'EMPTY')
          
          curr_rehandles <- curr_rehandles + sum(curr_stack_above != 'EMPTY')
        }else{
          curr_col_rep <- which(apply(stack_40_dwell_rand_low2, 2, function(x){return(curr_cont %in% x)}))
          
          
          curr_stack <- stack_40_dwell_rand_low2[, get(colnames(stack_40_dwell_rand_low2)[curr_col_rep])]
          curr_row_rep <- which(curr_stack == curr_cont)
          
          
          if(curr_row_rep == length(curr_stack)){
            curr_stack_above <- c()
          }else{
            curr_stack_above <- curr_stack[(curr_row_rep+1):length(curr_stack)]
          }
          
          if(curr_row_rep == 1){
            curr_stack_below <- c()
          }else{
            curr_stack_below <- curr_stack[1:(curr_row_rep-1)]
          }
          
          stack_40_dwell_rand_low2[, curr_col_rep] <<- c(curr_stack_below, curr_stack_above, 'EMPTY')
          
          curr_rehandles <- curr_rehandles + sum(curr_stack_above != 'EMPTY')
        }
        
      }else{
        curr_col_rep <- which(apply(stack_40_dwell_rand_high, 2, function(x){return(curr_cont %in% x)}))
        
        
        curr_stack <- stack_40_dwell_rand_high[, get(colnames(stack_40_dwell_rand_high)[curr_col_rep])]
        curr_row_rep <- which(curr_stack == curr_cont)
        
        
        if(curr_row_rep == length(curr_stack)){
          curr_stack_above <- c()
        }else{
          curr_stack_above <- curr_stack[(curr_row_rep+1):length(curr_stack)]
        }
        
        if(curr_row_rep == 1){
          curr_stack_below <- c()
        }else{
          curr_stack_below <- curr_stack[1:(curr_row_rep-1)]
        }
        
        stack_40_dwell_rand_high[, curr_col_rep] <<- c(curr_stack_below, curr_stack_above, 'EMPTY')
        
        curr_rehandles <- curr_rehandles + sum(curr_stack_above != 'EMPTY')
      }
      
      
    }
  }
  
  rehandles_dwell_rand <<- rbind.data.frame(rehandles_dwell_rand,
                                       data.table(time_pt = time_point,
                                                  rehandles = curr_rehandles))
})


