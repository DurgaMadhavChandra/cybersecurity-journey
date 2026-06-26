# Week 04 — Networking Fundamentals Notes

---

## 1. The OSI Model — All 7 Layers

### What is the OSI Model?
A 7-layer conceptual framework describing how data moves from one device to another across a network.
Used to troubleshoot, design, and reason about networking issues by isolating *where* a problem lives.

### The 7 Layers
| # | Layer | PDU (Data Unit) | Function | Examples |
|---|-------|------------------|----------|----------|
| 7 | Application | Data | User-facing services | HTTP, FTP, SMTP, DNS |
| 6 | Presentation | Data | Formatting, encryption, compression | SSL/TLS, JPEG, ASCII |
| 5 | Session | Data | Establishes/maintains/ends sessions | NetBIOS, RPC |
| 4 | Transport | Segment (TCP) / Datagram (UDP) | End-to-end delivery, reliability | TCP, UDP |
| 3 | Network | Packet | Logical addressing, routing | IP, ICMP, routers |
| 2 | Data Link | Frame | Physical addressing, framing | Ethernet, MAC, switches |
| 1 | Physical | Bits | Raw transmission of bits | Cables, hubs, NICs, radio waves |

### Mnemonics
```
Top-down:    All People Seem To Need Data Processing
Bottom-up:   Please Do Not Throw Sausage Pizza Away
```

### Why It Matters for Cybersecurity
- Attacks map to layers — DDoS often targets L3/L4, XSS/SQLi target L7
- Packet captures in Wireshark are read layer by layer
- Firewalls differ by depth: stateless ACLs work at L3/L4, NGFWs/proxies inspect up to L7

### Key Takeaway
> Every troubleshooting question is really "which layer is broken?"
> Learn the OSI model cold — it's the map you'll use for the rest of your career.

---

## 2. Network Appliances & Functions

### Core Devices
| Device | Function |
|--------|----------|
| Router | Routes packets between networks (L3) |
| Switch | Forwards frames within a LAN using MAC addresses (L2) |
| Firewall | Filters traffic based on rules/policies |
| Load Balancer | Distributes traffic across multiple servers |
| Proxy Server | Forwards requests on behalf of clients, can cache/filter |
| IDS/IPS | Detects (IDS) or actively blocks (IPS) malicious traffic |
| VPN Concentrator | Terminates and manages many VPN tunnels |
| Access Point (AP) | Provides wireless connectivity to a wired LAN |

### VPNs
```
Site-to-Site VPN   → connects two networks (office to office)
Client-to-Site VPN → connects a single remote user to a network
IPSec VPN          → operates at network layer, strong encryption
SSL/TLS VPN        → operates at higher layers, browser-friendly
```

### CDN (Content Delivery Network)
Distributes cached content across geographically dispersed servers to reduce latency and load.

### QoS (Quality of Service)
Prioritizes certain traffic types (e.g., VoIP, video) over others.
```
Traffic shaping     → smooths bursts to fit bandwidth limits
Traffic policing    → drops/marks traffic exceeding limits
DSCP marking        → tags packets with priority values
```

### Why It Matters for Cybersecurity
- IDS/IPS placement and tuning is core to detection engineering
- Misconfigured proxies/load balancers can leak internal topology
- VPN concentrators are high-value targets — weak configs = network-wide access

### Key Takeaway
> Every appliance on the network is also a potential attack surface.
> Know what each device does — and what happens when it's misconfigured.

---

## 3. Cloud Networking — SaaS, PaaS, IaaS, NFV, SDN

### Cloud Service Models
| Model | What's Managed by Provider | What You Manage | Example |
|-------|----------------------------|------------------|---------|
| IaaS | Hardware, virtualization, network | OS, apps, data | AWS EC2, Azure VMs |
| PaaS | + OS, runtime | Apps, data | Heroku, AWS Elastic Beanstalk |
| SaaS | Everything | Just usage/data | Gmail, Salesforce, Microsoft 365 |

### NFV — Network Functions Virtualization
Replaces dedicated hardware (routers, firewalls, load balancers) with virtualized software instances running on commodity servers.

### SDN — Software-Defined Networking
Separates the **control plane** (decision-making) from the **data plane** (packet forwarding), allowing centralized, programmable network management.
```
Control Plane   → makes routing/forwarding decisions (the "brain")
Data Plane      → actually forwards the traffic (the "muscle")
```

