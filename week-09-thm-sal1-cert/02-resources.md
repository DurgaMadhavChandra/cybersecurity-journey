# Week-09 — Resources

This is everything I used this week to complete the **Pre Security** path and all 14 modules of the **Cyber Security 101** path on TryHackMe.
I'm documenting this so anyone starting from scratch can follow the same path.
Unlike Week-05, which was theory-heavy (Google Cybersecurity Certificate on Coursera), this week was almost entirely hands-on — VMs, terminals, and actual tools instead of slides.

---

## The Resources That Shaped This Week

Week-05 was reading, reflecting, and connecting theory to frameworks.
This week flipped that — it was deploying machines, running commands, and watching tools like Nmap, Wireshark, and Metasploit actually behave, instead of just reading about what they do.

TryHackMe was the backbone of the week, but wherever a room introduced a real tool, I made sure to also check the tool's own official docs — Nmap's own reference guide, PortSwigger's own Burp Suite docs, Rapid7's own Metasploit docs — instead of relying only on the room's guided walkthrough.
That's the shift that made this week feel less like following instructions and more like actually understanding what each tool does and why.

---

## Core Resources I Used This Week

| Resource | Link | Type |
|----------|------|------|
| TryHackMe — Pre Security Path | [tryhackme.com/path/outline/presecurity](https://tryhackme.com/path/outline/presecurity) | Learning Path — 13 rooms |
| TryHackMe — Cyber Security 101 Path | [tryhackme.com/path/outline/cybersecurity101](https://tryhackme.com/path/outline/cybersecurity101) | Learning Path — 14 modules |
| Nmap Reference Guide | [nmap.org/book/man.html](https://nmap.org/book/man.html) | Primary Source — Free |
| Wireshark User's Guide | [wireshark.org/docs](https://www.wireshark.org/docs/) | Primary Source — Free |
| PortSwigger Burp Suite Docs | [portswigger.net/burp/documentation](https://portswigger.net/burp/documentation) | Primary Source — Free |
| Metasploit Documentation | [docs.rapid7.com/metasploit](https://docs.rapid7.com/metasploit/) | Primary Source — Free |
| OWASP Top 10 | [owasp.org/www-project-top-ten](https://owasp.org/www-project-top-ten/) | Primary Source — Free |
| CyberChef | [gchq.github.io/CyberChef](https://gchq.github.io/CyberChef/) | Primary Source — Free Tool |

---

## Activities — Where the Theory Got Applied

Unlike Week-05's portfolio write-ups, this week's application was direct: every room ends in a live VM with a flag to actually capture, not a written exercise.

### What I Completed
| Activity | Path | What It Involved |
|------|-----------|-----------|
| Network recon walkthroughs | Pre Security | Used `ping`, `traceroute`, and basic Nmap scans against room VMs |
| Linux + Windows fundamentals rooms | Both paths | Hands-on terminal/CLI practice — navigation, permissions, processes, PowerShell |
| Networking deep-dive rooms | Cyber Security 101 | Ran real Nmap scans, captured traffic in Wireshark, inspected packets in Tcpdump |
| Cryptography + password cracking rooms | Cyber Security 101 | Cracked sample hashes with John the Ripper, worked through symmetric vs asymmetric exercises |
| Exploitation Basics rooms (incl. "Blue") | Cyber Security 101 | Used Metasploit/Meterpreter against a deliberately unpatched VM |
| Web Hacking + Offensive Tooling rooms | Cyber Security 101 | Intercepted requests in Burp Suite, ran Hydra/Gobuster/SQLMap against target rooms |
| Defensive Security + Security Solutions rooms | Cyber Security 101 | Worked through SOC/DFIR/log-analysis scenarios and SIEM/IDS/firewall concepts |
| Defensive Tooling rooms | Cyber Security 101 | Used CyberChef for encode/decode challenges, read through CAPA/REMnux/FlareVM material |

### Why This Mattered
Reading that Metasploit "exploits known vulnerabilities" is one thing. Actually running `search`, `use`, `set RHOSTS`, and watching a Meterpreter session pop on the "Blue" VM is what made the whole exploitation chain click.
Same with Wireshark — Week-05 explained encapsulation as a diagram; this week I was actually staring at the headers stacked on top of each other in a live capture.

---

## Topic-wise Resources

### Part 1 — Pre Security Path

#### 1. Offensive & Defensive Security Intro, Careers

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| TryHackMe — Pre Security Path | [Open](https://tryhackme.com/path/outline/presecurity) | Must Do | Covers the offensive/defensive mindset split and the core career-role map |

**Real World Connection:**
Doing the guided Gobuster exercise against a fake bank site made "web directory brute-forcing" stop being a phrase and start being a thing I'd actually done.

---

#### 2. Networking Fundamentals, LAN, OSI Model, Packets/Frames/Ports

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| TryHackMe — Pre Security Path (Networking rooms) | [Open](https://tryhackme.com/path/outline/presecurity) | Must Do | Ground-floor networking: IP/MAC, topologies, OSI, TCP handshake, ports |
| Wireshark User's Guide | [Read](https://www.wireshark.org/docs/) | Recommended | Went straight to Wireshark's own docs to understand filter syntax properly |

**Real World Connection:**
Watching the three-way handshake happen in real time (instead of just reading SYN → SYN/ACK → ACK) made TCP feel mechanical instead of abstract.

---

#### 3. Extending Your Network, How the Web Works, Website Fundamentals, Web Architecture

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| TryHackMe — Pre Security Path (Web rooms) | [Open](https://tryhackme.com/path/outline/presecurity) | Must Do | Covers DNS, HTTP(S), front-end/back-end split, and how firewalls/VPNs extend a network |

**Real World Connection:**
Finding sensitive data left in a page's source code during the Website Fundamentals room was the first time "always check the source" stopped being generic advice and became a habit.

---

#### 4. Linux Fundamentals & Windows Fundamentals

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| TryHackMe — Pre Security Path (Linux/Windows rooms) | [Open](https://tryhackme.com/path/outline/presecurity) | Must Do | Terminal navigation, permissions, processes, cron, plus Windows GUI tools and UAC |

**Real World Connection:**
Getting comfortable with `grep`, `find`, and permission bits here is exactly what made the later Cyber Security 101 Linux rooms feel like a continuation rather than a restart.

---

### Part 2 — Cyber Security 101 Path

#### 5. Linux/Windows/AD Fundamentals & Command Line

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| TryHackMe — Cyber Security 101 Path | [Open](https://tryhackme.com/path/outline/cybersecurity101) | Must Do | Deeper Linux/Windows practice plus a first real look at Active Directory and PowerShell |

**Real World Connection:**
The Active Directory Basics room was genuinely new territory — domains, domain controllers, and OUs made me realize how different enterprise Windows security is from a single standalone machine.

---

#### 6. Networking (Concepts, Protocols, Wireshark, Tcpdump, Nmap)

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| TryHackMe — Cyber Security 101 Path (Networking module) | [Open](https://tryhackme.com/path/outline/cybersecurity101) | Must Do | Hands-on Nmap scanning, live packet capture, and secure vs. insecure protocol comparisons |
| Nmap Reference Guide | [Read](https://nmap.org/book/man.html) | Must Read | Checked the official flag reference instead of only copying room commands blindly |

**Real World Connection:**
Running my own `-sV -p-` Nmap scan and actually reading the open-port/service output is what separated "I know what Nmap is" from "I can use Nmap."

---

#### 7. Cryptography (Basics, Public Key, Hashing, John the Ripper)

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| TryHackMe — Cyber Security 101 Path (Cryptography module) | [Open](https://tryhackme.com/path/outline/cybersecurity101) | Must Do | Symmetric vs. asymmetric encryption, hashing, and a first real password-cracking exercise |
| John the Ripper docs | [Read](https://www.openwall.com/john/) | Recommended | Referenced the official docs for flag syntax while running wordlist attacks |

**Real World Connection:**
Cracking a sample hash with `rockyou.txt` made the "weak/reused passwords" warning from Week-05's notes feel concrete instead of theoretical.

---

#### 8. Exploitation Basics (Metasploit, Meterpreter, Blue)

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| TryHackMe — Cyber Security 101 Path (Exploitation module) | [Open](https://tryhackme.com/path/outline/cybersecurity101) | Must Do | Walks through a real CVE case study and a full Metasploit exploitation chain |
| Metasploit Documentation | [Read](https://docs.rapid7.com/metasploit/) | Must Read | Went to Rapid7's own docs to actually understand module/payload structure, not just paste commands |

**Real World Connection:**
The "Blue" room (unpatched SMB) was the single most eye-opening room this week — an old, well-documented vulnerability with a fully automated exploit path is a very direct argument for patch management.

---

#### 9. Web Hacking & Offensive Security Tooling (Burp, Hydra, Gobuster, SQLMap)

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| TryHackMe — Cyber Security 101 Path (Web Hacking + Tooling modules) | [Open](https://tryhackme.com/path/outline/cybersecurity101) | Must Do | SQL fundamentals, Burp Suite interception, and automated brute-force/injection tooling |
| PortSwigger Burp Suite Docs | [Read](https://portswigger.net/burp/documentation) | Must Read | Official docs for the Proxy tab and Repeater — used constantly during the web rooms |

**Real World Connection:**
Manually intercepting and editing a request in Burp before letting it hit the server made "never trust client-side validation" a lesson I proved to myself rather than just accepted.

---

#### 10. Defensive Security, Security Solutions, Defensive Tooling

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| TryHackMe — Cyber Security 101 Path (Defensive modules) | [Open](https://tryhackme.com/path/outline/cybersecurity101) | Must Do | SOC tiering, DFIR basics, log analysis, SIEM/IDS/firewall/vuln-scanner concepts |
| CyberChef | [Try](https://gchq.github.io/CyberChef/) | Must Try | Used it directly for encode/decode and quick data-transform challenges in the tooling rooms |

**Real World Connection:**
Running a suspicious string through CyberChef's recipe chain and watching it decode step-by-step made "defensive tooling" feel just as hands-on as the offensive side of the week.

---

#### 11. Career Module & OWASP Top 10 (2025)

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| TryHackMe — Cyber Security 101 Path (final modules) | [Open](https://tryhackme.com/path/outline/cybersecurity101) | Must Do | Recaps security principles and career roles, then closes with the 2025 OWASP Top 10 |
| OWASP Top 10 | [Read](https://owasp.org/www-project-top-ten/) | Must Read | Read the current list directly rather than relying only on the room's summary of it |

**Real World Connection:**
Seeing the 2025 list lean toward IAAA (identity/auth/access) failures tied straight back to the IAM concepts from Week-05's notes — the same theory, showing up again as a live, ranked risk category.

---

## Tools & Platforms I Used This Week

| Tool | Purpose | Link |
|------|---------|------|
| TryHackMe | Followed both the Pre Security and Cyber Security 101 paths | [tryhackme.com](https://tryhackme.com) |
| Nmap | Port/service scanning | [nmap.org](https://nmap.org) |
| Wireshark | Packet capture and analysis | [wireshark.org](https://www.wireshark.org) |
| Burp Suite | Intercepting proxy for web app testing | [portswigger.net/burp](https://portswigger.net/burp) |
| Metasploit Framework | Exploitation and post-exploitation | [metasploit.com](https://www.metasploit.com) |
| John the Ripper | Offline password cracking | [openwall.com/john](https://www.openwall.com/john/) |
| CyberChef | Encode/decode and data transforms | [gchq.github.io/CyberChef](https://gchq.github.io/CyberChef/) |
| OWASP.org | Read the current Top 10 list | [owasp.org](https://owasp.org/www-project-top-ten/) |

---

## My Honest Rating of This Week

| Topic | Difficulty | My Experience |
|-------|------------|---------------|
| Pre Security — Networking & Web basics | Easy | Reinforced Week-05's theory, mostly a confidence-building recap |
| Pre Security — Linux & Windows Fundamentals | Easy | Comfortable terminal work, straightforward |
| Linux/Windows/AD Fundamentals (CS101) | Medium | AD Basics was genuinely new — domains and OUs took an extra pass |
| Networking module (Nmap/Wireshark/Tcpdump) | Medium | Tool syntax took repetition; once it clicked, scanning felt natural |
| Cryptography & John the Ripper | Medium | Concepts were easy, actually running a successful crack took a few tries |
| Exploitation Basics (Metasploit/Blue) | Hard | Most difficult section — module/payload configuration had a real learning curve |
| Web Hacking & Offensive Tooling | Medium | Burp Suite's interface took time to get comfortable navigating |
| Defensive Security & Security Solutions | Easy | Conceptually familiar from Week-05's SIEM/incident response material |
| Defensive Tooling (CyberChef etc.) | Easy | Intuitive, visual, fastest section to pick up |
| OWASP Top 10 (2025) | Easy | Clear once mapped back to IAM/IAAA concepts already known |

---

## My Recommendation to Anyone Starting This Path

Start with **Pre Security** even if you're tempted to jump straight into Cyber Security 101 — the theory it builds (OSI, TCP/IP, Linux/Windows basics) is what makes every tool in Cyber Security 101 make sense instead of feeling like memorized commands.
Don't just follow the room's copy-paste instructions — pull up the tool's own official docs (Nmap, Wireshark, Burp, Metasploit) at least once per room so you understand what a flag or option actually does, not just that the walkthrough told you to use it.
The "Blue" room and the John the Ripper cracking exercise were worth doing slowly rather than rushing to the flag — the value is in understanding *why* the exploit or crack works, not just capturing the flag.

Week-05 was about understanding the structure the wire operates inside of. This week was about actually putting hands on that wire.
Both matter — an analyst who only knows the frameworks can't run an Nmap scan, and one who only knows the tools can't explain why the finding matters to the business.
This week, Nmap, Wireshark, Metasploit, and Burp Suite stopped being tool names from a slide and became things I've actually run against a target.
