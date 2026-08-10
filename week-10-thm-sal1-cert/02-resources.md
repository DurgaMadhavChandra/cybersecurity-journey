# Week-10 — Resources

This is everything I used this week to complete the **Cyber Threat Intelligence** module of the **SOC Level 1 Path** on TryHackMe.
I'm documenting this so anyone starting from scratch can follow the same path.
Unlike Week-09, which was almost entirely hands-on tooling (Nmap, Wireshark, Metasploit, Burp), this week went back to being research- and framework-heavy — less "run the exploit," more "understand the adversary before they even trip an alert."

---

## The Resources That Shaped This Week

Week-09 was deploying VMs and watching tools behave. This week flipped that again — it was reading frameworks, mapping intrusions onto models, and learning the platforms (MISP, OpenCTI, YARA) that turn a single IOC into shared, actionable intel.

TryHackMe's SOC Level 1 Path was the backbone, but wherever a room introduced a framework or platform, I made sure to also check the primary source — MITRE's own ATT&CK site, the original Pyramid of Pain blog post, MISP's and OpenCTI's own project docs — instead of relying only on the room's summary of them. Same approach as Week-09, just applied to frameworks instead of tool flags.

---

## Core Resources I Used This Week

| Resource | Link | Type |
|----------|------|------|
| TryHackMe — SOC Level 1 Path (CTI module) | [tryhackme.com/path/attack-and-defend-soc-level1](https://tryhackme.com/path/attack-and-defend-soc-level1) | Learning Path |
| MITRE ATT&CK Framework | [attack.mitre.org](https://attack.mitre.org/) | Primary Source — Free |
| The Pyramid of Pain (David Bianco, original post) | [detect-respond.blogspot.com](http://detect-respond.blogspot.com/2013/03/the-pyramid-of-pain.html) | Primary Source — Free |
| Lockheed Martin — Cyber Kill Chain | [lockheedmartin.com/en-us/capabilities/cyber/cyber-kill-chain.html](https://www.lockheedmartin.com/en-us/capabilities/cyber/cyber-kill-chain.html) | Primary Source — Free |
| MISP Project | [misp-project.org](https://www.misp-project.org/) | Primary Source — Free Tool |
| OpenCTI Platform | [opencti.io](https://www.opencti.io/en/) | Primary Source — Free Tool |
| STIX 2.1 Specification (OASIS) | [oasis-open.github.io/cti-documentation](https://oasis-open.github.io/cti-documentation/) | Primary Source — Free |
| YARA Documentation | [yara.readthedocs.io](https://yara.readthedocs.io/) | Primary Source — Free |
| MITRE ATT&CK Navigator | [mitre-attack.github.io/attack-navigator](https://mitre-attack.github.io/attack-navigator/) | Tool — Free |
| Reference notes repo (SohaibBaloch978) | [github.com/SohaibBaloch978/Tryhackme_SOC_LEVEL_1-notes](https://github.com/SohaibBaloch978/Tryhackme_SOC_LEVEL_1-notes) | Community Notes |

---

## Activities — Where the Theory Got Applied

Unlike Week-09's flag-capture VMs, this week's application was research and mapping: pivoting across a Diamond Model, mapping a scenario onto ATT&CK, writing a YARA rule, and working an incident end-to-end in the practical rooms (Trooper, Summit, Eviction, Friday Overtime).

### What I Completed
| Activity | Room(s) | What It Involved |
|------|-----------|-----------|
| CTI fundamentals | Intro to Cyber Threat Intelligence | Intelligence Cycle, IOC vs IOA, strategic/tactical/operational/technical intel |
| Pyramid of Pain | Pyramid of Pain | Ranked indicator types by how much pain they cost an attacker to change |
| Kill chain modeling | Cyber Kill Chain, Unified Kill Chain | Mapped an intrusion's stages, then the more realistic 18-phase internal-pivot version |
| Diamond Model | Diamond Model of Intrusion Analysis | Practiced pivoting across Adversary/Infrastructure/Capability/Victim from one IOC |
| ATT&CK mapping | MITRE ATT&CK | Mapped TTPs to specific technique IDs instead of vague descriptions |
| TIP usage | Threat Intelligence Tools (MISP, OpenCTI) | Created events/attributes in MISP, explored OpenCTI's knowledge graph |
| Rule writing | YARA | Wrote basic meta/strings/condition rules for pattern matching |
| Full scenarios | Trooper, Summit, Eviction, Friday Overtime | Combined OSINT pivoting, MISP/OpenCTI lookups, and ATT&CK mapping into one investigation |

### Why This Mattered
Reading that a hash is "low pain" and a TTP is "high pain" is one thing. Actually watching an attacker in the practical rooms rotate an IP in seconds while their underlying technique stayed identical is what made the Pyramid of Pain click as a prioritization tool, not just a diagram to memorize.
Same with the Diamond Model — reading "pivot between vertices" is abstract until you're staring at one malicious IP in Trooper and using it to actually uncover the rest of a campaign's infrastructure.

---

## Topic-wise Resources

### 1. Intro to Cyber Threat Intelligence

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| TryHackMe — Intro to CTI room | [Open](https://tryhackme.com/path/attack-and-defend-soc-level1) | Must Do | Covers the Intelligence Cycle and the IOC vs IOA distinction that everything else this week builds on |

**Real World Connection:**
Realizing an IOC (a hash, an IP) is disposable to an attacker while an IOA (behavior) isn't reframed what "detection" should actually be chasing.

---

### 2. Pyramid of Pain

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| TryHackMe — Pyramid of Pain room | [Open](https://tryhackme.com/path/attack-and-defend-soc-level1) | Must Do | Walks through all six levels with practical examples |
| The Pyramid of Pain (original post) | [Read](http://detect-respond.blogspot.com/2013/03/the-pyramid-of-pain.html) | Must Read | Went to Bianco's own post instead of only the room's summary of it |

**Real World Connection:**
Blocking a hash felt productive until I mapped it against the pyramid and realized it costs an attacker nothing to regenerate.

---

### 3. Cyber Kill Chain & Unified Kill Chain

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| TryHackMe — Cyber Kill Chain room | [Open](https://tryhackme.com/path/attack-and-defend-soc-level1) | Must Do | The original 7-stage Lockheed Martin model |
| Lockheed Martin — Cyber Kill Chain | [Read](https://www.lockheedmartin.com/en-us/capabilities/cyber/cyber-kill-chain.html) | Recommended | Checked the source model directly rather than only the room's rewording |
| TryHackMe — Unified Kill Chain room | [Open](https://tryhackme.com/path/attack-and-defend-soc-level1) | Must Do | The 18-phase model that fixes the original's blind spot on post-compromise activity |

**Real World Connection:**
The original Kill Chain stops feeling complete the moment you ask "what happens after Installation?" — the Unified model is the answer.

---

### 4. Diamond Model of Intrusion Analysis

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| TryHackMe — Diamond Model room | [Open](https://tryhackme.com/path/attack-and-defend-soc-level1) | Must Do | Adversary/Infrastructure/Capability/Victim plus the meta-features and pivoting technique |

**Real World Connection:**
Practicing a pivot in Trooper — one malicious IP leading to related infrastructure — is what made "pivoting" a technique instead of a term.

---

### 5. MITRE ATT&CK Framework

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| TryHackMe — MITRE room | [Open](https://tryhackme.com/path/attack-and-defend-soc-level1) | Must Do | Tactics vs Techniques vs Sub-Techniques, and how to read the matrix |
| MITRE ATT&CK (official site) | [Read](https://attack.mitre.org/) | Must Read | Looked up real technique IDs directly instead of trusting memory |
| MITRE ATT&CK Navigator | [Try](https://mitre-attack.github.io/attack-navigator/) | Recommended | Visualized coverage gaps against a sample technique layer |

**Real World Connection:**
Mapping a scenario's behavior to a specific technique ID (instead of "the attacker did something sneaky with PowerShell") is the exact shift that makes intel shareable.

---

### 6. CTI Tools — MISP & OpenCTI

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| TryHackMe — Threat Intelligence Tools room | [Open](https://tryhackme.com/path/attack-and-defend-soc-level1) | Must Do | Hands-on MISP event/attribute creation and OpenCTI's knowledge graph |
| MISP Project docs | [Read](https://www.misp-project.org/) | Must Read | Went to MISP's own docs for TLP tagging and correlation behavior |
| OpenCTI Platform docs | [Read](https://www.opencti.io/en/) | Recommended | Checked OpenCTI's own site to understand the knowledge-graph model |
| STIX 2.1 Specification | [Read](https://oasis-open.github.io/cti-documentation/) | Recommended | Read the standard both platforms are built on, instead of assuming it |

**Real World Connection:**
Watching MISP flag a correlation the moment I added an IOC that matched an existing event made "shared community defense" concrete instead of a slogan.

---

### 7. YARA Rules

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| TryHackMe — YARA room | [Open](https://tryhackme.com/path/attack-and-defend-soc-level1) | Must Do | Rule structure (meta/strings/condition) and use cases in malware triage |
| YARA Documentation | [Read](https://yara.readthedocs.io/) | Must Read | Referenced the official syntax reference while writing rules, not just copying the room's example |

**Real World Connection:**
Writing a working rule and running it against a sample set is what made "threat intel made executable" stop being a tagline.

---

### 8. Applied CTI — Practical Rooms

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| TryHackMe — Trooper, Summit, Eviction, Friday Overtime | [Open](https://tryhackme.com/path/attack-and-defend-soc-level1) | Must Do | End-to-end scenarios combining OSINT pivoting, MISP/OpenCTI lookups, and ATT&CK mapping |
| Reference notes repo (SohaibBaloch978) | [Read](https://github.com/SohaibBaloch978/Tryhackme_SOC_LEVEL_1-notes) | Optional | Cross-checked my approach against someone else's notes after attempting rooms myself |

**Real World Connection:**
This is where Pyramid of Pain, Kill Chain, Diamond Model, and MITRE stopped being separate facts and became one workflow — exactly what a real investigation actually feels like.

---

## Tools & Platforms I Used This Week

| Tool | Purpose | Link |
|------|---------|------|
| TryHackMe | Followed the SOC Level 1 Path's CTI module | [tryhackme.com](https://tryhackme.com) |
| MITRE ATT&CK | TTP reference and technique mapping | [attack.mitre.org](https://attack.mitre.org/) |
| MITRE ATT&CK Navigator | Visualizing technique coverage | [mitre-attack.github.io/attack-navigator](https://mitre-attack.github.io/attack-navigator/) |
| MISP | IOC storage, correlation, TLP-tagged sharing | [misp-project.org](https://www.misp-project.org/) |
| OpenCTI | Knowledge-graph linking of threat entities | [opencti.io](https://www.opencti.io/en/) |
| YARA | Pattern-matching rules for malware identification | [yara.readthedocs.io](https://yara.readthedocs.io/) |

---

## My Honest Rating of This Week

| Topic | Difficulty | My Experience |
|-------|------------|---------------|
| Intro to CTI (Intelligence Cycle, IOC vs IOA) | Easy | Straightforward once the IOC/IOA distinction was clear |
| Pyramid of Pain | Easy | Intuitive concept, fastest room to get through |
| Cyber Kill Chain | Easy | Linear model, easy to memorize the 7 stages |
| Unified Kill Chain | Medium | 18 phases took real repetition to keep straight |
| Diamond Model | Medium | Pivoting logic made sense in theory, took the practical rooms to actually click |
| MITRE ATT&CK | Medium | Matrix is huge — navigating to the right technique took practice |
| MISP / OpenCTI | Hard | Most difficult section — platform UI and correlation logic had a real learning curve |
| YARA Rules | Medium | Syntax was manageable, writing an effective condition took a few tries |
| Practical rooms (Trooper, Summit, Eviction, Friday Overtime) | Hard | Combining everything under a realistic scenario was the real test of the week |

---

## My Recommendation to Anyone Starting This Module

Don't skip straight to the practical rooms — Pyramid of Pain, the Kill Chain models, and the Diamond Model are the lenses that make the practical scenarios readable instead of overwhelming.
Same rule as Week-09: check the primary source at least once per room — MITRE's own site for a technique ID, MISP's own docs for how correlation actually works — instead of only trusting the room's summary.
Trooper and Eviction are worth doing slowly. The value isn't finishing the room, it's actually practicing the pivot: one IOC leading you to infrastructure, to capability, to the adversary behind it.

Week-09 was about running tools against a target. This week was about understanding the target before the tools ever get used — the Pyramid of Pain, Kill Chain, and Diamond Model are all the same question asked three different ways: how far did the attacker get, and what will actually cost them to change?
An analyst who can only run Nmap can't explain why an intrusion matters. An analyst who only knows the frameworks can't operationalize a finding. This week, MISP, OpenCTI, and YARA stopped being acronyms and became things I've actually used to turn one IOC into something shareable.