### Cloud Networking Concepts
```
VPC (Virtual Private Cloud)   → isolated private network inside a public cloud
Security Group                → virtual firewall for cloud instances
Hybrid Cloud                  → mix of on-prem + cloud
Multi-cloud                   → using more than one cloud provider
```

### Why It Matters for Cybersecurity
- Misconfigured S3 buckets / security groups are a top cause of cloud breaches
- SDN centralizes control — also centralizes risk if the controller is compromised
- Shared responsibility model shifts depending on IaaS/PaaS/SaaS

### Key Takeaway
> The cloud doesn't remove security responsibility — it redistributes it.
> Know exactly where the provider's job ends and yours begins.

---

## 4. Ports & Protocols — TCP vs UDP, Common Ports, ICMP

### TCP vs UDP
| Feature | TCP | UDP |
|---------|-----|-----|
| Connection | Connection-oriented (3-way handshake) | Connectionless |
| Reliability | Guaranteed delivery, ordered | Best-effort, no guarantee |
| Speed | Slower (overhead) | Faster (lightweight) |
| Use Case | Web, email, file transfer | Streaming, VoIP, DNS queries |

### TCP 3-Way Handshake
```
Client → SYN     → Server
Server → SYN-ACK → Client
Client → ACK     → Server
```

### Common Ports
| Port | Protocol | Service |
|------|----------|---------|
| 20/21 | TCP | FTP (data/control) |
| 22 | TCP | SSH |
| 23 | TCP | Telnet |
| 25 | TCP | SMTP |
| 53 | TCP/UDP | DNS |
| 67/68 | UDP | DHCP |
| 80 | TCP | HTTP |
| 110 | TCP | POP3 |
| 123 | UDP | NTP |
| 143 | TCP | IMAP |
| 161/162 | UDP | SNMP |
| 389 | TCP | LDAP |
| 443 | TCP | HTTPS |
| 445 | TCP | SMB |
| 3389 | TCP | RDP |

### ICMP
Used for diagnostics and error reporting — not for general data transport.
```bash
ping 8.8.8.8          # Echo request/reply (ICMP)
traceroute 8.8.8.8    # Uses ICMP/UDP to map the path
```

### Why It Matters for Cybersecurity
- Port scanning (`nmap`) enumerates open services for recon
- Knowing default ports lets you spot unusual activity instantly (e.g., SSH on port 4444)
- ICMP is abused in ping floods and ICMP tunneling for covert channels

### Key Takeaway
> Ports and protocols are the address labels of the internet.
> Memorize the common ones — you'll read them every single day in this field.

---

## 5. Transmission Media — Copper, Fiber, Wireless Standards

### Copper Cabling
| Category | Max Speed | Max Distance |
|----------|-----------|---------------|
| Cat5e | 1 Gbps | 100m |
| Cat6 | 1–10 Gbps | 55–100m |
| Cat6a | 10 Gbps | 100m |
| Cat7/8 | 10–40 Gbps | 30–100m |

```
UTP  → Unshielded Twisted Pair (most common, office use)
STP  → Shielded Twisted Pair (better noise resistance)
```

### Fiber Optic
| Type | Distance | Use Case |
|------|----------|----------|
| Single-mode | Long (km) | Long-haul, ISP backbones |
| Multi-mode | Short (m) | Data center, campus |

### Wireless Standards
| Standard | Frequency | Max Speed |
|----------|-----------|-----------|
| 802.11a | 5 GHz | 54 Mbps |
| 802.11b | 2.4 GHz | 11 Mbps |
| 802.11g | 2.4 GHz | 54 Mbps |
| 802.11n | 2.4/5 GHz | 600 Mbps |
| 802.11ac | 5 GHz | ~1.3 Gbps |
| 802.11ax (Wi-Fi 6) | 2.4/5/6 GHz | ~9.6 Gbps |

### Why It Matters for Cybersecurity
- Physical media choice affects eavesdropping risk (fiber is harder to tap than copper/wireless)
- Wireless signal leakage outside a building is a real attack surface
- Cable specs matter when assessing what's even achievable on a network (bottlenecks vs attacks)

### Key Takeaway
> The physical layer is invisible until it fails — or until someone exploits it.
> Know your media, know your limits.

---

## 6. Network Topologies & Architectures

