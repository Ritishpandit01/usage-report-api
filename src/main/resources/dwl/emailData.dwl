%dw 2.0
output application/java
var subjectText = "⚠️ Action Required: MuleSoft Usage Threshold Alert!"
var organizationName = payload[0].payload.organization.name default "N/A"
var consumedFlow = vars.details.consumedFlow default 0
var totalFlow = vars.details.totalFlow default 0
var flowPercentage = vars.percentage default 0
var consumedVcore = vars.details.consumedvCore default 0
var alertThreshold = p('usage.percentage') default 80
var categoryType = payload[0].payload.organization.subscription.category ++ " " ++ payload[0].payload.organization.subscription."type" 
var usageDate = vars.dateTimeStamp.usageDate
var bodyText =
    "<html>" ++
    "<body>" ++

    "<p>Hello Team,</p>" ++

    "<p>This is an automated alert from the MuleSoft Usage Monitoring system.</p>" ++

    "<p>Your Anypoint Platform subscription usage has reached or exceeded the configured alert threshold.</p>" ++

    "<p><b>Usage Summary:</b></p>" ++

    "<p>" ++
    
	"<b>CategoryType:</b> " ++ categoryType ++ "<br/>" ++
	
    "<b>Organization:</b> " ++ organizationName ++ "<br/>" ++
    
	"<b>Usage Date:</b> " ++ usageDate ++ "<br/>" ++
	
    "<b>Current Mule Flow Usage:</b> " ++ (consumedFlow as String) ++ "<br/>" ++

    "<b>Mule Flow Limit:</b> " ++ (totalFlow as String) ++ "<br/>" ++

    "<b>Flow Usage Percentage:</b> " ++ (flowPercentage as String) ++ "%<br/>" ++

    "<b>Current vCore Usage:</b> " ++ (consumedVcore as String) ++ "<br/>" ++

    "<b>Configured Alert Threshold:</b> " ++ (alertThreshold as String) ++ "%" ++

    "</p>" ++

    "<p><b>Alert Status:</b> One or more usage metrics have reached or exceeded the configured threshold.</p>" ++

    "<p>Please review the current resource utilization in Anypoint Platform and take the necessary action to avoid reaching the subscription limit.</p>" ++

    "<p>This is an automated notification. Please do not reply to this email.</p>" ++

    "<p>Regards,<br/>" ++
    "MuleSoft Usage Monitoring System</p>" ++

    "</body>" ++
    "</html>"

---

mailActivityInput: {
    from: p('email.smtp.from.address'),
    to: p('email.smtp.to.address'),
    cc: p('email.smtp.cc.address'),
    subject: subjectText,

    bodyElement: {
        bodyText: bodyText
    },

    headers: {
        contentType: "text/html"
    }
}