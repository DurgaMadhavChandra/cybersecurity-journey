#!/bin/bash
# ============================================
# Week 04 — Networking Fundamentals
# Author: Durga Madhav Chandra
# ============================================
#
# Everything below is safe to run as-is — all functions work against
# localhost, /tmp, or read-only system info only.
# Nothing here touches a real target or external network.
# Read the comments first, then run to watch each concept execute.


# ============================================
# 1. OSI MODEL — MAPPING LAYERS TO REALITY
# ============================================

# I'd seen the OSI table a hundred times and still couldn't use it.
# It clicked the moment I stopped memorising layers and started asking:
# "Which layer does this attack live on?"
# DDoS → L3/L4. ARP poisoning → L2. SQLi/XSS → L7.
# Now every packet capture, every incident report, has a map.

osi_model_demo() {
    echo "--- OSI Model — Layer to Protocol Mapping ---"
    cat <<'EOF'
Layer 7  Application  → HTTP, FTP, DNS, SMTP         (user-facing services)
Layer 6  Presentation → SSL/TLS, JPEG, ASCII          (format + encryption)
Layer 5  Session      → NetBIOS, RPC                  (establish/maintain/end sessions)
Layer 4  Transport    → TCP, UDP                       (end-to-end delivery)
Layer 3  Network      → IP, ICMP                       (logical addressing, routing)
Layer 2  Data Link    → Ethernet, MAC addresses        (physical addressing, frames)
Layer 1  Physical     → Cables, NICs, radio waves      (raw bits on the wire)

Mnemonic top-down:  All People Seem To Need Data Processing
Mnemonic bottom-up: Please Do Not Throw Sausage Pizza Away
EOF

    echo ""
    echo "--- Attack Surface by Layer ---"
    cat <<'EOF'
L7 → SQL injection, XSS, HTTP floods
L4 → SYN floods, port scanning, UDP floods
L3 → IP spoofing, ICMP tunneling, route hijacking
L2 → ARP poisoning, VLAN hopping, MAC flooding
L1 → Physical tapping, jamming, cable cutting
EOF
}


# ============================================
# 2. TCP VS UDP — THE HANDSHAKE IN ACTION
# ============================================

# TCP felt like overhead until I watched a 3-way handshake in Wireshark.
# Seeing SYN → SYN-ACK → ACK happen in real packets made it concrete.
# UDP felt unsafe until I remembered DNS, NTP, and streaming all rely on it —
# speed matters more than guaranteed delivery for those use cases.