### Common Topologies
| Topology | Description |
|----------|--------------|
| Star | All devices connect to a central switch/hub |
| Mesh | Every device connects to every other device |
| Hybrid | Combination of multiple topologies |
| Bus | All devices share a single cable (legacy) |
| Ring | Devices connected in a closed loop (legacy) |

### Data Center Architectures
```
Three-Tier   → Core → Distribution → Access layers
Collapsed Core → Distribution and Core merged (smaller networks)
Spine-Leaf   → Every leaf switch connects to every spine switch (modern data centers)
```

### Why It Matters for Cybersecurity
- Topology determines blast radius — flat networks let an attacker pivot freely
- Spine-leaf and segmentation strategies are foundational to Zero Trust design
- Understanding architecture helps you read network diagrams during incident response

### Key Takeaway
> Topology isn't just wiring diagrams — it's the blueprint of how far an attacker can move.
> Segment well, and you contain damage before it spreads.

---

## 7. IPv4 Addressing & Subnetting

### IPv4 Basics
A 32-bit address split into 4 octets, written in dotted decimal (e.g., `192.168.1.1`).

### Classful Addressing
| Class | Range | Default Mask |
|-------|-------|----------------|
| A | 1–126 | /8 (255.0.0.0) |
| B | 128–191 | /16 (255.255.0.0) |
| C | 192–223 | /24 (255.255.255.0) |
| D | 224–239 | Multicast |
| E | 240–255 | Experimental |

### Classless Addressing (CIDR/VLSM)
CIDR notation (`/24`) replaces fixed class boundaries, allowing flexible subnet sizes.

### Subnetting Example
```
Network: 192.168.1.0/26
Subnet mask: 255.255.255.192
Usable hosts per subnet: 2^6 - 2 = 62

Subnets:
192.168.1.0/26    → hosts .1   - .62
192.168.1.64/26   → hosts .65  - .126
192.168.1.128/26  → hosts .129 - .190
192.168.1.192/26  → hosts .193 - .254
```

### CIDR Quick Reference
| CIDR | Mask | Usable Hosts |
|------|------|---------------|
| /24 | 255.255.255.0 | 254 |
| /25 | 255.255.255.128 | 126 |
| /26 | 255.255.255.192 | 62 |
| /27 | 255.255.255.224 | 30 |
| /28 | 255.255.255.240 | 14 |
| /30 | 255.255.255.252 | 2 |

### Why It Matters for Cybersecurity
- Subnetting underpins network segmentation, a core defense-in-depth control
- Misread subnet boundaries lead to real firewall/ACL misconfigurations
- Scoping a pentest or scan requires fluent CIDR math

### Key Takeaway
> Subnetting math feels painful at first — but it becomes muscle memory.
> Every firewall rule and every segmentation strategy depends on getting this right.

---

## 8. IPv6 Addressing

### IPv6 Basics
A 128-bit address written in 8 groups of hexadecimal, separated by colons.
```
2001:0db8:0000:0000:0000:ff00:0042:8329
2001:db8::ff00:42:8329     # compressed form (zero groups collapsed with ::)
```

### Address Types
| Type | Description |
|------|--------------|
| Unicast | One-to-one communication |
| Multicast | One-to-many communication |
| Anycast | One-to-nearest communication |
| Link-Local | `fe80::/10` — auto-assigned, not routable beyond the local link |

### SLAAC & NDP
```
SLAAC (Stateless Address Autoconfiguration) → hosts self-assign addresses using router advertisements
NDP (Neighbor Discovery Protocol)           → IPv6's replacement for ARP
```

### IPv4-to-IPv6 Transition Methods
```
Dual Stack   → device runs IPv4 and IPv6 simultaneously
Tunneling    → IPv6 traffic encapsulated inside IPv4 (e.g., 6to4, Teredo)
NAT64        → translates between IPv6-only and IPv4-only networks
```

### Why It Matters for Cybersecurity
- IPv6 is often left unmonitored on networks that "only run IPv4" — a blind spot for attackers to exploit
- NDP has no built-in authentication, making it vulnerable to spoofing (similar to ARP)
- Tunneling protocols can be used to bypass IPv4-only firewall rules

### Key Takeaway
> IPv6 isn't optional anymore — and neither is securing it.
> An unmonitored protocol is an open door.

---

## 9. Routing Technologies

### Static vs Dynamic Routing
| Type | Description | Pros | Cons |
|------|--------------|------|------|
| Static | Manually configured routes | Predictable, secure | Doesn't scale, no auto-failover |
| Dynamic | Routers exchange routes automatically | Scales, adapts to changes | More complex, larger attack surface |

