## Deployment Regions

- Primary: East US (`eastus`)
- Secondary: West US 2 (`westus2`)

The original plan used West US (`westus`) as the secondary region.
During deployment, Azure rejected that region with
`RequestDisallowedByAzure` because it was outside this Azure for Students
subscription's permitted deployment regions.

West US 2 was permitted, so the secondary deployment was moved there.
The East US resources created before the failure were retained.
Terraform then created the secondary network and subnet successfully.

Region permissions can vary by subscription. Check your subscription's
allowed regions before deploying.