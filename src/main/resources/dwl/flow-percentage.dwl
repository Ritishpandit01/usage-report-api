%dw 2.0
output application/json
var planLimit = payload[0].payload.organization.entitlements.usageBasedPricing
var consumedFlow = payload[1].payload.data.mule_flow_count[0]
var totalFlow = planLimit.muleRuntimeIntegration.flows
---
round((consumedFlow/totalFlow) * 100)