### Common Routing Protocols
```
RIP    → distance-vector, simple, limited to small networks
OSPF   → link-state, fast convergence, widely used internally
EIGRP  → Cisco-proprietary, hybrid
BGP    → path-vector, runs the internet's backbone (inter-AS routing)
```

### NAT (Network Address Translation)
```
SNAT (Source NAT) → translates the source (private) IP to a public IP
DNAT (Destination NAT) → translates the destination IP (e.g., port forwarding)
PAT (Port Address Translation) → many private IPs share one public IP via ports
```

### Why It Matters for Cybersecurity
- BGP hijacking is a real-world attack that can reroute global traffic
- NAT provides a side benefit of obscuring internal addressing from outside scans
- Route poisoning/injection attacks exploit weak dynamic routing authentication

### Key Takeaway
> Routing decides where your traffic actually goes.
> Trust the routing table blindly, and an attacker can quietly redirect everything.

---

## 10. Switching Technologies — VLANs, Trunking, STP

### VLANs (Virtual LANs)
Logically segments a single physical switch into multiple isolated broadcast domains.
```
VLAN 10  → Sales
VLAN 20  → Engineering
VLAN 99  → Management (often isolated from user VLANs)
```

### Trunking — 802.1Q
Allows multiple VLANs to travel across a single physical link by tagging frames with a VLAN ID.

### STP (Spanning Tree Protocol)
Prevents Layer 2 loops in redundant switched networks by blocking redundant paths.
```
Root Bridge       → the reference switch all paths are calculated from
Blocking State    → STP disables a redundant link to prevent a loop
Convergence       → time taken for STP to settle into a stable topology
```

### Port Security
```
Restricts which MAC addresses can connect to a switch port
Limits the number of MAC addresses learned per port
Shuts down or restricts a port on a security violation
```

### Why It Matters for Cybersecurity
- VLAN hopping attacks exploit misconfigured trunking to jump between segments
- STP manipulation attacks can force traffic through an attacker-controlled switch
- Port security is a cheap, effective control against rogue device connections

### Key Takeaway
> VLANs create the illusion of separate networks on shared hardware.
> Get the trunking and tagging wrong, and that illusion breaks wide open.

---

## 11. Wireless Devices

### Key Concepts
```
SSID (Service Set Identifier) → the network name broadcast by an AP
BSSID                          → MAC address of the specific AP
ESSID                          → SSID shared across multiple APs (roaming)
```

### Wireless Encryption Standards
| Standard | Security Level | Notes |
|----------|-----------------|-------|
| WEP | Broken | Easily cracked, never use |
| WPA | Weak | Improved over WEP, still flawed |
| WPA2 | Strong | AES-based, industry standard for years |
| WPA3 | Strongest | Forward secrecy, resistant to offline attacks |

### Network Types
```
Ad Hoc          → devices connect directly to each other, no AP
Infrastructure  → devices connect through a central AP
Mesh            → multiple APs cooperate to extend coverage seamlessly
```

### Why It Matters for Cybersecurity
- WEP/WPA networks are still found in the wild and are trivially crackable
- Rogue APs mimicking legitimate SSIDs are a common social-engineering/MITM vector
- Wireless surveys reveal signal leakage that extends an attacker's range

### Key Takeaway
> Wireless removes the cable — but not the need for strong authentication and encryption.
> If you wouldn't trust an open door, don't trust an open SSID.

---

## 12. Physical Installations — Data Center Design

### Data Center Essentials
```
Rack Units (U)        → standard measurement for rack-mounted equipment height
Hot Aisle/Cold Aisle   → airflow design to manage cooling efficiently
Redundant Power Paths  → multiple power feeds avoid single points of failure
```

### Power Considerations
| Component | Purpose |
|-----------|---------|
| UPS | Short-term battery backup during outages |
| PDU | Distributes power to racks/devices |
| Generator | Long-term backup power |

### Environmental Controls
```
HVAC          → temperature and humidity control
Fire suppression → clean-agent systems (avoids damaging equipment)
Cable management → reduces airflow obstruction and human error
```

### Why It Matters for Cybersecurity
- Physical security (badge access, mantraps, cameras) is part of defense-in-depth
- Environmental failures (cooling, power) can cause outages as damaging as a cyberattack
- Poor cable management hides rogue devices and complicates incident response

