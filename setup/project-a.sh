#!/bin/bash

# Set Project A
gcloud config set project PROJECT_ID_A

# Create VPC Network
gcloud compute networks create network-a \
  --subnet-mode=custom

# Create Subnet
gcloud compute networks subnets create network-a-subnet \
  --network=network-a \
  --range=10.0.0.0/16 \
  --region=us-central1

# Create VM Instance
gcloud compute instances create vm-a \
  --zone=us-central1-a \
  --network=network-a \
  --subnet=network-a-subnet \
  --machine-type=e2-small

# Create Firewall Rules
gcloud compute firewall-rules create network-a-fw \
  --network=network-a \
  --allow=tcp:22,icmp

echo "Project A setup completed"
