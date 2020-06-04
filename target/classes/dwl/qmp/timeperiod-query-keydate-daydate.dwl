%dw 2.0
output application/java
---
"SELECT distinct timeperiod.PoolWeek as PoolWeek FROM MDR.M_TimePeriod timeperiod WHERE " ++
if(!isEmpty(attributes.queryParams.startdate) and !isEmpty(attributes.queryParams.enddate))
"timeperiod.KeyDate between coalesce(" ++ attributes.queryParams.startdate ++ "," ++ attributes.queryParams.enddate ++ ") and coalesce(" ++ attributes.queryParams.enddate ++ "," ++ attributes.queryParams.startdate ++ ")"
else if(!isEmpty(attributes.queryParams.daydate))
"timeperiod.DayDate = '" ++ attributes.queryParams.daydate ++ "'"
else
"1=2"