### Key Takeaway
> No firewall rule protects against someone walking into an unlocked server room.
> Physical security is still security.

---

## 13. Processes & Procedures

### Documentation Types
```
Network Diagrams        → visual map of physical/logical topology
Baseline Configurations → "known good" reference state of a system
Wiring/Rack Diagrams     → physical cable and rack layouts
```

### Change Management
```
Request → Review → Approve → Implement → Document → Review again
```
Prevents undocumented changes from causing outages or security gaps.

### Configuration Management
```
Maintains consistency across devices using standardized configs
Tools: Ansible, Puppet, Chef, SaltStack
```

### Why It Matters for Cybersecurity
- Baseline configs make it possible to detect unauthorized changes (drift detection)
- Change management creates an audit trail required for compliance
- Good documentation dramatically speeds up incident response

### Key Takeaway
> Undocumented networks are unmanageable networks.
> What isn't written down can't be defended consistently.

---

## 14. Network Monitoring

### SNMP (Simple Network Management Protocol)
```
SNMP Manager   → central system collecting data
SNMP Agent     → runs on the monitored device
MIB            → Management Information Base, structure of available data
Trap           → agent proactively alerts the manager of an event
```
| Version | Security |
|---------|----------|
| SNMPv1/v2c | Plaintext community strings (weak) |
| SNMPv3 | Authentication + encryption |

### Logs & Flow Data
```
Syslog   → centralized logging standard for network devices
NetFlow  → records traffic flow metadata (who talked to whom, how much)
```

### Monitoring Tools
Examples: SolarWinds, PRTG, Nagios, Zabbix.

### Why It Matters for Cybersecurity
- SNMPv1/v2c community strings are frequently left as defaults — easy recon target
- Centralized syslog is essential for correlating events during an incident
- NetFlow data helps detect anomalies (data exfiltration, beaconing) without full packet capture

### Key Takeaway
> You can't defend what you can't see.
> Monitoring isn't optional overhead — it's your early warning system.

---

## 15. Disaster Recovery

### Redundancy Concepts
```
N+1   → one extra unit beyond what's needed
2N    → fully duplicated, independent systems
```

### Site Resiliency
| Site Type | Readiness | Cost |
|-----------|-----------|------|
| Hot Site | Fully operational, real-time data | High |
| Warm Site | Partially configured, needs setup | Medium |
| Cold Site | Empty space, bring your own gear | Low |

### Key Metrics
```
RPO (Recovery Point Objective) → maximum acceptable data loss (time)
RTO (Recovery Time Objective)  → maximum acceptable downtime
```

### Backups
```
Full backup        → complete copy every time
Incremental backup → only changes since last backup
Differential backup → changes since last full backup
```

### Why It Matters for Cybersecurity
- Ransomware response depends entirely on tested, isolated backups
- RPO/RTO targets drive real architecture decisions, not just paperwork
- Untested DR plans often fail exactly when they're needed most

### Key Takeaway
> Disaster recovery plans are worthless until they're tested.
> Assume failure will happen — the only question is whether you're ready.

---

## 16. IP Services — DHCP, DNS, NTP

### DHCP — Dynamic Host Configuration Protocol
Automatically assigns IP addresses and network settings.
```
DORA process:
Discover → client broadcasts for a DHCP server
Offer    → server offers an IP address
Request  → client requests the offered IP
Ack      → server confirms the lease
```

### DNS — Domain Name System
Translates human-readable names into IP addresses.
| Record Type | Purpose |
|-------------|---------|
| A | Maps hostname to IPv4 address |
| AAAA | Maps hostname to IPv6 address |
| CNAME | Alias for another hostname |
| MX | Mail server for a domain |
| TXT | Arbitrary text (often used for verification/SPF) |
| NS | Authoritative name servers for a domain |

### NTP — Network Time Protocol
Synchronizes clocks across devices — critical for accurate logging and certificate validation.

### Why It Matters for Cybersecurity
- Rogue DHCP servers can redirect clients to malicious gateways/DNS
- DNS poisoning/spoofing redirects users to attacker-controlled sites
- Inaccurate time (NTP) breaks log correlation and can invalidate forensic timelines

### Key Takeaway
> DHCP, DNS, and NTP are invisible until they fail — and devastating when attacked.
> These "boring" services are some of the highest-leverage targets on a network.

---

## 17. Network Access — VPNs, Remote Access, SSH

