%dw 2.0
output application/json
---
{
	planLimit : payload[0].payload.organization.entitlements.usageBasedPricing,
	consumedFlow : payload[1].payload.data.mule_flow_count[0],
	totalFlow : payload[0].payload.organization.entitlements.usageBasedPricing.muleRuntimeIntegration.flows,
    consumedvCore: (payload[2].payload.data.total_vcore_usage[0]) as String {format: "0.00"},
    consumedMuleMessage: payload[3].payload.data.mule_message_count[0],
}