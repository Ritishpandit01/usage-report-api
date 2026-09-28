%dw 2.0
output application/json
import * from dw::core::Periods
var startTimestamp = vars.dateTimeStamp.startTimestamp //(startDateTime as DateTime) as Number {unit: "milliseconds"}
var endTimestamp = vars.dateTimeStamp.endTimestamp //(endDateTime as DateTime) as Number {unit: "milliseconds"}
---
"SELECT mule_flow_count FROM runtime_flow_count WHERE timestamp BETWEEN " ++ startTimestamp ++ " AND " ++ endTimestamp ++ " TIMESERIES P1D"