### Remote Access Methods
```
VPN          → encrypted tunnel into a private network
RDP          → graphical remote desktop access (Windows)
SSH          → encrypted remote shell access (Linux/network devices)
Jump Box/Bastion Host → hardened intermediary for accessing sensitive systems
```

### VPN Types Recap
```
Site-to-Site VPN   → connects networks
Client-to-Site VPN → connects individual remote users
Split Tunnel VPN   → only some traffic goes through the VPN
Full Tunnel VPN     → all traffic goes through the VPN
```

### SSH Essentials
```bash
ssh user@host                # connect
ssh -i key.pem user@host      # connect with a private key
scp file.txt user@host:/tmp/  # secure copy
```

### Why It Matters for Cybersecurity
- Exposed RDP (port 3389) is one of the most commonly exploited remote-access services
- Split tunneling can leak corporate traffic onto unsecured local networks
- SSH key management failures (weak keys, reused keys) are a frequent root cause of breaches

### Key Takeaway
> Remote access is convenience and risk wearing the same coat.
> Every door you open for legitimate users is a door an attacker will also try.

---

## 18. Security Concepts — AAA, Authentication, Compliance

### AAA Framework
```
Authentication → who are you? (passwords, certificates, biometrics)
Authorization  → what are you allowed to do?
Accounting     → what did you actually do? (logging)
```

### AAA Protocols
| Protocol | Notes |
|----------|-------|
| RADIUS | UDP, widely used for network device/Wi-Fi auth |
| TACACS+ | TCP, Cisco-favored, encrypts entire payload |

### MFA (Multi-Factor Authentication)
```
Something you know  → password
Something you have  → token, phone, smart card
Something you are   → biometrics
```

### Compliance Frameworks
```
PCI-DSS  → payment card data
HIPAA    → healthcare data (US)
GDPR     → personal data (EU)
```

### Why It Matters for Cybersecurity
- AAA is the foundation every access-control system is built on
- MFA dramatically reduces the success rate of credential-based attacks
- Compliance frameworks often dictate the *minimum* required security controls

### Key Takeaway
> Authentication proves identity, authorization proves permission, accounting proves it happened.
> Skip any one of the three and your access control story falls apart.

---

## 19. Attack Types

### Common Network Attacks
| Attack | Description |
|--------|--------------|
| DoS/DDoS | Overwhelms a target with traffic/requests |
| VLAN Hopping | Exploits trunking misconfig to access other VLANs |
| ARP Poisoning | Sends forged ARP replies to intercept LAN traffic |
| DNS Poisoning | Corrupts DNS cache/responses to redirect users |
| On-Path (MITM) | Intercepts traffic between two parties |
| Rogue DHCP/AP | Attacker-controlled device impersonates a legitimate one |
| Malware | Viruses, worms, trojans, ransomware, etc. |
| Social Engineering | Manipulates people rather than systems |

### Why It Matters for Cybersecurity
- These are the exact attack types tested in every entry-level security cert and seen in real incidents
- Each attack maps to a specific defensive control (e.g., DAI defends against ARP poisoning, DHCP snooping against rogue DHCP)
- Recognizing attack patterns in logs/captures is a core SOC analyst skill

### Key Takeaway
> Every defense exists because an attack came first.
> Learn the attacks, and the purpose of every security control suddenly makes sense.

---

## 20. Security Features — Firewall Rules, ACLs, Device Security

### Firewall Types
| Type | Description |
|------|--------------|
| Stateless | Filters based on static rules only (no connection awareness) |
| Stateful | Tracks connection state, smarter filtering |
| NGFW (Next-Gen) | Adds application awareness, IPS, deep packet inspection |

### ACLs (Access Control Lists)
```
permit tcp any host 192.168.1.10 eq 443
deny ip any any
```
Processed top-down — first match wins, implicit deny at the end.

### DMZ (Demilitarized Zone)
A buffer network segment exposing public-facing services while isolating the internal network.

### NAC (Network Access Control)
Enforces policy compliance (e.g., updated antivirus, patched OS) before granting network access.

### Why It Matters for Cybersecurity
- ACL ordering mistakes are one of the most common real-world misconfigurations
- DMZs limit blast radius if a public-facing service is compromised
- NAC stops non-compliant or rogue devices before they ever touch the internal network

### Key Takeaway
> A firewall rule you don't understand is a firewall rule you can't trust.
> Read every rule like it's the only thing standing between you and a breach.

---

## 21. Troubleshooting Methodology

