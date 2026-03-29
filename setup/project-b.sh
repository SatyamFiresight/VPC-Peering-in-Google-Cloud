#!/bin/bash

# Set Project B
gcloud config set project PROJECT_ID_B

# Create VPC Network
gcloud compute networks create network-b \
  --subnet-mode=custom

# Create Subnet
gcloud compute networks subnets create network-b-subnet \
  --network=network-b \
  --range=10.8.0.0/16 \
  --region=us-central1

# Create VM Instance
gcloud compute instances create vm-b \
  --zone=us-central1-a \
  --network=network-b \
  --subnet=network-b-subnet \
  --machine-type=e2-small

# Create Firewall Rules
gcloud compute firewall-rules create network-b-fw \
  --network=network-b \
  --allow=tcp:22,icmp

echo "Project B setup completed"
