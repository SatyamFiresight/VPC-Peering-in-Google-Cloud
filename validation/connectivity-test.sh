#!/bin/bash

# Set Project B (source VM)
gcloud config set project PROJECT_ID_B

echo "Fetching internal IP of vm-a from Project A..."

# Get internal IP of vm-a
VM_A_IP=$(gcloud compute instances describe vm-a \
  --zone=us-central1-a \
  --project=PROJECT_ID_A \
  --format='get(networkInterfaces[0].networkIP)')

echo "VM-A Internal IP: $VM_A_IP"

echo "Running connectivity test from vm-b..."

# SSH into vm-b and ping vm-a
gcloud compute ssh vm-b \
  --zone=us-central1-a \
  --command="ping -c 5 $VM_A_IP"

echo "Test completed"