### The 7-Step Process
```
1. Identify the problem
2. Establish a theory of probable cause
3. Test the theory
4. Establish a plan of action
5. Implement the solution
6. Verify full system functionality
7. Document findings, actions, and outcomes
```

### Why It Matters for Cybersecurity
- Incident response follows nearly the same structured methodology
- Skipping the "document" step is one of the biggest real-world process failures
- A structured approach prevents random guesswork during high-pressure outages

### Key Takeaway
> Troubleshooting isn't about being the smartest person in the room —
> it's about following a process that doesn't depend on guessing right the first time.

---

## 22. Physical & Performance Issues

### Cable & Interface Issues
```
Attenuation   → signal weakens over distance
Crosstalk     → interference between adjacent wires
Interference (EMI) → external electrical noise disrupts signal
Open/Short    → physical cable faults
Bad Port/NIC  → hardware failure at the interface level
```

### Performance Issues
```
Latency      → delay in data transmission
Jitter       → variation in latency (bad for VoIP/video)
Bottleneck   → a single point limiting overall throughput
Bandwidth Saturation → link is at/near capacity
```

### Wireless-Specific Issues
```
Channel Overlap   → adjacent APs interfere on the same channel
Interference      → microwaves, cordless phones, other 2.4GHz devices
Signal Attenuation → walls, distance, obstructions weaken signal
```

### Why It Matters for Cybersecurity
- Unexplained latency/jitter spikes can indicate a DDoS or bandwidth-hogging malware
- Physical tampering (cut cables, rogue taps) is a real, low-tech attack vector
- Wireless interference troubleshooting overlaps with rogue AP/jamming detection

### Key Takeaway
> Not every anomaly is malicious — but every anomaly deserves a look.
> The line between "bad cable" and "active attack" is sometimes just one investigation away.

---

## 23. Tools & Protocols — Wireshark, Ping, Traceroute, Netstat

### Wireshark
Packet capture and analysis tool — lets you inspect traffic at every OSI layer.
```
Common filters:
ip.addr == 192.168.1.1
tcp.port == 443
http.request
dns
```

### Command-Line Diagnostics
```bash
ping 8.8.8.8                 # Test reachability (ICMP)
traceroute 8.8.8.8            # Map the path to a destination (Linux/macOS)
tracert 8.8.8.8                # Windows equivalent
netstat -ano                  # Show active connections and listening ports
nslookup google.com           # Query DNS (basic)
dig google.com                # Query DNS (detailed)
ipconfig /all                 # Windows network config
ifconfig / ip a                # Linux network config
arp -a                         # Show ARP cache
```

### Why It Matters for Cybersecurity
- Wireshark is the single most important tool for understanding what's actually happening on the wire
- `netstat` quickly reveals unexpected listening ports or active connections — often the first sign of compromise
- These tools are the backbone of both troubleshooting and basic incident triage

### Key Takeaway
> Tools don't replace understanding — but the right tool, used with understanding, answers questions in seconds instead of hours.
> Get comfortable with all of these; you'll reach for them constantly.

---

## Quick Reference — Networking Cheat Sheet

### OSI Layers
```
7 Application | 6 Presentation | 5 Session | 4 Transport | 3 Network | 2 Data Link | 1 Physical
```

### Common Ports
```
20/21 FTP | 22 SSH | 23 Telnet | 25 SMTP | 53 DNS | 67/68 DHCP | 80 HTTP
110 POP3 | 123 NTP | 143 IMAP | 161/162 SNMP | 389 LDAP | 443 HTTPS | 445 SMB | 3389 RDP
```

### Subnetting
```
/24 = 255.255.255.0   (254 hosts)
/25 = 255.255.255.128 (126 hosts)
/26 = 255.255.255.192 (62 hosts)
/27 = 255.255.255.224 (30 hosts)
/28 = 255.255.255.240 (14 hosts)
```

### Diagnostic Tools
```
ping | traceroute | tracert | netstat | nslookup | dig | ipconfig | ifconfig | arp | nmap
```

### Security Concepts
```
AAA | RADIUS | TACACS+ | MFA | ACL | DMZ | NAC | IDS/IPS
```

---

> **Overall Key Takeaway for Week 4:**
> Networking is the circulatory system of cybersecurity.
> Every attack travels across it, and every defense depends on understanding it.
> Master the OSI model, ports, addressing, and the core services —
> they are the language every other security concept is written in.
