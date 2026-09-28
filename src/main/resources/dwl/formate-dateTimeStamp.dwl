%dw 2.0
output application/json
import * from dw::core::Periods
var targetDate = (now() - days(1)) as Date
//var	targetDate = vars.date
var startDateTime = targetDate as String ++ "T00:00:00Z"
var endDateTime = targetDate as String ++ "T23:59:59.999Z"
---
{
	usageDate : targetDate,
	startTimestamp : (startDateTime as DateTime) as Number {unit: "milliseconds"},
	endTimestamp : (endDateTime as DateTime) as Number {unit: "milliseconds"}
}