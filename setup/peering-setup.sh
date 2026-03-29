#!/bin/bash

# Set Project A
gcloud config set project PROJECT_ID_A

# Create Peering from A → B
gcloud compute networks peerings create peer-ab \
  --network=network-a \
  --peer-project=PROJECT_ID_B \
  --peer-network=network-b

echo "Peering A -> B created"

# Set Project B
gcloud config set project PROJECT_ID_B

# Create Peering from B → A
gcloud compute networks peerings create peer-ba \
  --network=network-b \
  --peer-project=PROJECT_ID_A \
  --peer-network=network-a

echo "Peering B -> A created"
