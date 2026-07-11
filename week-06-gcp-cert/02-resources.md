# Week-06 — Resources

This is everything I used this week to complete **Course 4** and **Course 5** of the **Google Cybersecurity Professional Certificate** on Coursera.
I'm documenting this so anyone starting from scratch can follow the same path.
This week was a shift in gear from last week — Weeks 1 through 5 built the conceptual foundation, and this week is where the certificate hands you the terminal and the database and says "now actually do something with it."

---

## The Resources That Shaped This Week

Week 5 was reading, reflecting, and connecting theory to the bigger picture. This week flipped that completely — it was hands-on, command-line, syntax-first learning, closer in spirit to the Wireshark week than the framework-reading week.

Coursera was still the backbone, but for Linux and SQL specifically, I didn't want to just watch someone else type commands — I wanted my fingers on the keyboard making the same mistakes a real analyst would make. So alongside the course labs, I set up my own practice environment and worked through extra exercises outside the guided activities.
For Course 5, the shift back toward asset classification and threat modeling meant going back to primary sources again — MITRE's ATT&CK framework directly, not just the course's summary of it.

---

## Core Resources I Used This Week

| Resource | Link | Type |
|----------|------|------|
| Course 4 — Tools of the Trade: Linux and SQL | [coursera.org/learn/linux-and-sql](https://www.coursera.org/learn/linux-and-sql) | Coursera Course — Google Career Certificates |
| Course 5 — Assets, Threats, and Vulnerabilities | [coursera.org/learn/assets-threats-and-vulnerabilities](https://www.coursera.org/learn/assets-threats-and-vulnerabilities) | Coursera Course — Google Career Certificates |
| MITRE ATT&CK Framework | [attack.mitre.org](https://attack.mitre.org/) | Primary Source — Free |
| OWASP Top 10 | [owasp.org/www-project-top-ten](https://owasp.org/www-project-top-ten/) | Primary Source — Free |
| MITRE CVE Database | [cve.org](https://www.cve.org/) | Primary Source — Free |
| Linux Journey | [linuxjourney.com](https://linuxjourney.com/) | Practice — Free |
| SQLBolt | [sqlbolt.com](https://sqlbolt.com/) | Practice — Free |

---

## Course Activities — Where the Theory Got Applied

This week had real hands-on labs again, similar to the Wireshark week — Course 4 in particular is built entirely around a Linux terminal sandbox and a SQL query environment baked into Coursera itself.

### What I Completed
| Activity | Course | What It Involved |
|------|-----------|-----------|
| Linux Filesystem Navigation Lab | Course 4 | Navigated a simulated filesystem using `pwd`, `ls`, `cd`, `mkdir`, `cp`, `mv`, `rm` |
| File Permissions Lab | Course 4 | Practiced `chmod` and `chown` on sample files to enforce least privilege |
| SQL Query Lab | Course 4 | Wrote `SELECT`, `WHERE`, and `JOIN` queries against a sample security-log-style database |
| Asset Classification Activity | Course 5 | Classified a fictional company's assets into Public/Internal-Only/Confidential/Restricted tiers |
| Threat Modeling Walkthrough | Course 5 | Applied a threat modeling framework to a sample system to identify and prioritize risks |

### Why This Mattered
Reading about `chmod` numeric notation is one thing. Actually getting a permission wrong, having a script fail to execute, and having to work backward to figure out *why* — that's what made the r/w/x model finally click instead of just being memorized numbers.
The SQL labs were the same story — writing a `JOIN` that returned nothing because I had the key backward taught me more about primary/foreign key relationships than any diagram could have.

---

## Topic-wise Resources

### Course 4 — Tools of the Trade: Linux and SQL

#### 1. Operating Systems and the Linux Foundation

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| Coursera — Course 4, Module 1 | [Watch](https://www.coursera.org/learn/linux-and-sql) | Must Watch | Explains the OS/hardware/application relationship and GUI vs. CLI clearly |
| Linux Journey | [linuxjourney.com](https://linuxjourney.com/) | Recommended | Free, interactive companion for building Linux fundamentals outside the course sandbox |

**Real World Connection:**
I'd touched a terminal before, but this module was the first time I understood *why* the shell exists as an interface — not just that it's "the black screen with text."

---

#### 2. Navigating the Filesystem and the Bash Shell

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| Coursera — Course 4, Module 2 | [Watch](https://www.coursera.org/learn/linux-and-sql) | Must Watch | Covers filesystem hierarchy and core navigation commands |
| Coursera Terminal Lab | Built into course | Must Do | Hands-on practice navigating and managing files via Bash |

**Real World Connection:**
Once I could move around `/var/log`, `/etc`, and `/home` without checking notes, log files stopped being abstract locations mentioned in Course 1 and 2 — they became places I actually knew how to get to.

---

#### 3. File Permissions and User Authorization

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| Coursera — Course 4, Module 3 | [Watch](https://www.coursera.org/learn/linux-and-sql) | Must Watch | Covers `chmod`, `chown`, and the owner/group/others permission model |
| Portfolio Activity — Permissions Lab | Built into course | Must Do | Practiced setting and troubleshooting real permission errors |

**Real World Connection:**
This is the module where "least privilege" from Course 1's security domains stopped being a phrase and became something I could actually configure with a command.

---

#### 4. Relational Databases and SQL

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| Coursera — Course 4, Module 4 | [Watch](https://www.coursera.org/learn/linux-and-sql) | Must Watch | Introduces tables, keys, and core SQL syntax including joins |
| SQLBolt | [sqlbolt.com](https://sqlbolt.com/) | Recommended | Free interactive SQL exercises to reinforce `SELECT`, `WHERE`, and `JOIN` beyond the course labs |

**Real World Connection:**
Writing my first working `INNER JOIN` and actually getting the right combined result back was the single most satisfying moment of the week — it's the exact skill that turns "search through logs manually" into "just query the database."

---

### Course 5 — Assets, Threats, and Vulnerabilities

#### 5. Introduction to Assets and Asset Classification

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| Coursera — Course 5, Module 1 | [Watch](https://www.coursera.org/learn/assets-threats-and-vulnerabilities) | Must Watch | Covers asset types, the asset lifecycle, and classification tiers |
| Portfolio Activity — Asset Classification | Built into course | Must Do | Classified a fictional company's assets into Public/Internal-Only/Confidential/Restricted |

**Real World Connection:**
This tied directly back to Course 1's Asset Security domain — except this time I was actually doing the classification instead of just reading the definition of it.

---

#### 6. Understanding the Attack Surface

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| Coursera — Course 5, Module 2 | [Watch](https://www.coursera.org/learn/assets-threats-and-vulnerabilities) | Must Watch | Covers attack surface components and reduction strategies |
| OWASP Top 10 | [Read](https://owasp.org/www-project-top-ten/) | Recommended | Reinforced how web application attack surface maps to real, ranked risks |

**Real World Connection:**
Mapping out every network-facing service, endpoint, and human factor for a sample environment made "attack surface" feel like a literal checklist I could walk through, not an abstract phrase.

---

#### 7. Threat Actors, Social Engineering, and Malware

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| Coursera — Course 5, Module 3 | [Watch](https://www.coursera.org/learn/assets-threats-and-vulnerabilities) | Must Watch | Covers threat actor types, social engineering techniques, and malware categories |
| MITRE CVE Database | [Browse](https://www.cve.org/) | Must Try | Cross-referenced a few malware-related CVEs to see documented real-world examples |

**Real World Connection:**
This built directly on Course 1's threat actor overview and Course 2's malware/social engineering section — but going through it a third time, from the angle of "how would I model this as a risk," is what finally made the different actor types feel distinct instead of interchangeable.

---

#### 8. Threat Modeling

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| Coursera — Course 5, Module 4 | [Watch](https://www.coursera.org/learn/assets-threats-and-vulnerabilities) | Must Watch | Introduces the threat modeling process and STRIDE categories |
| MITRE ATT&CK Framework | [Read](https://attack.mitre.org/) | Must Read | Went to the primary source instead of just the course's summary of adversary tactics |
| Portfolio Activity — Threat Model Walkthrough | Built into course | Must Do | Applied STRIDE to a sample system to identify and prioritize threats |

**Real World Connection:**
Reading MITRE's own ATT&CK matrix after the course lesson showed me it's an actively maintained, constantly updated reference used in real SOC work — not a static diagram made for a certificate.

---

## Tools & Platforms I Used This Week

| Tool | Purpose | Link |
|------|---------|------|
| Coursera | Followed Course 4 and Course 5 of the Google Cybersecurity Certificate | [coursera.org](https://www.coursera.org) |
| Linux Journey | Extra Linux practice outside the course sandbox | [linuxjourney.com](https://linuxjourney.com/) |
| SQLBolt | Extra SQL practice, especially joins | [sqlbolt.com](https://sqlbolt.com/) |
| MITRE ATT&CK | Read primary source material on adversary tactics and techniques | [attack.mitre.org](https://attack.mitre.org/) |
| OWASP.org | Reinforced attack surface concepts against the actual Top 10 list | [owasp.org](https://owasp.org/www-project-top-ten/) |
| CVE.org | Looked up real malware-related vulnerability entries | [cve.org](https://www.cve.org/) |

---

## My Honest Rating of This Week

| Topic | Difficulty | My Experience |
|-------|------------|---------------|
| Linux Filesystem Navigation | Easy | Commands were intuitive once I stopped overthinking absolute vs. relative paths |
| File Permissions (`chmod`/`chown`) | Medium | Numeric notation took a couple of tries before it stopped feeling like arbitrary math |
| SQL Basics (`SELECT`/`WHERE`) | Easy | Syntax was straightforward and satisfying almost immediately |
| SQL Joins | Medium | Conceptually simple, but picking the right join type for the right question took real practice |
| Asset Classification | Easy | Direct extension of Course 1's Asset Security domain, so it clicked fast |
| Attack Surface Analysis | Medium | Easy to define, harder to actually map exhaustively for a real system |
| Threat Actors & Social Engineering (3rd pass) | Easy | Familiar material by now, but modeling it as risk instead of just recognizing it was the useful part |
| Threat Modeling (STRIDE) | Medium | The six categories are easy to list, but mapping a real scenario to the right one took a few attempts |

---

## My Recommendation to Anyone Starting This Path

If Weeks 1 through 3 gave you the vocabulary and Week 5's framework reading gave you the structure, **Course 4 is where you finally get your hands dirty** — don't skip the labs, and don't just copy the commands from the video without understanding what each flag does.
For Course 5, resist the urge to skim the threat actor and malware sections just because you've technically seen them before in Course 1 and 2 — the value this time is in *applying* them through threat modeling, not re-reading definitions.
Go straight to MITRE ATT&CK's own site at least once. It's the same instinct that made NIST and OWASP click in Week 5 — primary sources make frameworks feel alive instead of memorized.

Last week was about understanding the structure the wire operates inside of. This week was about finally operating inside that structure myself — typing the commands, writing the queries, and building the threat model instead of just reading about all three.
Two courses down this week, five total complete. The terminal doesn't feel intimidating anymore, and neither does a blank SQL query window — that alone tells me the hands-on approach is working.
