# 🚀 Multi-Project VPC Peering in Google Cloud

---

## 📌 Overview
This project demonstrates how to establish **private communication between two isolated VPC networks across different projects** using VPC Network Peering.

---

## 🧱 Architecture

![VPC Peering Architecture](./architecture/vpc-peering-architecture.png)

### 🔍 Architecture Explanation

This architecture establishes **private communication between two isolated VPC networks across different projects** using VPC Network Peering.

### 🧩 Components

- **Project A**
  - Custom VPC: `network-a`
  - Subnet: `10.0.0.0/16`
  - VM Instance: `vm-a`

- **Project B**
  - Custom VPC: `network-b`
  - Subnet: `10.8.0.0/16`
  - VM Instance: `vm-b`

- **VPC Peering**
  - Peer connection: `peer-ab` and `peer-ba`
  - Enables bidirectional communication using **internal IPs only**

---

### 🔄 Traffic Flow

1. VM in Project B sends request to internal IP of VM in Project A  
2. Traffic stays within Google’s private network  
3. Routing tables exchange CIDR blocks automatically  
4. No public internet involvement  

---

### 🔐 Security Design

- No public IP exposure  
- Communication via private IP ranges  
- Firewall rules restrict access (SSH + ICMP only)  

---

### ⚡ Key Design Decisions

| Decision | Reason |
|---------|--------|
| VPC Peering instead of VPN | Lower latency & no encryption overhead |
| Separate Projects | Isolation & multi-team architecture |
| Internal IP Communication | Enhanced security |

---

### ⚠️ Limitations

- ❌ No transitive peering  
- ❌ Overlapping CIDR blocks not allowed  
- ❌ No centralized hub routing  

---

### 💡 Real-World Use Case

- SaaS provider exposing services privately to client VPCs  
- Multi-team architecture within large organizations  
- Mergers where separate networks need secure integration  
---

## 💡 Future Improvements
- Terraform automation  
- Multi-region setup  
- Monitoring with Cloud Logging  
