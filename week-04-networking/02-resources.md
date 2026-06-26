# Week 04 — Resources

This is everything I used this week to learn Networking Fundamentals.
I'm documenting this so anyone starting from scratch can follow the same path.
Networking is not optional in cybersecurity — it is the foundation every attack and every defence is built on.
These resources helped me go from memorising port numbers to actually understanding why they matter.

---

## The Resources That Shaped This Week

I came into this week thinking networking was just memorising tables.
Then I started connecting the theory to real attacks and everything changed.

What made the difference was not just watching videos — it was building mental models I could apply.
The moment I stopped asking "what is this?" and started asking "how would an attacker use this?" networking stopped feeling abstract.

---

## Core Resources I Used This Week

| Resource | Link | Type |
|----------|------|------|
| Professor Messer — CompTIA Network+ N10-008 | [professormesser.com](https://www.professormesser.com/network-plus/n10-008/n10-008-video/n10-008-training-course/) | Full Video Course — Free |
| Professor Messer — Study Groups & Notes | [professormesser.com](https://www.professormesser.com/network-plus/n10-008/n10-008-video/n10-008-training-course/) | Study Notes & Practice — Free |
| Wireshark Official Documentation | [wireshark.org](https://www.wireshark.org/docs/) | Tool Reference — Free |
| TryHackMe — Pre-Security / Network Fundamentals | [tryhackme.com](https://tryhackme.com/path/outline/presecurity) | Hands-on Labs — Free Tier |
| Network Chuck — YouTube | [YouTube Channel](https://www.youtube.com/@NetworkChuck) | Video Explainers — Free |

---

## Hands-On Practice — Setting Up My Own Lab

This was the part of the week I am most proud of.
I didn't just watch videos — I opened Wireshark and actually looked at the traffic while learning each concept.

I used **Wireshark** on my existing Kali Linux VM and captured real packets from my lab network.
Every protocol from the notes was something I could see live on the wire — not just read about.

### What I Set Up
| Step | What I Did |
|------|-----------|
| Packet Capture | Installed and ran Wireshark on Kali Linux VM |
| Traffic Generation | Ran `ping`, `nslookup`, and `curl` to generate traffic I could then capture |
| Filter Practice | Built Wireshark filters to isolate DNS, HTTP, ICMP, and ARP traffic |
| Port Scanning | Ran `nmap` scans against my lab and identified services from port numbers alone |

### What I Practiced Hands-On
- Captured and dissected the TCP 3-way handshake in Wireshark
- Watched a full DNS query and response at the packet level
- Identified ARP traffic and mapped it to the OSI Data Link layer
- Used `netstat -ano` to see every active connection and listening port on my machine
- Ran `traceroute` and watched each hop appear in real time
- Applied OSI layers to every packet I captured — not just named them from memory

### Why This Mattered
Watching a DNS query happen in Wireshark taught me more than any diagram could.
When I could see the exact bytes going across the wire, the OSI model stopped being an abstract table.
Every layer became something I could point to and identify in a real capture.

---

## Topic-wise Resources

### 1. OSI Model & Network Fundamentals

This is where the week started and where I spent the most time on fundamentals.
I had seen the OSI model before but never understood why it mattered.
Professor Messer's explanation was the first time the layers connected to real attacks for me.

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| Professor Messer — Network+ N10-008 | [Watch](https://www.professormesser.com/network-plus/n10-008/n10-008-video/n10-008-training-course/) | Must Watch | Clearest free video explanation of OSI I found — covers every layer with context |
| Network Chuck — OSI Model | [YouTube](https://www.youtube.com/@NetworkChuck) | Must Watch | Makes OSI feel intuitive with real-world analogies |

**Real World Connection:**
Every attack in cybersecurity targets a specific OSI layer.
DDoS hits L3 and L4. SQL injection and XSS target L7. ARP poisoning lives at L2.
When you read an incident report, the OSI model is the map that tells you exactly where the attack lived.
Analysts and pentesters who know this model cold read threat intel faster than everyone else.

---

### 2. Ports & Protocols — TCP, UDP, ICMP

This section felt like memorisation at first.
Then I opened Wireshark, captured a DNS query, and watched it resolve over UDP port 53 in real time.
After that every port number had a picture attached to it — not just a row in a table.

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| Professor Messer — Network+ N10-008 | [Watch](https://www.professormesser.com/network-plus/n10-008/n10-008-video/n10-008-training-course/) | Must Watch | Best structured coverage of TCP/UDP and the 3-way handshake |
| Wireshark Docs | [Read](https://www.wireshark.org/docs/) | Must Try | Used to build filters and see every protocol live |
| Network Chuck | [YouTube](https://www.youtube.com/@NetworkChuck) | Recommended | TCP vs UDP explained with genuinely memorable examples |

**Real World Connection:**
Port scanning with Nmap is the first step in every penetration test.
Knowing that RDP runs on 3389, SMB on 445, and SSH on 22 is not trivia —
it is how you read a scan result and instantly know what services are exposed.
Every firewall rule and every detection signature is written around ports and protocols.

---

### 3. IPv4 Addressing & Subnetting

This was the hardest section of the week.
Binary math felt painful at first — then the patterns clicked and it became fast.
Professor Messer's walkthrough was the resource that finally made the method feel logical.

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| Professor Messer — Network+ N10-008 | [Watch](https://www.professormesser.com/network-plus/n10-008/n10-008-video/n10-008-training-course/) | Must Watch | Step-by-step subnetting walkthrough that actually makes sense |
| Network Chuck | [YouTube](https://www.youtube.com/@NetworkChuck) | Recommended | Visual breakdown of CIDR and IP addressing that complements Messer well |

**Real World Connection:**
Every firewall rule, every ACL, and every penetration test scope is written in CIDR notation.
Misread a subnet boundary and you misconfigure a firewall — or accidentally scan out of scope.
Subnetting isn't just a certification topic — it is the daily language of network engineering and security operations.

---

### 4. Routing, Switching & VLANs

This was the section that connected the most directly to attack techniques.
The moment I learned how VLAN hopping works, trunking stopped being an abstract config detail.
Understanding BGP hijacking made routing feel genuinely dangerous in a way I hadn't expected.

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| Professor Messer — Network+ N10-008 | [Watch](https://www.professormesser.com/network-plus/n10-008/n10-008-video/n10-008-training-course/) | Must Watch | Covers VLANs, trunking, STP, and routing protocols with real clarity |
| Network Chuck | [YouTube](https://www.youtube.com/@NetworkChuck) | Must Watch | VLANs explained visually — the best walkthrough I found for this topic |

**Real World Connection:**
VLAN hopping attacks exploit exactly the misconfigurations covered in this section.
STP manipulation can force traffic through an attacker-controlled switch — silently.
BGP hijacking has rerouted real internet traffic at scale and made global headlines.
These aren't theoretical — they are techniques in active use.

---

### 5. Wireless Security & Encryption Standards

This section was more interesting than I expected.
I already knew WEP was broken — but understanding *why* it's broken changed how I think about cryptography entirely.
Running a wireless survey on my home network and seeing the signal extend outside the walls made the risk feel real.

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| Professor Messer — Network+ N10-008 | [Watch](https://www.professormesser.com/network-plus/n10-008/n10-008-video/n10-008-training-course/) | Must Watch | Clear breakdown of WEP, WPA, WPA2, WPA3 and why each matters |
| Network Chuck | [YouTube](https://www.youtube.com/@NetworkChuck) | Recommended | Explains wireless attacks like rogue APs in an engaging way |
| TryHackMe — Pre-Security | [Practice](https://tryhackme.com/path/outline/presecurity) | Must Try | Labs that put wireless concepts directly into a hands-on context |

**Real World Connection:**
Rogue access points mimicking legitimate SSIDs are one of the most effective social engineering attacks in the field.
WEP and WPA networks are still found on real-world engagements and are trivially crackable.
Wireless signal leakage outside a building is an attack surface that costs nothing to exploit if you're in the car park.

---

### 6. Network Security — Attacks, Firewalls, AAA

This was my favourite section of the week.
Every attack type I read about had a direct defensive control paired with it.
The moment I saw how ARP poisoning enables an on-path attack, the ARP table stopped being boring.

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| Professor Messer — Network+ N10-008 | [Watch](https://www.professormesser.com/network-plus/n10-008/n10-008-video/n10-008-training-course/) | Must Watch | Attack types, firewall types, ACLs, and AAA covered with real depth |
| TryHackMe — Pre-Security | [Practice](https://tryhackme.com/path/outline/presecurity) | Must Do | Applied network attack concepts in hands-on guided labs |
| Network Chuck | [YouTube](https://www.youtube.com/@NetworkChuck) | Recommended | Attack explanations that make the defensive controls make sense |

**Real World Connection:**
Every one of these attacks appears in real incident reports, CTFs, and penetration test findings.
ARP poisoning → Dynamic ARP Inspection. Rogue DHCP → DHCP Snooping. VLAN hopping → proper trunk config.
Learning attacks and defences together is how you build a mental model that works in both directions.

---

### 7. Diagnostic Tools — Wireshark, Netstat, Nmap

This section tied the entire week together.
I had been reading about protocols all week — then I opened Wireshark and saw every single one of them.
The first time I isolated a DNS query with a Wireshark filter felt like reading a language I had just learned.

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| Wireshark Official Docs | [Read](https://www.wireshark.org/docs/) | Must Read | The authoritative reference for filters, dissectors, and display options |
| Professor Messer — Network+ N10-008 | [Watch](https://www.professormesser.com/network-plus/n10-008/n10-008-video/n10-008-training-course/) | Must Watch | Covers all diagnostic tools in the context of troubleshooting methodology |
| TryHackMe — Pre-Security | [Practice](https://tryhackme.com/path/outline/presecurity) | Must Do | Hands-on use of networking tools inside guided rooms |

**Real World Connection:**
Wireshark is the single most important tool for understanding what is actually happening on the wire.
`netstat -ano` is often the first command run during initial triage of a potentially compromised machine.
`traceroute` and `nmap` are used in every recon phase of a penetration test, without exception.
These tools are not optional extras — they are the baseline for every network security role.

---

## Tools & Platforms I Used This Week

| Tool | Purpose | Link |
|------|---------|------|
| Professor Messer N10-008 | Followed the full structured video course for every topic | [professormesser.com](https://www.professormesser.com/network-plus/n10-008/n10-008-video/n10-008-training-course/) |
| Network Chuck | Watched for intuitive explanations of complex networking topics | [YouTube](https://www.youtube.com/@NetworkChuck) |
| Wireshark | Captured and analysed live packets from my Kali VM lab | [wireshark.org](https://www.wireshark.org) |
| TryHackMe — Pre-Security | Applied networking concepts hands-on in guided labs | [tryhackme.com](https://tryhackme.com/path/outline/presecurity) |
| Nmap | Ran port scans against my lab to identify services in real time | [nmap.org](https://nmap.org) |

---

## My Honest Rating of This Week

| Topic | Difficulty | My Experience |
|-------|------------|---------------|
| OSI Model | Easy | Clicked fast once I mapped each layer to a real attack |
| Ports & Protocols | Easy–Medium | Memorisation felt easier after seeing each protocol in Wireshark |
| IPv4 & Subnetting | Hard | Painful at first — Messer's walkthrough was what finally made the method click |
| Routing & Switching | Medium | Genuinely interesting once I connected it to VLAN hopping and BGP hijacking |
| Wireless Security | Medium | More attack-relevant than I expected — rogue APs were the highlight |
| Network Security & AAA | Medium | Favourite part of the week — attacks and defences finally made sense together |
| Diagnostic Tools | Medium | Wireshark was intimidating until the first successful filter |
| Disaster Recovery & Monitoring | Medium | Dry until I connected RPO/RTO to ransomware response — then it mattered |

---

## My Recommendation to Anyone Starting Networking

Start with **Professor Messer's Network+ N10-008 course** — it is the most complete free structured resource I found.
Every topic from OSI to troubleshooting is covered in the right order, with the right depth.
Watch **Network Chuck** alongside it when a concept isn't clicking — his style makes abstract things visual.
Open **Wireshark** and capture traffic while you study each protocol — seeing it live makes it permanent.
Do **TryHackMe Pre-Security** for the networking rooms — applying concepts in labs is not optional.

Don't just read the port table. Open a terminal and run `nmap`, `netstat`, `ping`, and `traceroute`.
Don't just memorise the OSI model. Pick an attack and trace it layer by layer.

Networking does not become real from watching videos.
It becomes real from touching the traffic yourself.
This week I stopped seeing packets as abstract data and started reading them like a language.
That shift is what cybersecurity is actually built on.
