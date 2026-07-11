# Week-05 — Resources

This is everything I used this week to complete **Course 1, Course 2, and Course 3** of the **Google Cybersecurity Professional Certificate** on Coursera.
I'm documenting this so anyone starting from scratch can follow the same path.
Unlike last week, this week wasn't about hands-on labs — it was about building the conceptual foundation everything else in this field sits on top of.

---

## The Resources That Shaped This Week

Last week I was in Wireshark, watching packets move across the wire.
This week was different — it was reading, reflecting, and connecting theory to the bigger picture of *why* the field exists at all.

Coursera was the backbone of the week, but I didn't want to treat the course as a closed box.
Wherever the course referenced a real standard, framework, or tool, I went and found the actual primary source — NIST's own framework pages, OWASP's own project page, MITRE's own CVE database — instead of just trusting the course's summary of them.
That's the shift that made this week feel less like memorising slides and more like understanding the actual professional landscape.

---

## Core Resources I Used This Week

| Resource | Link | Type |
|----------|------|------|
| Course 1 — Foundations of Cybersecurity | [coursera.org/learn/foundations-of-cybersecurity](https://www.coursera.org/learn/foundations-of-cybersecurity) | Coursera Course — Google Career Certificates |
| Course 2 — Play It Safe: Manage Security Risks | [coursera.org/learn/manage-security-risks](https://www.coursera.org/learn/manage-security-risks) | Coursera Course — Google Career Certificates |
| Course 3 — Connect and Protect: Networks and Network Security | [coursera.org/learn/networks-and-network-security](https://www.coursera.org/learn/networks-and-network-security) | Coursera Course — Google Career Certificates |
| NIST Cybersecurity Framework (CSF) | [nist.gov/cyberframework](https://www.nist.gov/cyberframework) | Primary Source — Free |
| NIST Risk Management Framework (RMF) | [csrc.nist.gov/projects/risk-management](https://csrc.nist.gov/projects/risk-management) | Primary Source — Free |
| OWASP Top 10 | [owasp.org/www-project-top-ten](https://owasp.org/www-project-top-ten/) | Primary Source — Free |
| (ISC)² Code of Ethics | [isc2.org/ethics](https://www.isc2.org/ethics) | Primary Source — Free |
| MITRE CVE Database | [cve.org](https://www.cve.org/) | Primary Source — Free |

---

## Course Activities — Where the Theory Got Applied

This week didn't have a personal lab like last week's Wireshark setup — but the certificate itself builds in hands-on portfolio activities, and I made sure to actually complete them properly instead of skimming through.

### What I Completed
| Activity | Course | What It Involved |
|------|-----------|-----------|
| Career Journal Reflections | Course 1 | Reflected on which of the 8 CISSP domains felt most relevant to my own goals |
| Security Audit Activity | Course 2 | Practiced auditing a fictional company's controls against a compliance checklist |
| Playbook Walkthrough | Course 2 | Worked through the six phases of incident response using a sample SIEM alert |
| Security Incident Report (NIST CSF) | Course 2/3 portfolio piece | Wrote an incident report using the NIST Cybersecurity Framework as the guide |
| OS Hardening Activity | Course 3 | Applied basic OS hardening techniques (disabling unused accounts/services) in a guided exercise |

### Why This Mattered
Reading about the NIST RMF's seven steps is one thing. Actually writing an incident report structured around it made the framework stop being an abstract diagram.
The audit activity was the same — I'd read "identify gaps between current and required state" a dozen times, but actually doing it against a fictional company's policy made me realize how much interpretation an auditor has to apply, even with a clear checklist in front of them.

---

## Topic-wise Resources

### Course 1 — Foundations of Cybersecurity

#### 1. Welcome to the Exciting World of Cybersecurity

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| Coursera — Course 1, Module 1 | [Watch](https://www.coursera.org/learn/foundations-of-cybersecurity) | Must Watch | Frames the analyst role, core responsibilities, and transferable skills clearly |
| Google Cybersecurity Certificate overview | [grow.google/certificates/cybersecurity](https://grow.google/certificates/cybersecurity/) | Recommended | Useful for seeing where this course fits in the full 8-course certificate path |

**Real World Connection:**
Understanding what a security analyst actually does day-to-day — monitoring, documenting, educating employees — is what turned this from an abstract job title into a real career target for me.

---

#### 2. The Evolution of Cybersecurity

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| Coursera — Course 1, Module 1 (history section) | [Watch](https://www.coursera.org/learn/foundations-of-cybersecurity) | Must Watch | Covers how past attacks shaped the field — useful historical context |
| (ISC)² Code of Ethics | [Read](https://www.isc2.org/ethics) | Must Read | The primary source for the ethical canons the course references |

**Real World Connection:**
Seeing how specific historical attacks led directly to specific frameworks and controls made it clear that nothing in this field exists arbitrarily — every rule has an incident behind it.

---

#### 3. Protect Against Threats, Risks, and Vulnerabilities

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| Coursera — Course 1, Module 2 | [Watch](https://www.coursera.org/learn/foundations-of-cybersecurity) | Must Watch | Clear breakdown of threat vs. risk vs. vulnerability with examples |
| MITRE CVE Database | [Browse](https://www.cve.org/) | Must Try | Went and looked up a few real CVEs to see what a documented vulnerability actually looks like |

**Real World Connection:**
Browsing actual CVE entries after learning the definitions made "vulnerability" stop being a textbook word — I could see the exact software, version, and flaw being tracked in the real world.

---

#### 4. Cybersecurity Tools and Programming Languages

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| Coursera — Course 1, Module 3 | [Watch](https://www.coursera.org/learn/foundations-of-cybersecurity) | Must Watch | Introduces SIEM tools, protocol analyzers, and Python/SQL relevance |

**Real World Connection:**
This module was the first time the course connected "soft" theory to actual tool names I'll be using later in the certificate (Splunk, Wireshark, Python) — it worked as a preview of everything still to come.

---

### Course 2 — Play It Safe: Manage Security Risks

#### 5. Security Domains

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| Coursera — Course 2, Module 1 | [Watch](https://www.coursera.org/learn/manage-security-risks) | Must Watch | Deeper dive into the 8 CISSP domains with applied scenarios |

**Real World Connection:**
This module trains the exact skill tested constantly in quizzes and real interviews: given a scenario, name the domain. Practicing that mapping repeatedly is what made it stick.

---

#### 6. Security Frameworks and Controls

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| Coursera — Course 2, Module 2 | [Watch](https://www.coursera.org/learn/manage-security-risks) | Must Watch | Walks through NIST RMF's 7 steps and the CIA triad in applied context |
| NIST Cybersecurity Framework | [Read](https://www.nist.gov/cyberframework) | Must Read | Went straight to NIST's own framework page instead of relying only on the course summary |
| NIST Risk Management Framework | [Read](https://csrc.nist.gov/projects/risk-management) | Must Read | Primary source for the 7-step RMF process the course references |
| OWASP Top 10 | [Read](https://owasp.org/www-project-top-ten/) | Recommended | The course references OWASP principles; reading the actual Top 10 list gave real context |

**Real World Connection:**
Reading NIST's own page after the course lesson showed me these frameworks are living documents, actively maintained — not static material invented for a certificate.

---

#### 7. Introduction to Cybersecurity Tools

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| Coursera — Course 2, Module 3 | [Watch](https://www.coursera.org/learn/manage-security-risks) | Must Watch | Introduces SIEM tools and how they correlate log data |

**Real World Connection:**
Understanding what a SIEM actually does before ever opening one made a huge difference — I now know *why* Splunk or Chronicle exists, not just that they exist.

---

#### 8. Use Playbooks to Respond to Incidents

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| Coursera — Course 2, Module 4 | [Watch](https://www.coursera.org/learn/manage-security-risks) | Must Watch | Covers the six phases of incident response in real depth |
| Portfolio Activity — Security Incident Report | Built into Coursera course | Must Do | Applied the NIST CSF directly to a sample incident scenario |

**Real World Connection:**
Writing an actual incident report using the NIST CSF as a guide made the six phases (preparation through post-incident activity) feel like a process I could follow under pressure, not just a list to recite.

---

### Course 3 — Connect and Protect: Networks and Network Security

#### 9. Network Architecture

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| Coursera — Course 3, Module 1 | [Watch](https://www.coursera.org/learn/networks-and-network-security) | Must Watch | Covers network types, devices, and the TCP/IP model clearly |

**Real World Connection:**
Since I'd already gone deep on OSI and network devices last week, this module mostly reinforced concepts — but the TCP/IP vs OSI comparison specifically filled a gap I hadn't closed before.

---

#### 10. Network Operations

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| Coursera — Course 3, Module 2 | [Watch](https://www.coursera.org/learn/networks-and-network-security) | Must Watch | Covers protocols, ports, and firewalls in the context of network operations |

**Real World Connection:**
This tied directly back to the port scanning and protocol work I did last week — seeing the same content taught from the certificate's angle reinforced it from a second direction.

---

#### 11. Secure Against Network Intrusions

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| Coursera — Course 3, Module 3 | [Watch](https://www.coursera.org/learn/networks-and-network-security) | Must Watch | Covers DoS/DDoS, on-path attacks, and packet sniffing with clear defensive pairings |

**Real World Connection:**
Learning these attacks a second time, now from the certificate's structured angle, made me realize how consistent the "attack → defensive control" pairing is across every source I've studied from so far.

---

#### 12. Security Hardening

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| Coursera — Course 3, Module 4 | [Watch](https://www.coursera.org/learn/networks-and-network-security) | Must Watch | Covers network, cloud, and OS hardening techniques |
| Portfolio Activity — OS Hardening | Built into Coursera course | Must Do | Hands-on exercise applying hardening techniques to a sample system |

**Real World Connection:**
This was the first time hardening moved from a list of bullet points to an actual applied exercise — disabling accounts and services in a guided activity made "reduce the attack surface" a concrete action instead of a slogan.

---

## Tools & Platforms I Used This Week

| Tool | Purpose | Link |
|------|---------|------|
| Coursera | Followed all three courses of the Google Cybersecurity Certificate | [coursera.org](https://www.coursera.org) |
| NIST.gov | Read primary source material on CSF and RMF | [nist.gov/cyberframework](https://www.nist.gov/cyberframework) |
| OWASP.org | Read the actual Top 10 list referenced in Course 2 | [owasp.org](https://owasp.org/www-project-top-ten/) |
| CVE.org | Looked up real vulnerability entries | [cve.org](https://www.cve.org/) |
| (ISC)² | Read the primary source Code of Ethics | [isc2.org/ethics](https://www.isc2.org/ethics) |

---

## My Honest Rating of This Week

| Topic | Difficulty | My Experience |
|-------|------------|---------------|
| CIA Triad & Security Domains | Easy | Recap from last week's context, clicked immediately |
| Threats, Risks, Vulnerabilities | Easy | Definitions were clear; CVE browsing made it concrete |
| Frameworks & Controls (NIST, OWASP) | Medium | Reading the primary sources took more effort than just watching the videos, but it stuck better |
| Security Ethics | Easy | Straightforward, but genuinely important to sit with, not just skim |
| SIEM & Playbooks | Medium | Conceptually simple, but the six-phase incident response process took a couple passes to fully internalize |
| Security Audits | Medium | The audit activity revealed how much judgment is involved even with a clear checklist |
| Network Architecture & Operations | Easy | Reinforced last week's deep dive rather than introducing new difficulty |
| Network Intrusions & Hardening | Medium | Familiar attack types, but hardening as an *applied* activity (not just theory) was the most valuable part of the week |

---

## My Recommendation to Anyone Starting This Path

Start with the **Google Cybersecurity Certificate on Coursera** — Courses 1 through 3 build in exactly the right order: foundations, risk management, then networks.
Don't just watch the videos passively — whenever the course references a named framework or standard (NIST, OWASP, CVE, ISC²), go read the primary source directly.
Actually complete the portfolio activities. Writing a real incident report and doing a real hardening exercise is what turns the course's terminology into something you can explain out loud.

Last week was about touching the wire. This week was about understanding the structure the wire operates inside of.
Both matter — a security analyst who only knows the frameworks can't read a packet capture, and one who only knows Wireshark can't explain *why* the organization cares.
This week, I stopped seeing NIST and OWASP as acronyms to memorise and started seeing them as living documents written by people solving the same problems I'm learning to solve.
