# 🚀 Multi-Project VPC Peering in Google Cloud

---

## 📌 Overview
This project demonstrates how to establish **private communication between two isolated VPC networks across different projects** using VPC Network Peering.

---

## 🎯 Objectives
- Create custom VPC networks in separate projects  
- Deploy VM instances in isolated environments  
- Establish secure VPC Peering  
- Validate private connectivity using ICMP  

---

## 🧱 Architecture
![Architecture Diagram](./architecture/architecture-diagram.png)

---

## ⚙️ Tech Stack
- **Cloud Provider:** Google Cloud Platform  
- **Services Used:**
  - VPC Networks  
  - Compute Engine  
  - Firewall Rules  
  - Cloud Shell  

---

## 🛠️ Implementation Steps

### 1. Create Networks
- Custom VPC in Project A  
- Custom VPC in Project B  

### 2. Deploy Resources
- VM instances in both networks  
- Firewall rules for SSH + ICMP  

### 3. Configure Peering
- Peer A → B  
- Peer B → A  

### 4. Validate Connectivity
- Ping between internal IPs  

---

## 📊 Results
| Test | Result |
|------|--------|
| Peering Status | ✅ ACTIVE |
| VM Communication | ✅ Success |
| Packet Loss | 0% |

---

## 🔐 Key Benefits
- No public IP exposure  
- Reduced latency  
- Lower cost vs VPN  
- Secure internal communication  

---

## ⚠️ Challenges
- Peering requires **bi-directional setup**  
- Firewall rules must allow ICMP  
- Routes are auto-generated  

---

## 💡 Future Improvements
- Terraform automation  
- Multi-region setup  
- Monitoring with Cloud Logging  
