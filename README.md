# 🌐 VPC Peering in Google Cloud (GCP)

## 📌 Overview

This project demonstrates **VPC Network Peering between two separate Google Cloud projects**, enabling private communication between resources without using public IPs.

---

## 🏗️ Architecture

![Architecture](architecture/vpc-peering-architecture.png)

---

## 🧠 Key Concepts Covered

* VPC Network Peering (cross-project)
* Custom VPC networks
* Subnet configuration
* Firewall rules (ICMP + SSH)
* Route propagation via peering
* Private VM-to-VM communication

---

## ⚙️ Environment Details

| Component    | Network A                    | Network B                    |
| ------------ | ---------------------------- | ---------------------------- |
| Project ID   | qwiklabs-gcp-02-07e61c8e8fe2 | qwiklabs-gcp-01-cc82102d8396 |
| VPC Network  | network-a                    | network-b                    |
| Subnet Range | 10.0.0.0/16                  | 10.8.0.0/16                  |
| VM Instance  | vm-a (10.0.0.2)              | vm-b (10.8.0.2)              |

---

## 🔧 Implementation Steps

### 1. Create VPC Networks

Two custom VPC networks were created in separate projects.
  * `network-a`
  * `network-b`


![VPC Networks](screenshots/vpc-networks.png)

---

### 2. Configure Subnets

Each VPC was assigned a non-overlapping CIDR range.
* network-a → `10.0.0.0/16`
* network-b → `10.8.0.0/16`

![Subnets](screenshots/subnets.png)

---

### 3. Create Firewall Rules

* Allowed traffic:
  * SSH (`tcp:22`)
  * ICMP (ping)

![Firewall Rules](screenshots/firewall-rules.png)

---

### 4. Configure VPC Peering

* Peering was configured in both directions:

- Network A → Network B
- Network B → Network A

Status: **Active**

![Peering](screenshots/peering-active.png)

---

### 5. Verify Routes

* Peering routes automatically created
* Verified:

  * 10.0.0.0/16
  * 10.8.0.0/16

![Routes](screenshots/routes.png)

---

### 6. Deploy VM Instances

* vm-a → network-a
* vm-b → network-b

![VM Instances](screenshots/vm-instances.png)

---

## ✅ Connectivity Testing

### 🔁 Ping from Network A → Network B

```bash
ping 10.8.0.2
```

![Ping A to B](screenshots/ping-success-a-to-b.png)

---

### 🔁 Ping from Network B → Network A

```bash
ping 10.0.0.2
```

![Ping B to A](screenshots/ping-success-b-to-a.png)

---

## 🎯 Result

✔ **Private VM-to-VM communication established across projects**  
✔ **No public internet exposure (secure internal traffic only)**  
✔ **Dynamic routing achieved using VPC peering**  
✔ **Firewall rules enforced for controlled access**

---

## 📁 Project Structure

```
.
├── architecture/
├── screenshots/
├── setup/
├── validation/
└── README.md
```

---

## 🚀 Key Takeaways

* VPC Peering enables **low-latency private communication**
* Works across **different projects**
* Requires:

  * Non-overlapping CIDR ranges
  * Firewall configuration
  * Route propagation
* No transitive peering (important limitation)

---

## 📌 Author

Satyam