tcp_udp_demo() {
    echo "--- TCP 3-Way Handshake (what Wireshark shows you) ---"
    cat <<'EOF'
Client  ──── SYN ────────────► Server   (I want to connect)
Client  ◄─── SYN-ACK ────────  Server   (OK, I'm listening)
Client  ──── ACK ────────────► Server   (Connection established)

After this: data flows both directions.
Teardown: FIN → FIN-ACK → ACK
EOF

    echo ""
    echo "--- TCP vs UDP Decision Table ---"
    cat <<'EOF'
TCP  → connection-oriented, guaranteed, ordered, slower
       Use for: HTTP/S, SSH, SMTP, FTP, RDP, SMB

UDP  → connectionless, best-effort, no ordering, faster
       Use for: DNS queries, DHCP, NTP, VoIP, video streaming, SNMP

Security note: UDP has no handshake — no built-in way to verify
the sender. Reflection/amplification DDoS attacks abuse this:
attacker spoofs a victim's IP and sends small UDP requests to
open resolvers that reply with large responses — all hitting the victim.
EOF

    echo ""
    echo "--- Checking active TCP/UDP connections right now ---"
    ss -tunap 2>/dev/null | head -15 || netstat -tunap 2>/dev/null | head -15
}


# ============================================
# 3. COMMON PORTS — RECOGNISING SERVICES ON SIGHT
# ============================================

# Port tables felt like a memorisation exercise until I ran nmap
# against my own lab and matched every open port to a service instantly.
# Now when I see port 445 in a log I think SMB, EternalBlue, ransomware pivot.
# The port number IS the service — until something is hiding on the wrong one.

common_ports_demo() {
    echo "--- Common Ports Cheat Sheet ---"
    cat <<'EOF'
20/21  TCP   FTP          (data / control — plaintext, avoid)
22     TCP   SSH          (encrypted shell — your friend)
23     TCP   Telnet       (plaintext shell — your enemy)
25     TCP   SMTP         (email sending)
53     TCP/UDP DNS        (name resolution — abused for tunneling)
67/68  UDP   DHCP         (automatic IP assignment)
80     TCP   HTTP         (unencrypted web)
110    TCP   POP3         (email retrieval)
123    UDP   NTP          (time sync — broken NTP breaks log correlation)
143    TCP   IMAP         (email retrieval, with folders)
161/162 UDP  SNMP         (network monitoring — v1/v2c = plaintext community strings)
389    TCP   LDAP         (directory services / Active Directory)
443    TCP   HTTPS        (encrypted web)
445    TCP   SMB          (file sharing — EternalBlue lives here)
3389   TCP   RDP          (Windows remote desktop — exposed to internet = disaster)
EOF

    echo ""
    echo "--- Checking which ports are listening on this machine ---"
    ss -tlnp 2>/dev/null | grep LISTEN || netstat -tlnp 2>/dev/null | grep LISTEN
    echo "(Any unexpected listener here is worth investigating immediately)"
}


# ============================================
# 4. ICMP — DIAGNOSTICS AND WHAT GETS ABUSED
# ============================================

# ping felt like a toy until I learned ICMP is also used for:
# covert data exfiltration (ICMP tunneling), ping floods (DDoS),
# and network mapping (what nmap does internally).
# The same protocol that checks if a host is alive can carry a backdoor.

icmp_demo() {
    echo "--- ICMP: Loopback ping (safe, local only) ---"
    ping -c 3 127.0.0.1

    echo ""
    echo "--- Traceroute to loopback (maps the path hop by hop) ---"
    traceroute -m 5 127.0.0.1 2>/dev/null || tracert -h 5 127.0.0.1 2>/dev/null || \
        echo "(traceroute not available — install with: sudo apt install traceroute)"

    echo ""
    echo "--- ICMP Security Notes ---"
    cat <<'EOF'
ping flood   → volume-based DDoS using ICMP Echo Request
ICMP tunnel  → tools like icmpsh, ptunnel hide data inside ICMP payloads
               — bypasses firewalls that only block TCP/UDP
Smurf attack → spoofed ICMP to broadcast address, entire subnet replies to victim
Defense      → rate-limit ICMP at the perimeter, monitor for abnormal ICMP sizes
EOF
}


# ============================================
# 5. IPv4 SUBNETTING — THE MATH THAT RUNS EVERYTHING
# ============================================

# I avoided subnetting because binary math felt pointless in theory.
# Then I wrote a firewall rule with a wrong subnet mask and it allowed
# traffic from an entire /16 instead of a single /24.
# Every ACL, every pentest scope, every segmentation decision is CIDR.
# Getting this wrong is not academic — it's a misconfiguration.

subnetting_demo() {
    echo "--- CIDR Quick Reference ---"
    cat <<'EOF'
/24  → 255.255.255.0    → 254 usable hosts   → most common LAN size
/25  → 255.255.255.128  → 126 usable hosts
/26  → 255.255.255.192  →  62 usable hosts
/27  → 255.255.255.224  →  30 usable hosts
/28  → 255.255.255.240  →  14 usable hosts
/30  → 255.255.255.252  →   2 usable hosts   → point-to-point links
/32  → 255.255.255.255  →   1 host           → single host route

Formula: usable hosts = (2^host_bits) - 2
(subtract 2: network address + broadcast address)
EOF

    echo ""
    echo "--- Subnetting Example: 192.168.1.0/26 ---"
    cat <<'EOF'
Mask:          255.255.255.192   (/26 = 64 addresses each, 62 usable)
Subnet 1:      192.168.1.0/26    hosts: .1   → .62    broadcast: .63
Subnet 2:      192.168.1.64/26   hosts: .65  → .126   broadcast: .127
Subnet 3:      192.168.1.128/26  hosts: .129 → .190   broadcast: .191
Subnet 4:      192.168.1.192/26  hosts: .193 → .254   broadcast: .255
EOF

    echo ""
    echo "--- Your network interfaces and their subnets ---"
    ip addr show 2>/dev/null || ifconfig 2>/dev/null
}


# ============================================
# 6. DNS — THE PROTOCOL THAT MAKES THE INTERNET READABLE
# ============================================

# DNS looked like a simple lookup table until I learned it's one of the
# most abused protocols in existence.
# DNS poisoning redirects users to attacker-controlled sites silently.
# DNS tunneling exfiltrates data through port 53 — which almost nobody blocks.
# Rogue DHCP can push a malicious DNS server to every device on a network.

dns_demo() {
    echo "--- DNS Record Types ---"
    cat <<'EOF'
A     → hostname to IPv4 address
AAAA  → hostname to IPv6 address
CNAME → alias pointing to another hostname
MX    → mail server for a domain
TXT   → arbitrary text (SPF records, domain verification)
NS    → authoritative name servers for a domain
PTR   → reverse DNS (IP to hostname)
EOF

    echo ""
    echo "--- Live DNS query for localhost ---"
    nslookup localhost 2>/dev/null || dig localhost 2>/dev/null | grep -A5 "ANSWER SECTION" || \
        echo "(dig/nslookup not available)"

    echo ""
    echo "--- DNS Security Observations ---"
    cat <<'EOF'
DNS poisoning  → attacker corrupts cached DNS responses
               → user types google.com, lands on attacker's IP
DNS tunneling  → encodes data inside DNS queries/responses
               → bypasses firewalls that don't inspect DNS traffic
               → tools: dnscat2, iodine
Rogue DHCP     → attacker responds to DHCP Discover first
               → pushes their own DNS server to victims
               → all DNS queries now flow through attacker
Defense        → DNSSEC, DNS over HTTPS/TLS, monitoring for abnormal query volume
EOF
}


# ============================================
# 7. DHCP — AUTOMATIC ADDRESS ASSIGNMENT AND ITS RISKS
# ============================================

# DHCP is invisible infrastructure — until someone poisons it.
# A rogue DHCP server that wins the race to respond
# controls the gateway, DNS, and subnet mask for every new device.
# That's not a subtle attack. That's full network-level MITM from one device.

dhcp_demo() {
    echo "--- DHCP DORA Process ---"
    cat <<'EOF'
Discover → client broadcasts: "Is there a DHCP server out there?"
Offer    → server responds: "Here, take 192.168.1.50 for 24 hours"
Request  → client: "I'll take that IP, please confirm"
Ack      → server: "Confirmed. It's yours until [timestamp]"

What DHCP gives you beyond just an IP:
  - Default gateway (where to send traffic outside your subnet)
  - DNS server addresses (who resolves your names)
  - Subnet mask (how big your local network is)
  - Lease time (how long you hold that IP)

Rogue DHCP attack: attacker plugs in a device that responds to Discover
faster than the real server — victim gets attacker-controlled gateway and DNS.
Defense: DHCP snooping on managed switches (only trust DHCP from authorised ports)
EOF

    echo ""
    echo "--- Your current DHCP lease info ---"
    ip route show 2>/dev/null | grep default || \
        cat /var/lib/dhcp/dhclient.leases 2>/dev/null | head -20 || \
        echo "(No lease file found — may be using static addressing)"
}


# ============================================
# 8. ARP — THE GLUE BETWEEN IP AND MAC, AND ITS WEAKNESS
# ============================================

# ARP has no authentication. None.
# Any device on a LAN can send a gratuitous ARP reply claiming any IP.
# ARP poisoning is how most MITM attacks on local networks are executed —
# Ettercap, arpspoof, Bettercap all start here.
# The ARP table on your machine right now has been trusted blindly.

arp_demo() {
    echo "--- How ARP Works ---"
    cat <<'EOF'
Problem: I have the IP 192.168.1.1 — what MAC address do I send frames to?
ARP Request:  broadcast → "Who has 192.168.1.1? Tell 192.168.1.50"
ARP Reply:    unicast   → "192.168.1.1 is at aa:bb:cc:dd:ee:ff"

The reply is trusted with zero verification. No challenge, no signature.
ARP poisoning: attacker floods the network with fake replies
               → "192.168.1.1 (the gateway) is at MY MAC address"
               → all traffic meant for the gateway now flows through attacker
               → classic on-path (MITM) setup
EOF

    echo ""
    echo "--- Your current ARP table ---"
    arp -a 2>/dev/null || ip neigh show 2>/dev/null
    echo "(Every entry here was trusted without verification)"

    echo ""
    echo "--- Defense ---"
    cat <<'EOF'
Dynamic ARP Inspection (DAI) → switch validates ARP against DHCP snooping table
Static ARP entries           → for critical devices (gateway), set them manually
Detection                    → duplicate IP warnings, rapid ARP table changes
EOF
}


# ============================================
# 9. FIREWALL RULES & ACLs — ORDER IS EVERYTHING
# ============================================

# I thought firewalls were smart. They're not — they're sequential.
# Rules are processed top to bottom. First match wins. Then it stops.
# Put a "permit any any" rule at the top and you've built a very expensive doorstop.
# The implicit deny at the end is the only thing between a misconfigured ACL and chaos.

firewall_acl_demo() {
    echo "--- ACL Logic (top-down, first match wins) ---"
    cat <<'EOF'
Rule 1: permit tcp any host 10.0.0.5 eq 443   → HTTPS to web server: allowed
Rule 2: permit tcp any host 10.0.0.5 eq 80    → HTTP to web server: allowed
Rule 3: deny   tcp any host 10.0.0.5          → all other TCP to web server: blocked
Rule 4: permit ip  any any                    → everything else: allowed
         ↑
         implicit deny at the very end (after all explicit rules)

Common mistake: rule 4 is too broad.
If your intention was to only expose the web server, a final
"permit ip any any" undoes all the work above it for every other host.
EOF

    echo ""
    echo "--- Firewall Types ---"
    cat <<'EOF'
Stateless  → matches packets against rules only (source IP, dest IP, port)
             fast, simple, no awareness of connections
             weakness: can't distinguish a new connection from reply traffic

Stateful   → tracks connection state (SYN seen? ACK expected?)
             allows return traffic automatically, smarter filtering
             most modern firewalls are at least stateful

NGFW       → adds application-layer inspection, IPS, DPI, URL filtering
             can identify "this is Dropbox traffic on port 443"
             not just "this is HTTPS"
EOF

    echo ""
    echo "--- DMZ Concept ---"
    cat <<'EOF'
Internet → [Firewall] → DMZ (web servers, mail servers, DNS)
                      → [Firewall] → Internal Network

Public-facing services live in the DMZ.
If a DMZ host is compromised, the attacker still faces the internal firewall.
Flat networks have no DMZ — one compromised server means free lateral movement.
EOF

    echo ""
    echo "--- Checking local firewall rules ---"
    sudo iptables -L -n --line-numbers 2>/dev/null | head -30 || \
        echo "(Run with sudo to view iptables rules, or use: sudo ufw status verbose)"
}


# ============================================
# 10. VLANs — LOGICAL SEGMENTATION AND HOW IT BREAKS
# ============================================

# VLANs are the primary segmentation tool in most enterprise networks.
# Sales, Engineering, Finance, Management — all on the same physical switch,
# all completely isolated from each other. In theory.
# VLAN hopping breaks that isolation when trunking is misconfigured.
# One device, one exploit, and suddenly you're crossing a boundary
# that was supposed to keep you out.

vlan_demo() {
    echo "--- VLAN Concepts ---"
    cat <<'EOF'
VLAN 10 → Sales
VLAN 20 → Engineering
VLAN 99 → Management  (isolated from user VLANs — admin access only)

Access port  → carries ONE VLAN, used for end devices (PCs, printers)
Trunk port   → carries MULTIPLE VLANs with 802.1Q tagging, used between switches

802.1Q tag: 4 bytes inserted into the Ethernet frame header
            identifies which VLAN the frame belongs to
EOF

    echo ""
    echo "--- VLAN Hopping Attack ---"
    cat <<'EOF'
Method 1 — Switch Spoofing:
  Attacker enables 802.1Q trunking on their NIC, negotiates a trunk with the switch.
  Switch (misconfigured with DTP auto/desirable) agrees to trunk.
  Attacker now receives ALL VLAN traffic across the trunk.

Method 2 — Double Tagging:
  Attacker sends a frame with two 802.1Q tags.
  Outer tag matches the native VLAN (stripped by first switch).
  Inner tag carries the target VLAN — delivered by second switch.
  Works even on properly configured trunks IF native VLAN matches attacker's VLAN.

Defense:
  → Set all unused ports to access mode explicitly
  → Disable DTP (switchport nonegotiate)
  → Change native VLAN to an unused VLAN ID (e.g. VLAN 999)
  → Never use VLAN 1 as the native VLAN
EOF
}


# ============================================
# 11. NETWORK MONITORING — SEEING WHAT'S ACTUALLY HAPPENING
# ============================================

# Monitoring felt like a compliance checkbox until I connected it to
# real incident response. Without centralised logs you cannot timeline an attack.
# Without NetFlow you cannot see data exfiltration happening in plain sight.
# Without SNMP you cannot tell if your router is being slowly poisoned.
# Visibility isn't optional overhead — it's the difference between
# detecting a breach in hours versus months.

monitoring_demo() {
    echo "--- SNMP Versions and Why Version Matters ---"
    cat <<'EOF'
SNMPv1/v2c → community strings in plaintext (often still "public" or "private")
             → readable by anyone on the network who can capture traffic
             → entire device config, routing table, interface stats: exposed

SNMPv3     → authentication (MD5/SHA) + encryption (AES/DES)
             → the only version you should be running

Attacker using SNMPv1:
  snmpwalk -v1 -c public 192.168.1.1
  → dumps the full MIB: interface names, routing table, connected devices
  → free network diagram, no credentials required
EOF

    echo ""
    echo "--- What NetFlow Catches That Firewalls Miss ---"
    cat <<'EOF'
NetFlow records: src IP, dst IP, src port, dst port, protocol, bytes, packets
                 → NOT the payload, just the metadata

What metadata reveals:
  Beaconing    → internal host connects to same external IP every 60 seconds
                 → likely C2 callback
  Exfiltration → internal host sends 50GB to unknown external IP over 3 hours
                 → large outbound transfer at off-hours
  Lateral move → workstation suddenly port-scans 200 internal IPs
                 → not normal workstation behavior
EOF

    echo ""
    echo "--- Active connections on this machine right now ---"
    ss -tunap 2>/dev/null | grep ESTABLISHED | head -15
    echo ""
    echo "--- Listening services (your local attack surface) ---"
    ss -tlnp 2>/dev/null | grep LISTEN
}


# ============================================
# 12. WIRESHARK FILTERS — READING THE WIRE
# ============================================

# Opening Wireshark raw was overwhelming — thousands of packets per second.
# The moment I learned display filters, it became a surgical tool.
# Isolating a single DNS query, a TLS handshake, or an ARP exchange
# from live traffic is a skill that pays off on day one in any security role.

wireshark_filters_demo() {
    echo "--- Essential Wireshark Display Filters ---"
    cat <<'EOF'
# Isolate by IP
ip.addr == 192.168.1.10          → all traffic to/from this IP
ip.src == 192.168.1.10           → only traffic FROM this IP
ip.dst == 192.168.1.10           → only traffic TO this IP

# Protocol filters
dns                              → all DNS queries and responses
http                             → all HTTP traffic (GET, POST, responses)
tcp.port == 443                  → HTTPS (or anything on 443)
icmp                             → ping traffic, ICMP errors
arp                              → ARP requests and replies

# Finding the handshake
tcp.flags.syn == 1               → all SYN packets (start of connections)
tcp.flags.syn == 1 && tcp.flags.ack == 0  → only the initial SYN

# Hunting suspicious behaviour
tcp.port == 4444                 → common Metasploit reverse shell port
dns.qry.name contains "dnscat"  → DNS tunneling tool
http.request.method == "POST"   → data being sent to a server

# Combining filters
ip.addr == 192.168.1.10 && dns  → DNS traffic only from a specific host
EOF

    echo ""
    echo "--- Command-Line Packet Capture (tcpdump) ---"
    cat <<'EOF'
# Capture all traffic on eth0, save to file
tcpdump -i eth0 -w /tmp/lab/capture.pcap

# Capture only DNS queries
tcpdump -i eth0 port 53

# Capture only traffic to/from a specific IP
tcpdump -i eth0 host 192.168.1.10

# Read a saved capture file
tcpdump -r /tmp/lab/capture.pcap

# Generate some loopback traffic to capture (safe, local only)
tcpdump -i lo -c 10 2>/dev/null &
ping -c 5 127.0.0.1 > /dev/null
wait
echo "(tcpdump capture complete — open the .pcap in Wireshark)"
EOF
}


# ============================================
# 13. DIAGNOSTIC TOOLS — THE FIRST FIVE MINUTES OF TRIAGE
# ============================================

# These tools are what you reach for the moment something is wrong —
# or the moment you suspect something is wrong and need to prove it.
# netstat/ss during incident triage. dig during DNS investigation.
# traceroute during a routing anomaly. arp during a suspected MITM.
# Knowing which tool answers which question is what separates
# methodical triage from random guesswork under pressure.

diagnostic_tools_demo() {
    echo "--- Network Diagnostic Toolkit ---"
    cat <<'EOF'
ping        → is the host reachable? (ICMP echo)
traceroute  → what path does traffic take? where does it stop?
netstat/ss  → what connections exist? what is this machine listening on?
nslookup    → what IP does this domain resolve to?
dig         → nslookup but with more detail and control
arp -a      → what MAC addresses are cached for known IPs?
ip route    → what is the routing table? where does traffic go by default?
nmap        → what ports are open on a host? what services are running?
EOF

    echo ""
    echo "--- Live Diagnostics on This Machine ---"

    echo "→ Default gateway:"
    ip route show 2>/dev/null | grep default

    echo ""
    echo "→ DNS server configured:"
    cat /etc/resolv.conf 2>/dev/null | grep nameserver

    echo ""
    echo "→ ARP cache:"
    arp -a 2>/dev/null || ip neigh show 2>/dev/null

    echo ""
    echo "→ Established connections (first 10):"
    ss -tn state established 2>/dev/null | head -10

    echo ""
    echo "--- Port Scan Against Loopback (safe, local only) ---"
    echo "Checking common ports on 127.0.0.1:"
    for port in 22 80 443 3306 5432 8080; do
        timeout 1 bash -c "echo > /dev/tcp/127.0.0.1/$port" 2>/dev/null \
            && echo "  Port $port: OPEN" \
            || echo "  Port $port: closed"
    done
    echo "(This is what nmap does — just more methodically and with service detection)"
}


# ============================================
# 14. AAA — THE FRAMEWORK BEHIND EVERY ACCESS CONTROL
# ============================================

# AAA isn't a product — it's a three-question model that every
# access control system answers. Skip any one of the three and
# your access story has a hole in it.
# Authentication without accounting is an alibi problem.
# Authorization without authentication is guesswork.
# Accounting without authorization is logging chaos nobody asked for.

aaa_demo() {
    echo "--- AAA Framework ---"
    cat <<'EOF'
Authentication → WHO ARE YOU?
                 Verify identity before granting any access.
                 Methods: password, certificate, biometric, hardware token

Authorization  → WHAT ARE YOU ALLOWED TO DO?
                 Verify permission after identity is confirmed.
                 Models: RBAC (role-based), ABAC (attribute-based), ACLs

Accounting     → WHAT DID YOU ACTUALLY DO?
                 Log every action for audit, forensics, compliance.
                 Answers the question: "who did what, and when?"
EOF

    echo ""
    echo "--- RADIUS vs TACACS+ ---"
    cat <<'EOF'
RADIUS   → UDP (1812/1813), encrypts only the password field
           used for: Wi-Fi authentication, VPN, network device login
           widely supported, ISP/enterprise standard

TACACS+  → TCP (49), encrypts the ENTIRE payload
           used for: Cisco network device admin (privileged access)
           more granular: can authorise per-command, not just per-user
           Cisco-proprietary — not as universal as RADIUS
EOF

    echo ""
    echo "--- MFA — Why Single Factor Is Not Enough ---"
    cat <<'EOF'
Something you know  → password (can be phished, leaked, guessed)
Something you have  → phone, hardware token, smart card
Something you are   → fingerprint, face, retina

MFA requires 2+ factors from different categories.
Password + SMS code = MFA (two factors: know + have)
Password + security question = NOT MFA (both are "something you know")

Real-world impact: Microsoft reports MFA blocks 99.9% of automated
account compromise attacks. Password-only accounts are low-hanging fruit.
EOF
}


# ============================================
# 15. ATTACK TYPES — RECOGNISING THE PATTERN
# ============================================

# Every attack has a specific mechanism, a specific layer, and a
# specific defense. Learning them together means the defense makes sense
# instead of being a checkbox you implement because a compliance doc said so.

attack_types_demo() {
    echo "--- Common Network Attack Patterns ---"
    cat <<'EOF'
DoS/DDoS
  Mechanism:  overwhelm a target with traffic or requests
  Layer:      L3 (volumetric), L4 (SYN flood), L7 (HTTP flood)
  Defense:    rate limiting, scrubbing centers, anycast routing

ARP Poisoning
  Mechanism:  send forged ARP replies, associate attacker MAC with victim IP
  Layer:      L2
  Defense:    Dynamic ARP Inspection (DAI), static ARP entries

DNS Poisoning
  Mechanism:  corrupt DNS cache with false records, redirect users
  Layer:      L7 (application)
  Defense:    DNSSEC, DNS over HTTPS/TLS, recursive resolver hardening

VLAN Hopping
  Mechanism:  negotiate trunk with switch, or double-tag frames
  Layer:      L2
  Defense:    disable DTP, change native VLAN, restrict trunk ports

On-Path (MITM)
  Mechanism:  position between two hosts, intercept and optionally modify traffic
  Layer:      L2-L7 depending on method
  Defense:    encryption end-to-end, certificate pinning, MFA

Rogue DHCP / Rogue AP
  Mechanism:  attacker device impersonates legitimate server
  Layer:      L2/L3 (DHCP), L2 (AP)
  Defense:    DHCP snooping, 802.1X port authentication, wireless IDS

SYN Flood
  Mechanism:  send thousands of SYN packets, never complete the handshake
              server allocates state for each — exhausts connection table
  Layer:      L4
  Defense:    SYN cookies, connection rate limiting, firewall state limits
EOF
}


# ============================================
# 16. DISASTER RECOVERY — RPO, RTO, AND WHY BACKUPS THAT AREN'T TESTED DON'T COUNT
# ============================================

# DR felt like a paperwork exercise until I connected RPO/RTO to ransomware.
# When every file is encrypted at 2am, the RPO is the question:
# "How much data did we just permanently lose?"
# The RTO is: "How long until the business can function again?"
# If you haven't tested the restore process, you don't have a backup —
# you have a file you haven't opened yet.

dr_demo() {
    echo "--- Recovery Objectives ---"
    cat <<'EOF'
RPO — Recovery Point Objective
  Maximum acceptable data loss, expressed as time.
  RPO = 4 hours → backups run every 4 hours → worst case: lose 4 hours of data
  Lower RPO = more frequent backups = higher cost

RTO — Recovery Time Objective
  Maximum acceptable downtime.
  RTO = 2 hours → systems must be restored within 2 hours of an incident
  Lower RTO = warmer standby systems = higher cost

Ransomware scenario:
  Attack encrypts everything at 02:00.
  Last backup was at 22:00.
  RPO was 4 hours → you lost 4 hours of data.
  Your RTO is 8 hours → you must be operational by 10:00.
  Your backup restore takes 10 hours → you missed your RTO → business impact.
EOF

    echo ""
    echo "--- Site Resiliency Tiers ---"
    cat <<'EOF'
Hot Site   → fully operational, real-time or near-real-time data sync
             failover in minutes, highest cost
             use for: financial systems, critical infrastructure

Warm Site  → partially configured, needs data restoration and some setup
             failover in hours, medium cost
             use for: most enterprise workloads

Cold Site  → empty space with power and connectivity, bring your own hardware
             failover in days/weeks, lowest cost
             use for: non-critical systems, compliance checkboxes
EOF

    echo ""
    echo "--- Backup Types ---"
    cat <<'EOF'
Full backup        → complete snapshot every time — slowest, most storage, simplest restore
Incremental backup → only changes since the last backup (any type)
                     fast to back up, slow to restore (need full + every incremental)
Differential       → changes since last FULL backup only
                     faster restore than incremental (need full + one differential)

3-2-1 Rule:
  3 copies of data
  2 different storage media
  1 copy offsite (or offline — air-gapped beats cloud-only for ransomware)
EOF
}


# ============================================
# MAIN
# ============================================

main() {
    mkdir -p /tmp/lab

    echo "=========================================="
    echo " Week 04 — Networking Fundamentals"
    echo " Durga Madhav Chandra"
    echo "=========================================="
    echo ""

    echo "=== 1. OSI Model — Layers Mapped to Attacks ==="
    osi_model_demo
    echo ""

    echo "=== 2. TCP vs UDP — The Handshake ==="
    tcp_udp_demo
    echo ""

    echo "=== 3. Common Ports — Recognising Services ==="
    common_ports_demo
    echo ""

    echo "=== 4. ICMP — Diagnostics and Abuse ==="
    icmp_demo
    echo ""

    echo "=== 5. IPv4 Subnetting — The Math That Runs Everything ==="
    subnetting_demo
    echo ""

    echo "=== 6. DNS — Name Resolution and Its Risks ==="
    dns_demo
    echo ""

    echo "=== 7. DHCP — Automatic Assignment and Rogue Servers ==="
    dhcp_demo
    echo ""

    echo "=== 8. ARP — No Authentication, Full Trust ==="
    arp_demo
    echo ""

    echo "=== 9. Firewall Rules & ACLs — Order Is Everything ==="
    firewall_acl_demo
    echo ""

    echo "=== 10. VLANs — Segmentation and How It Breaks ==="
    vlan_demo
    echo ""

    echo "=== 11. Network Monitoring — Seeing What's Actually Happening ==="
    monitoring_demo
    echo ""

    echo "=== 12. Wireshark Filters — Reading the Wire ==="
    wireshark_filters_demo
    echo ""

    echo "=== 13. Diagnostic Tools — First Five Minutes of Triage ==="
    diagnostic_tools_demo
    echo ""

    echo "=== 14. AAA — The Framework Behind Every Access Control ==="
    aaa_demo
    echo ""

    echo "=== 15. Attack Types — Pattern Recognition ==="
    attack_types_demo
    echo ""

    echo "=== 16. Disaster Recovery — RPO, RTO, and Tested Backups ==="
    dr_demo
    echo ""

    echo "=========================================="
    echo " Done. All sections ran against localhost"
    echo " or read-only system info only."
    echo "=========================================="
}

main "$@"
