# Course 1 — Foundations of Cybersecurity Notes

---

## 1. What Is Cybersecurity?

### Definition
The practice of ensuring **confidentiality, integrity, and availability (CIA)** of information by protecting networks, devices, people, and data from unauthorized access or criminal exploitation.

### Why Cybersecurity Matters
```
Growth of the internet   → more connected devices = more attack surface
Migration to the cloud   → shared responsibility, new misconfig risks
Remote work expansion    → endpoints and data leave the traditional perimeter
```

### Business Impact of a Breach
| Impact Area | Example |
|---|---|
| Financial | Regulatory fines, ransom payments, lost revenue |
| Reputational | Loss of customer trust, brand damage |
| Legal/Compliance | Lawsuits, violation of regulations (GDPR, HIPAA, PCI-DSS) |
| Identity theft | Exposed customer/employee PII |

### Why It Matters for Cybersecurity
- Every other topic in this certificate exists to answer one question: how do we protect the CIA triad?
- Understanding business impact is what lets analysts prioritize risk instead of just chasing alerts.

### Key Takeaway
> Cybersecurity isn't just a technical function — it's a business risk function.
> Every control exists to protect confidentiality, integrity, or availability. If you can't tie a task back to one of those three, question why you're doing it.

---

## 2. The Role of a Security Analyst

### Core Responsibilities
```
Protecting computers and networks from information theft, damage, or unauthorized access
Monitoring networks and systems for breaches or intrusions
Installing and using software, such as firewalls and data encryption programs
Documenting security breaches and assessing the damage they cause
Conducting risk assessments, penetration tests, and vulnerability scans
Working with IT and other departments to establish disaster recovery plans
Educating employees on how to identify suspicious activity
```

### Common Entry-Level Titles
| Title | Focus |
|---|---|
| Security Analyst | General monitoring, detection, response |
| SOC (Security Operations Center) Analyst | Real-time monitoring in a dedicated team |
| Cybersecurity Specialist | Broad technical protection duties |
| Cybersecurity Associate | Junior-level, supporting senior analysts |
| IT Auditor | Reviewing controls for compliance |

### Transferable & Foundational Skills
```
Transferable  → communication, collaboration, problem-solving, analysis, attention to detail
Technical     → programming, SIEM tools, networks, Linux, incident response
```

### Why It Matters for Cybersecurity
- Knowing the actual day-to-day tasks helps you map coursework to real job duties instead of studying in the abstract.
- Transferable skills are often the deciding factor in entry-level hiring, since technical depth is built on the job.

### Key Takeaway
> A security analyst's job is equal parts technical skill and business communication.
> You're not just stopping attacks — you're explaining risk to people who don't speak "security."

---

## 3. The CIA Triad

### The Three Pillars
| Pillar | Meaning | Attack That Violates It |
|---|---|---|
| Confidentiality | Only authorized users can access data | Data breach, credential theft |
| Integrity | Data is accurate, consistent, and untampered | Data tampering, unauthorized modification |
| Availability | Data and systems are accessible when needed | DoS/DDoS attacks |

### Why It Matters for Cybersecurity
- Nearly every security control maps back to protecting one (or more) of these three principles.
- When analyzing an incident, asking "which part of the CIA triad was affected?" is a fast way to classify severity and response.

### Key Takeaway
> The CIA triad is the yardstick every security decision gets measured against.
> Confidentiality, integrity, availability — memorize it, because you'll use it to evaluate every scenario in this field.

---

## 4. Threats, Risks, and Vulnerabilities

### Definitions
```
Threat        → any circumstance or event that can negatively impact assets
Risk          → anything that can impact the confidentiality, integrity, or availability of an asset
Vulnerability → a weakness that can be exploited by a threat
```

### Relationship
```
Vulnerability (weakness) + Threat (attacker/event) → Risk (potential impact)
```

### Common Threat Actor Types
| Actor | Motivation |
|---|---|
| Advanced Persistent Threats (APTs) | Long-term, state-sponsored, stealthy access |
| Insider Threats | Employees, ex-employees, or partners misusing access |
| Hacktivists | Political/social motivation |
| Script Kiddies | Use pre-built tools, low skill, opportunistic |
| Competitors | Corporate/industrial espionage |

### Common Attack Types (Preview)
```
Malware                → viruses, worms, ransomware, spyware
Social engineering      → phishing, pretexting, baiting
Physical attacks        → theft of devices, tailgating
Supply chain attacks    → compromising a trusted vendor to reach the target
```

### Why It Matters for Cybersecurity
- Distinguishing threat vs. risk vs. vulnerability is one of the most commonly tested — and most commonly confused — concepts in entry-level security.
- Threat actor profiling helps prioritize defenses: an APT and a script kiddie require very different levels of vigilance.

### Key Takeaway
> A vulnerability without a threat is just a bug. A threat without a vulnerability has nothing to exploit.
> Risk is what happens when the two meet — your job is to shrink that overlap.

---

## 5. Security Frameworks and Controls

### What Are Frameworks?
Guidelines used for building plans to help mitigate risk and threats to data and privacy.

### Purpose of Frameworks
```
Protecting PII (Personally Identifiable Information)
Securing financial information
Identifying security weaknesses
Managing organizational risks
Aligning security with business goals
```

### CIA Triad + Frameworks
Frameworks typically build around a set of guiding principles, or **security controls**, that support the CIA triad.

### Common Frameworks & Controls Referenced in the Course
| Framework | Focus |
|---|---|
| NIST CSF (Cybersecurity Framework) | Risk management, 5 core functions |
| NIST RMF (Risk Management Framework) | 7-step risk process |
| NIST SP 800-53 | Catalog of security/privacy controls (US federal systems) |
| CIS Critical Security Controls | Prioritized, actionable defensive controls |
| OWASP Top 10 | Most critical web application security risks |

### NIST RMF — 7-Step Process
```
Prepare → Categorize → Select → Implement → Assess → Authorize → Monitor
```

### CIA + Categorization
```
Confidential (low)   → limited harm if disclosed
Confidential (mod.)  → serious harm if disclosed
Confidential (high)  → severe/catastrophic harm if disclosed
```

### Why It Matters for Cybersecurity
- Frameworks give analysts a repeatable, defensible structure instead of ad-hoc decisions.
- Many compliance requirements (government contracts, healthcare, finance) explicitly mandate a named framework.

### Key Takeaway
> Frameworks aren't bureaucracy for its own sake — they're the checklist that keeps security consistent when the pressure is on.
> Learn the names now; you'll see NIST and CIS referenced constantly in real job postings.

---

## 6. Security Ethics

### Guiding Ethical Principles
```
Confidentiality  → protecting information from unauthorized access
Privacy protection → safeguarding personal data from unauthorized use
Laws              → legal rules a community recognizes as binding
```

### Key Ethical Concepts
| Concept | Meaning |
|---|---|
| Unauthorized access | Gaining entry to systems/data without permission — illegal even with good intent |
| Right to privacy | Freedom from unauthorized intrusion into personal data |
| Informed consent | Ensuring individuals know how their data is used |
| Codes of ethics | e.g., (ISC)² Code of Ethics — guides professional conduct |

### (ISC)² Code of Ethics — Canons (Summary)
```
1. Protect society, the common good, public trust and confidence, and the infrastructure
2. Act honorably, honestly, justly, responsibly, and legally
3. Provide diligent and competent service to principals
4. Advance and protect the profession
```

### Why It Matters for Cybersecurity
- Analysts routinely have privileged access to sensitive data — ethics is what stops that access from becoming abuse.
- Ethical missteps (even unintentional ones, like exceeding scope during a pentest) can carry legal consequences.

### Key Takeaway
> Technical skill without ethics is a liability, not an asset.
> You will have access most people never will — treat every byte of that access as a responsibility, not a privilege to exploit.

---

## 7. The Eight CISSP Security Domains

### Overview
A framework by (ISC)² that organizes the field of cybersecurity into eight domains, used as the basis of the CISSP certification.

### The Eight Domains
| # | Domain | Focus |
|---|---|---|
| 1 | Security and Risk Management | Defines security goals, risk mitigation, compliance, business continuity, legal regulations |
| 2 | Asset Security | Securing digital and physical assets; data storage, handling, classification |
| 3 | Security Architecture and Engineering | Optimizing data security through effective tools, systems, and processes |
| 4 | Communication and Network Security | Managing and securing physical networks and wireless communications |
| 5 | Identity and Access Management (IAM) | Controlling how users access and interact with data (authentication/authorization) |
| 6 | Security Assessment and Testing | Conducting security control testing, audits, and assessments |
| 7 | Security Operations | Conducting investigations, implementing preventative measures, incident response |
| 8 | Software Development Security | Using secure coding practices throughout the software development lifecycle (SDLC) |

### Why It Matters for Cybersecurity
- This is the industry-standard way to organize the entire field — nearly every job description maps to one or more of these domains.
- Understanding the domains helps you see where a given task (patch management, access reviews, incident triage) actually fits in the bigger picture.

### Key Takeaway
> The eight domains are the map of the entire cybersecurity profession.
> You won't master all eight at once — but knowing they exist tells you where every future skill you learn actually belongs.

---

## 8. Security Domain Deep Dive — Risk Management & Asset Security

### Security and Risk Management — Key Elements
```
Confidentiality, Integrity, Availability (CIA triad)
Security governance   → aligning security strategy with business goals
Compliance            → adhering to internal/external requirements
Legal & regulatory    → laws that impact security posture (GDPR, HIPAA, etc.)
Business continuity   → keeping operations running during/after an incident
```

### Asset Security — Key Elements
```
Data classification   → labeling data by sensitivity (public, internal, confidential, restricted)
Data ownership         → assigning accountability for specific data
Data retention          → how long data is kept before secure disposal
Provisioning/deprovisioning → granting and revoking access as roles change
```

### Why It Matters for Cybersecurity
- Risk management decisions (what to protect, how much to spend) are made before any technical control is chosen.
- Poor asset classification is a leading cause of both over-spending on low-value data and under-protecting high-value data.

### Key Takeaway
> You can't protect what you haven't classified.
> Risk management tells you what matters; asset security tells you how to treat it once you know.

---

## 9. Security Domain Deep Dive — Architecture, Network Security, and IAM

### Security Architecture and Engineering
```
Secure by design    → building security into systems from the start, not bolting it on later
Defense in depth    → layered controls so no single failure exposes the whole system
Least privilege      → users/systems get only the access strictly necessary
```

### Communication and Network Security
```
Segmentation    → dividing networks to limit blast radius
Encryption       → protecting data in transit
Secure protocols → preferring HTTPS/SSH/TLS over unencrypted equivalents
```

### Identity and Access Management (IAM)
| Concept | Meaning |
|---|---|
| Authentication | Verifying identity (something you know/have/are) |
| Authorization | Granting permission to specific resources |
| Provisioning | Creating and assigning user access |
| Single Sign-On (SSO) | One login grants access to multiple systems |

### Why It Matters for Cybersecurity
- These three domains are where most day-to-day technical controls (firewalls, encryption, access reviews) actually live.
- IAM failures — over-provisioned accounts, orphaned accounts from ex-employees — are among the most common real-world breach causes.

### Key Takeaway
> Architecture decides how a system is built to resist attack; network security decides how data moves safely; IAM decides who's allowed to touch any of it.
> Weakness in any one of the three undermines the other two.

---

## 10. Security Domain Deep Dive — Testing, Operations, and Secure Development

### Security Assessment and Testing
```
Vulnerability scanning  → automated detection of known weaknesses
Penetration testing      → simulated attacks to find exploitable gaps
Security audits           → formal review against a framework/standard
```

### Security Operations
```
Incident detection    → identifying that something has gone wrong
Incident response      → containing, eradicating, and recovering from an incident
Forensics investigation → determining root cause and scope after the fact
Disaster recovery       → restoring systems/data after a major disruption
```

### Software Development Security
```
SDLC (Software Development Lifecycle) → Plan → Design → Develop → Test → Deploy → Maintain
Secure coding practices    → input validation, avoiding hard-coded secrets, code review
DevSecOps                   → integrating security checks throughout the pipeline, not just at the end
```

### Why It Matters for Cybersecurity
- Testing and operations are where theoretical security controls get proven — or exposed — in practice.
- Vulnerabilities baked into software during development are dramatically more expensive to fix after release; this is why "shift left" security is a major industry trend.

### Key Takeaway
> Assessment finds the gaps, operations responds when gaps get exploited, and secure development tries to make sure fewer gaps exist in the first place.
> Together, these three domains close the loop from "build it" to "defend it" to "fix it."

---

## 11. Common Tools of the Trade

### Categories of Tools
| Category | Purpose | Examples |
|---|---|---|
| SIEM (Security Information and Event Management) | Real-time log collection, correlation, and alerting | Splunk, Chronicle, QRadar |
| Network Protocol Analyzers | Capturing and inspecting network traffic | Wireshark, tcpdump |
| IDS/IPS | Detecting/blocking malicious traffic | Snort, Suricata |
| Playbooks | Step-by-step response guides for specific incident types | Organization-specific documentation |
| Vulnerability Scanners | Identifying known weaknesses in systems | Nessus, OpenVAS |
| Programming/Scripting | Automating repetitive security tasks | Python, Bash, SQL |

### Playbooks — Why They Matter
A **playbook** is a manual that provides details about any operational action, such as how to respond to a specific type of security incident (e.g., malware infection, phishing report). Playbooks ensure consistent, repeatable responses instead of improvised ones.

### Why It Matters for Cybersecurity
- Tool familiarity is often screened for directly in job postings — SIEM and packet-analysis experience are near-universal requirements even for entry-level roles.
- Playbooks are what keep incident response consistent across shifts, teams, and skill levels — critical during high-pressure incidents.

### Key Takeaway
> Tools don't make you a security analyst — but not knowing them will keep you from becoming one.
> Learn what each category of tool is *for* first; the specific product names will come naturally with practice.

---

## 12. Transferable Skills for a Career in Security

### Core Transferable Skills
```
Communication      → explaining technical risk to non-technical stakeholders
Collaboration        → working across IT, legal, HR, and leadership during incidents
Analysis              → spotting patterns and anomalies in data/logs
Problem-solving       → root-causing issues under time pressure
Diverse perspectives  → security teams benefit from varied backgrounds and thinking styles
Attention to detail   → small misconfigurations often cause the biggest breaches
```

### Foundational Security Skills
```
Understanding of common tools (SIEM, IDS/IPS, packet analyzers)
Programming basics (Python, SQL)
Networking fundamentals
Understanding of frameworks and controls
```

### Why It Matters for Cybersecurity
- Employers consistently report that soft skills, not just technical depth, determine hiring decisions for entry-level analyst roles.
- People coming from non-technical backgrounds (customer service, retail, military, education) often already have strong transferable skills — this course is designed to layer technical knowledge on top of them.

### Key Takeaway
> Nobody starts this field knowing every tool and protocol.
> What gets you hired — and keeps you employed — is the combination of technical curiosity and the human skills to communicate what you find.

---

## Quick Reference — Course 1 Cheat Sheet

### CIA Triad
```
Confidentiality | Integrity | Availability
```

### Threat vs Risk vs Vulnerability
```
Vulnerability (weakness) + Threat (actor/event) = Risk (potential impact)
```

### The 8 CISSP Domains
```
1. Security & Risk Management       5. Identity & Access Management
2. Asset Security                   6. Security Assessment & Testing
3. Security Architecture & Eng.     7. Security Operations
4. Communication & Network Security 8. Software Development Security
```

### NIST RMF — 7 Steps
```
Prepare → Categorize → Select → Implement → Assess → Authorize → Monitor
```

### Common Frameworks
```
NIST CSF | NIST RMF | NIST SP 800-53 | CIS Controls | OWASP Top 10
```

### Tool Categories
```
SIEM | Packet Analyzers | IDS/IPS | Vulnerability Scanners | Playbooks
```

---

# Course 2 — Play It Safe: Manage Security Risks Notes

---

## 1. Security Posture and Business Impact

### What Is Security Posture?
An organization's ability to react to change and manage its defense of critical assets and data.

### Internal vs External Threats to Posture
```
Internal → misconfigurations, weak processes, untrained employees
External → attackers, malware, third-party/supply-chain risk
```

### Impacts of a Poor Security Posture
| Impact | Example |
|---|---|
| Financial | Fines, ransom, lost business |
| Reputational | Loss of customer trust, negative press |
| Identity theft | Exposed employee/customer PII |
| Legal | Regulatory penalties, lawsuits |

### Why It Matters for Cybersecurity
- "Security posture" is the term you'll hear leadership use to ask "how exposed are we right now?" — analysts are the ones who answer it with data.
- A single weak posture indicator (unpatched systems, no MFA) is often the root cause traced back during an incident post-mortem.

### Key Takeaway
> Security posture is the health check of an entire organization's defenses.
> Every control you learn about in this course exists to move that needle from weak to strong.

---

## 2. Security Domains Recap — Applied to Risk

### The 8 CISSP Domains (Quick Recap)
```
1. Security & Risk Management       5. Identity & Access Management
2. Asset Security                   6. Security Assessment & Testing
3. Security Architecture & Eng.     7. Security Operations
4. Communication & Network Security 8. Software Development Security
```

### Security and Risk Management — Focus Areas
```
Define security goals and objectives
Mitigate risk
Maintain business continuity
Follow legal, regulatory, and industry compliance requirements
```

### Applying Domains to Scenarios
```
"Analyst ensures employees only view data needed for their jobs"
 → Identity and Access Management + Security & Risk Management

"Team performs a secure code review before release"
 → Software Development Security
```

### Why It Matters for Cybersecurity
- Real exam and interview questions frequently present a scenario and ask "which domain does this belong to?" — practicing the mapping now builds that instinct.
- Domains give risk conversations a shared vocabulary between analysts, managers, and auditors.

### Key Takeaway
> Every security task you'll ever do lives inside one (or more) of the eight domains.
> Learning to classify a scenario by domain is a skill in itself — it's how professionals organize chaos into a plan.

---

## 3. Introduction to Risk, Threats, and Vulnerabilities

### Core Definitions (Recap + Expansion)
```
Risk           → anything that can impact the confidentiality, integrity, or availability of an asset
Threat         → any circumstance or event that can negatively impact assets
Vulnerability  → a weakness that can be exploited by a threat
```

### Asset Risk Levels
| Risk Level | Example Assets | Potential Damage |
|---|---|---|
| Low | Publicly available marketing material | Minimal |
| Medium | Internal memos, non-sensitive employee data | Some reputational damage |
| High | SPII, PII, intellectual property | Severe financial/legal/reputational damage |

### Types of Consequences from a Breach
```
Reputational damage  → negative press, loss of public trust
Identity theft        → stolen PII used for fraud
Financial loss         → fines, remediation costs, lost revenue
Loss of intellectual property → competitive disadvantage
```

### Why It Matters for Cybersecurity
- Not all assets deserve equal protection — risk-based prioritization is how real security budgets get allocated.
- Distinguishing risk *level* from risk *type* helps you write accurate incident reports and justify remediation priority.

### Key Takeaway
> Risk isn't binary — it's a spectrum tied directly to what asset is involved and what could go wrong.
> The higher the sensitivity of the data, the higher the stakes of getting its protection wrong.

---

## 4. The NIST Risk Management Framework (RMF)

### The 7 Steps of NIST RMF
```
1. Prepare    → activities to manage security/privacy risk before a breach occurs
2. Categorize → define the system and the information it handles based on impact analysis
3. Select     → choose baseline security controls
4. Implement  → deploy the selected controls
5. Assess     → determine if controls are implemented correctly and working as intended
6. Authorize  → a senior official accepts responsibility (accountability) for the risk, may include reports/plans of action
7. Monitor    → continuously track control effectiveness over time
```

### Step Focus Callouts
```
"Being accountable for potential risks, generating reports/plans of action" → Authorize step
"Defining a system's risk category based on potential impact" → Categorize step
```

### Why NIST RMF Matters
Provides a comprehensive, flexible, repeatable, and measurable 7-step process to manage risk. Widely used across US federal systems and adopted broadly in private industry.

### Why It Matters for Cybersecurity
- RMF is one of the most frequently referenced frameworks in real job postings and certifications (Security+, CISSP).
- Knowing the step names cold lets you instantly place a real-world action ("we just got sign-off from the CISO") into the correct stage of the process.

### Key Takeaway
> RMF turns "manage risk" from a vague goal into seven concrete, ordered actions.
> Memorize the steps in order — Prepare, Categorize, Select, Implement, Assess, Authorize, Monitor — you'll use this sequence constantly.

---

## 5. Security Frameworks and Controls (Deep Dive)

### Purpose of Frameworks (Recap)
```
Protect PII
Secure financial information
Identify security weaknesses
Manage organizational risks
Align security with business goals
```

### CIA Triad as the Foundation of Controls
| Principle | Control Example |
|---|---|
| Confidentiality | Encryption, access controls |
| Integrity | Hashing, checksums, version control |
| Availability | Redundancy, backups, load balancing |

### OWASP Security Principles
```
Minimize attack surface area   → reduce the number of possible entry points
Principle of least privilege    → grant only the access necessary
Defense in depth                 → layer multiple controls
Fail securely                    → errors should default to a secure state, not an open one
Don't trust services              → validate data/input from third parties
Separation of duties               → no single person controls an entire critical process
Avoid security by obscurity          → don't rely on secrecy of design as the only protection
Keep security simple                  → complexity increases the chance of flaws
Fix security issues correctly          → address root cause, not just the symptom
```

### Why It Matters for Cybersecurity
- OWASP's principles are foundational to secure software design and frequently referenced in application security roles.
- Frameworks + controls is the pairing that turns policy into practice — a framework says *what* to achieve, controls are *how*.

### Key Takeaway
> A framework without controls is just a wish list. Controls without a framework are just random fixes.
> Together, they turn "we should be secure" into a measurable, auditable reality.

---

## 6. Common Threats

### Malware Types
| Type | Behavior |
|---|---|
| Virus | Attaches to files, spreads when the file is executed |
| Worm | Self-replicates and spreads across networks without user action |
| Ransomware | Encrypts data and demands payment for the decryption key |
| Spyware | Secretly monitors and collects user activity/data |
| Trojan | Disguises itself as legitimate software |
| Rootkit | Grants privileged access while hiding its presence |

### Social Engineering Attacks
```
Phishing        → fraudulent emails/messages designed to trick users into revealing info
Spear phishing   → targeted phishing aimed at a specific person/org
Whaling          → phishing targeted at high-profile executives
Smishing          → phishing via SMS/text
Vishing           → phishing via voice call
Pretexting         → inventing a scenario to manipulate a target
Baiting             → offering something enticing to lure a victim
Business Email Compromise (BEC) → impersonating a trusted business contact to solicit money/data
```

### Other Common Attack Types
```
SQL Injection     → malicious SQL inserted into input fields to manipulate a database
Cross-Site Scripting (XSS) → injecting malicious scripts into trusted websites
Password attacks     → brute force, dictionary attacks, credential stuffing
DoS / DDoS             → overwhelming a system with traffic to disrupt availability
```

### Why It Matters for Cybersecurity
- Social engineering remains the #1 initial access vector in real-world breaches — technology alone can't stop a convincing phone call or email.
- Recognizing malware and attack types by behavior (not just name) is what lets analysts correctly triage alerts under time pressure.

### Key Takeaway
> Most attacks aren't exotic — they're variations on a small set of well-known patterns.
> Learn to recognize the pattern, and you'll recognize the attack, even when the specific tool or wording is new.

---

## 7. Vulnerabilities in Systems

### Common Vulnerability Types
```
Unpatched software/systems     → known flaws left unfixed
Misconfigurations                → default credentials, open ports, excessive permissions
Zero-day vulnerabilities            → unknown to the vendor, no patch yet exists
Weak/no encryption                    → data exposed in transit or at rest
Poor input validation                    → allows injection attacks
Excessive user privileges                  → violates least privilege
```

### The CVE System
```
CVE (Common Vulnerabilities and Exposures) → publicly disclosed catalog of known vulnerabilities
Each entry includes a unique ID, description, and references
```

### Why It Matters for Cybersecurity
- Most real-world breaches exploit *known*, unpatched vulnerabilities — not sophisticated zero-days. Patch management is one of the highest-leverage security activities.
- Understanding CVEs lets analysts quickly research whether a detected exploit attempt matches a known, documented flaw.

### Key Takeaway
> A vulnerability is a door left unlocked. It doesn't matter how sophisticated your alarm system is if the door was never closed in the first place.
> Patch early, patch often — it's unglamorous, but it closes more doors than almost anything else.

---

## 8. Introduction to SIEM Tools

### What Is SIEM?
Security Information and Event Management — a tool that collects and analyzes log data from across an organization's technology infrastructure.

### SIEM Functions
```
Data collection     → aggregates logs from servers, endpoints, network devices
Correlation           → links related events across sources
Alerting               → notifies analysts of suspicious activity
Dashboards              → visualize security data for faster analysis
```

### SIEM + Playbooks Relationship
```
SIEM detects and alerts → Playbook provides the proven, step-by-step response strategy
```

### Common SIEM Tools
```
Splunk | Chronicle (Google) | IBM QRadar | Microsoft Sentinel
```

### Why It Matters for Cybersecurity
- SIEM experience is one of the single most requested skills in entry-level SOC analyst job postings.
- Correlating data across multiple log sources (not just one system) is what separates real detection from noise.

### Key Takeaway
> A SIEM tool doesn't replace an analyst's judgment — it feeds that judgment the data it needs, fast enough to matter.
> Learning to read SIEM alerts critically (not just react to them) is a core SOC skill.

---

## 9. Introduction to Playbooks

### What Is a Playbook?
A manual that provides details about any operational action — clarifies what tools to use and ensures a consistent, repeatable list of actions to address security incidents.

### Types of Playbooks
```
Incident response playbook   → guides response to a security incident
Alert-specific playbook       → guides handling of a particular alert type (e.g., phishing report)
Product-specific playbook      → guides use of a specific security tool
```

### Playbooks Are Living Documents
Security teams update playbooks frequently to address new threats, tools, and lessons learned from past incidents.

### Why It Matters for Cybersecurity
- Playbooks remove guesswork during high-pressure incidents — consistency matters more than individual heroics.
- New analysts rely heavily on playbooks before they've built enough experience to improvise safely.

### Key Takeaway
> A playbook is the difference between "we think this is how we should respond" and "this is exactly how we respond, every time."
> Consistency under pressure is a feature, not a limitation.

---

## 10. Incident Response Playbooks — The Six Phases

### The Six Phases
```
1. Preparation              → policies, tools, and training established before an incident
2. Detection and Analysis    → determine whether a breach occurred and assess its magnitude
3. Containment                → prevent further damage, reduce immediate impact
4. Eradication and Recovery    → remove the incident's artifacts, restore systems to a secure state
5. Post-Incident Activity        → document the incident to improve future readiness
6. Coordination                    → communicate and share information throughout the entire process (spans all phases)
```

### Phase Focus Examples
```
"Determining whether a breach occurred and its potential magnitude" → Detection and Analysis
"Removing artifacts and restoring the environment" → Eradication and Recovery
"Documenting to prepare for future incidents" → Post-Incident Activity
```

### Coordination Is Continuous
Communication and coordination with stakeholders is relevant throughout the *entire* incident, not a single standalone phase.

### Why It Matters for Cybersecurity
- These six phases mirror the same structured thinking used in the NIST RMF and general troubleshooting methodology — structure beats improvisation under pressure.
- Skipping the post-incident documentation phase is one of the most common real-world failures, leaving organizations unprepared for the next, similar incident.

### Key Takeaway
> Incident response isn't a single action — it's a lifecycle.
> Prepare before it happens, detect and contain when it does, recover fully, and document so the *next* incident is handled even better.

---

## 11. Introduction to Security Audits

### What Is a Security Audit?
A review of an organization's security controls, policies, and procedures against a set of expectations, such as industry standards, regulations, and internal policies.

### Purpose of a Security Audit
```
Determine whether existing controls effectively protect assets
Identify gaps between current state and required/desired state
Support compliance with legal, regulatory, and industry requirements
Provide a report to leadership on organizational risk posture
```

### Common Elements of a Security Audit
| Element | Description |
|---|---|
| Establishing scope and goals | Defining what systems/policies are being audited |
| Conducting a risk assessment | Identifying and analyzing potential risks |
| Reviewing organization compliance requirements | Checking against relevant standards (HIPAA, PCI-DSS, GDPR) |
| Assessing security training programs | Evaluating whether employees are prepared to identify threats |

### Why It Matters for Cybersecurity
- Audits are how organizations prove compliance to regulators and customers — a failed audit can mean lost contracts or legal penalties.
- Conducting a security audit is a concrete, practical skill directly tested in this course's hands-on activities and commonly required in real analyst roles.

### Key Takeaway
> An audit isn't about catching people doing something wrong — it's about honestly measuring the gap between where your security *is* and where it *needs to be*.
> The value of an audit lives entirely in what you do with its findings.

---

## Quick Reference — Course 2 Cheat Sheet

### Core Definitions
```
Risk           → potential impact to CIA of an asset
Threat         → circumstance/event that could cause that impact
Vulnerability  → the weakness a threat exploits
```

### NIST RMF — 7 Steps
```
Prepare → Categorize → Select → Implement → Assess → Authorize → Monitor
```

### OWASP Security Principles
```
Minimize attack surface | Least privilege | Defense in depth | Fail securely
Don't trust services | Separation of duties | Avoid security by obscurity
Keep security simple | Fix issues correctly
```

### Incident Response — 6 Phases
```
Preparation → Detection & Analysis → Containment → Eradication & Recovery
→ Post-Incident Activity           (Coordination spans all phases)
```

### Common Threat Categories
```
Malware | Social Engineering | SQL Injection | XSS | Password Attacks | DoS/DDoS
```

### Tools Introduced
```
SIEM (Splunk, Chronicle, QRadar) | Playbooks | Security Audits
```

---

> **Overall Key Takeaway for Course 2:**
> Course 1 taught you *what* cybersecurity protects and *why*. Course 2 teaches you *how* organizations actually manage that protection at scale —
> through frameworks like NIST RMF, structured incident response phases, SIEM-driven detection, and honest security audits.
> Threats and vulnerabilities aren't abstract anymore here — they're the specific, recognizable patterns (phishing, malware, misconfigurations) you'll be trained to catch.
> Everything in this course is the operational bridge between security *theory* and the daily work of a SOC analyst.

---

# Course 3 — Connect and Protect: Networks and Network Security Notes

---

## 1. What Is a Network?

### Definition
A network is a group of connected devices that exchange data and share resources with each other.

### Why Organizations Rely on Networks
```
Sharing files and resources across teams
Centralizing data storage and access control
Enabling communication (email, VoIP, messaging)
Connecting to the internet and cloud services
```

### Network Types by Scope
| Type | Full Name | Scope |
|---|---|---|
| PAN | Personal Area Network | A single person's devices (phone, laptop, wearables) |
| LAN | Local Area Network | An office building, school, or home |
| WAN | Wide Area Network | Spans large geographic distances, connects multiple LANs |
| WLAN | Wireless Local Area Network | LAN connected via Wi-Fi instead of cables |

### Why It Matters for Cybersecurity
- Networks are the single most common target of cyberattacks because they carry and store an organization's most valuable data.
- Knowing network scope helps analysts scope the blast radius of an incident — a compromised LAN device is a very different problem than a compromised WAN link.

### Key Takeaway
> Every device an organization owns is only useful because it's connected to something else — and every connection is also a potential attack path.
> Networks aren't just infrastructure. They're the terrain security professionals defend.

---

## 2. Network Devices and Their Functions

### Core Devices
| Device | Function |
|---|---|
| Router | Connects multiple networks together and routes traffic between them |
| Switch | Connects devices within a single network, forwards data using MAC addresses |
| Hub | Broadcasts data to all connected devices (legacy, insecure) |
| Modem | Converts data between formats for transmission over ISP lines |
| Access Point | Extends a wired network's reach wirelessly |
| Firewall | Filters incoming/outgoing traffic based on security rules |
| Servers | Provide resources/services (files, applications, authentication) to other devices |

### Physical vs Logical Topology
```
Physical topology → the actual physical layout of cables and devices
Logical topology  → how data actually flows, regardless of physical layout
```

### Why It Matters for Cybersecurity
- Misidentifying a device's role is a common early mistake — knowing that a router connects networks (not just devices) is the difference between correctly scoping a network diagram and misreading one during an incident.
- Legacy devices like hubs broadcast to every connected device, meaning any device on the segment can see all traffic — a serious eavesdropping risk still found in older infrastructure.

### Key Takeaway
> Every device on a network map has a specific job — and a specific way it can fail or be abused.
> Learn what each device *does*, and you'll immediately understand what happens when it's misconfigured or compromised.

---

## 3. The TCP/IP Model

### The Four Layers
| Layer | Function | Example Protocols |
|---|---|---|
| Network Access (Link) | Physical transmission and addressing on the local network | Ethernet, Wi-Fi (802.11) |
| Internet | Logical addressing and routing between networks | IP, ICMP |
| Transport | End-to-end communication, reliability | TCP, UDP |
| Application | User-facing protocols and services | HTTP, HTTPS, DNS, FTP |

### TCP/IP vs OSI
```
TCP/IP condenses OSI's 7 layers into 4:
OSI: Application/Presentation/Session → TCP/IP: Application
OSI: Transport                        → TCP/IP: Transport
OSI: Network                          → TCP/IP: Internet
OSI: Data Link/Physical               → TCP/IP: Network Access
```

### Encapsulation
As data moves down the layers for transmission, each layer adds its own header information — this process is called **encapsulation**. The reverse happens on the receiving end (**de-encapsulation**).

### Why It Matters for Cybersecurity
- TCP/IP is the practical model actually implemented on the internet — while OSI is the conceptual teaching model, TCP/IP is what Wireshark captures and what real packets follow.
- Understanding encapsulation helps analysts read packet captures layer by layer instead of treating them as an opaque blob of data.

### Key Takeaway
> OSI teaches you to think in layers; TCP/IP is the layer model actually running on every network you'll ever work with.
> Learn both — but when you're staring at a real packet capture, you're reading TCP/IP.

---

## 4. Network Protocols

### What Are Protocols?
Rules used by two or more devices on a network to describe the order and structure of data — protocols ensure devices "speak the same language."

### Common Protocols by Function
| Protocol | Purpose |
|---|---|
| TCP | Connection-oriented, reliable, ordered delivery |
| UDP | Connectionless, fast, no delivery guarantee |
| IP | Logical addressing and routing |
| HTTP/HTTPS | Web communication (HTTPS = encrypted) |
| FTP/SFTP | File transfer (SFTP = encrypted) |
| DNS | Translates domain names to IP addresses |
| DHCP | Automatically assigns IP addresses to devices |
| SMTP/POP3/IMAP | Sending and receiving email |
| SSH | Secure encrypted remote shell access |
| Telnet | Unencrypted remote access (legacy, insecure) |

### Security-Relevant Protocol Facts
```
HTTPS uses TLS/SSL to encrypt data between client and server — provides a secure method of communication
Telnet and FTP transmit data (including credentials) in plaintext — high risk if used on untrusted networks
```

### Why It Matters for Cybersecurity
- Recognizing which protocols are encrypted vs. plaintext is a fast way to spot risky configurations during an audit or packet capture review.
- Protocol misuse (e.g., Telnet still enabled on a production device) is a classic, easily-missed finding in real security assessments.

### Key Takeaway
> Protocols are the agreed-upon grammar of network communication.
> Knowing which ones encrypt and which ones don't tells you, at a glance, where your organization's data is actually exposed in transit.

---

## 5. IP Addressing and Data Transmission

### IP Addresses
```
IPv4 → 32-bit address, dotted decimal (e.g., 192.168.1.1)
IPv6 → 128-bit address, hexadecimal, colon-separated
```

### Public vs Private IP Addresses
```
Public IP  → routable on the internet, unique globally
Private IP → used within a local network, not routable on the internet
             (e.g., 10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16)
```

### NAT (Network Address Translation)
Translates private IP addresses to a public IP address so multiple internal devices can share one public-facing address — also obscures internal network structure from external scans.

### How Data Moves Across a Network
```
1. Data is broken into packets
2. Each packet is encapsulated with headers (IP, TCP/UDP)
3. Packets are routed across networks toward the destination
4. The receiving device reassembles packets into the original data
```

### Why It Matters for Cybersecurity
- Recognizing private vs. public IP ranges instantly tells you whether traffic should ever be visible outside the organization's network.
- NAT's obscuring effect is a mild security benefit, but it is not a substitute for a properly configured firewall.

### Key Takeaway
> An IP address is more than a label — its range tells you where a device sits in the trust boundary of a network.
> A private IP address showing up on the public internet is one of the fastest signals something is misconfigured.

---

## 6. Network Communication and Data Transmission Tools

### Key Concepts
```
Bandwidth   → maximum data transfer capacity of a network connection
Latency      → delay between sending and receiving data
Throughput    → actual achieved data transfer rate (often lower than bandwidth)
Packet loss    → data that fails to reach its destination
```

### Common Diagnostic Tools
```bash
ping             # tests reachability using ICMP
traceroute       # maps the path packets take to a destination
netstat          # shows active connections and listening ports
nslookup / dig    # queries DNS records
ipconfig / ifconfig # shows local network configuration
```

### Packet Sniffers
Tools (e.g., Wireshark, tcpdump) that capture and inspect network traffic — used legitimately for troubleshooting and security monitoring, but also abused by attackers to intercept unencrypted data.

### Why It Matters for Cybersecurity
- These are the exact tools used daily in real SOC work to confirm whether a reported network issue is a performance problem or an active attack.
- Understanding packet sniffing from both the defensive and offensive angle helps analysts recognize when sniffing tools might be used maliciously on their own network.

### Key Takeaway
> The tools that diagnose a slow network are the same tools that detect an active attacker.
> Get comfortable with them early — they're the stethoscope of network security work.

---

## 7. Firewalls and Network Security Devices

### Firewall Types
| Type | Behavior |
|---|---|
| Stateless | Filters based on static rules only, does not track connection state |
| Stateful | Tracks the state of active connections and filters accordingly, proactively filtering out threats |
| Next-Generation (NGFW) | Adds application awareness, intrusion prevention, deep packet inspection |

### Firewall Rule Structure
```
Rules are processed top-down — first match wins
Implicit "deny all" typically exists at the end of the rule list
```

### Other Network Security Devices
```
IDS (Intrusion Detection System) → detects and alerts on suspicious activity
IPS (Intrusion Prevention System) → detects and actively blocks suspicious activity
Proxy server                        → forwards requests on behalf of clients, can filter/cache
VPN concentrator                     → manages and terminates multiple VPN tunnels
```

### Why It Matters for Cybersecurity
- Misordered or overly broad firewall rules are one of the most common real-world network misconfigurations found during audits.
- Knowing the difference between IDS (detect only) and IPS (detect and block) directly affects incident response — an IDS alert requires manual action, an IPS may have already acted.

### Key Takeaway
> A firewall is only as good as the rules written for it, in the order they're written.
> Stateful awareness and correct rule ordering are what separate a real security control from a false sense of one.

---

## 8. Virtual Private Networks (VPNs)

### What Is a VPN?
An encrypted tunnel between a device and a network, used to protect data in transit and mask the user's actual network location/traffic.

### VPN Types
```
Site-to-Site VPN   → connects two entire networks (e.g., office to office)
Client-to-Site VPN → connects an individual remote user to a network
Split Tunnel VPN     → only specified traffic routes through the VPN
Full Tunnel VPN        → all traffic routes through the VPN
```

### VPN Protocols
| Protocol | Notes |
|---|---|
| IPsec | Operates at the network layer, strong encryption, commonly used for site-to-site VPNs |
| SSL/TLS VPN | Operates at higher layers, browser-friendly, common for remote user access |

### Why It Matters for Cybersecurity
- VPNs are essential for protecting remote workers on untrusted networks (public Wi-Fi, home networks) — but they are only as secure as their configuration and the endpoint device using them.
- Split tunneling introduces risk: any traffic outside the tunnel bypasses organizational security controls entirely.

### Key Takeaway
> A VPN protects data in transit — it does not protect a compromised endpoint on either side of the tunnel.
> Think of a VPN as a secure hallway, not a secure building; the rooms on either end still need their own locks.

---

## 9. Common Network Attacks — Intrusion Tactics

### Denial of Service Attacks
```
DoS (Denial of Service)   → a single source overwhelms a target with traffic/requests
DDoS (Distributed DoS)     → multiple sources (often a botnet) overwhelm a target simultaneously
Botnet                       → a network of compromised devices controlled remotely by an attacker
```

### On-Path (Man-in-the-Middle) Attacks
An attacker secretly intercepts and potentially alters communication between two parties who believe they're communicating directly with each other.

### Packet Sniffing
Capturing network traffic to intercept unencrypted data (credentials, session tokens) as it moves across the network.

### IP Spoofing
An attacker disguises their IP address to impersonate a trusted source, bypassing IP-based access controls or hiding the true origin of an attack.

### ARP Poisoning / ARP Spoofing
Sending forged ARP replies to associate an attacker's MAC address with a legitimate IP address, redirecting local network traffic through the attacker's device.

### Other Notable Attacks
```
DNS spoofing/poisoning   → corrupting DNS responses to redirect users to malicious sites
Rogue access points        → attacker-controlled Wi-Fi impersonating a legitimate network
Session hijacking            → stealing an active session token to impersonate a logged-in user
```

### Why It Matters for Cybersecurity
- These attack types map directly to real, frequently-tested incident scenarios — recognizing the pattern (e.g., unusual ARP table entries) is often the first clue an analyst has of an active attack.
- Each attack has a specific defensive control (e.g., Dynamic ARP Inspection defends against ARP poisoning, DHCP snooping against rogue DHCP servers) — understanding the attack is what makes the defense make sense.

### Key Takeaway
> Nearly every network intrusion tactic exploits a protocol that was designed for convenience, not security (ARP, DHCP, DNS).
> Understanding *why* these protocols trust blindly is what lets you understand *why* the corresponding defenses exist.

---

## 10. Security Hardening — Overview

### What Is Hardening?
The process of reducing a system's attack surface by removing unnecessary access, features, services, and accounts.

### General Hardening Principles
```
Disable unused services and ports
Remove default/unused accounts
Apply the principle of least privilege
Keep systems patched and updated
Enforce strong authentication (MFA where possible)
```

### Why It Matters for Cybersecurity
- Hardening is one of the highest-leverage, lowest-cost defensive activities available — most breaches exploit something that hardening would have already closed off.
- Hardening isn't a one-time task; it's an ongoing discipline tied directly to change management and patch management processes.

### Key Takeaway
> Hardening is subtraction, not addition — the fewer things a system can do, the fewer things an attacker can abuse.
> Every unnecessary service, port, or account left running is a door you're choosing to leave unlocked.

---

## 11. Network Hardening

### Network Hardening Techniques
```
Segmentation           → dividing a network into isolated zones to limit attacker movement
VLANs                    → logically separating traffic on shared physical switches
Port security             → restricting which MAC addresses can connect to a switch port
Disabling unused ports      → physical and logical ports not in use should be closed
Firewall rule review          → regularly auditing and tightening ACLs
Network Access Control (NAC)   → enforcing device compliance (patched, antivirus) before granting access
```

### Why It Matters for Cybersecurity
- Segmentation directly limits the "blast radius" of a breach — a flat, unsegmented network lets an attacker pivot freely once any single device is compromised.
- NAC stops non-compliant or rogue devices before they ever reach sensitive network segments.

### Key Takeaway
> A hardened network isn't one that can never be breached — it's one where a breach in one corner doesn't become a breach of everything.
> Segmentation and access control are how you contain damage instead of just hoping it never happens.

---

## 12. Cloud Hardening

### Cloud Service Models Recap
| Model | Provider Manages | You Manage |
|---|---|---|
| IaaS | Hardware, virtualization, network | OS, apps, data |
| PaaS | + OS, runtime | Apps, data |
| SaaS | Everything | Usage, data |

### Shared Responsibility Model
```
The cloud provider secures the infrastructure "of" the cloud
The customer secures what they put "in" the cloud (data, configs, access)
```

### Cloud Hardening Techniques
```
Properly configure security groups / cloud firewalls
Avoid publicly exposing storage buckets by default
Use least-privilege IAM roles and policies
Enable logging and monitoring on cloud resources
Encrypt data at rest and in transit
Regularly audit cloud configurations for drift
```

### Why It Matters for Cybersecurity
- Misconfigured cloud storage and overly permissive security groups are consistently among the top real-world causes of cloud data breaches.
- The shared responsibility model means a breach caused by customer misconfiguration is not the cloud provider's fault — understanding exactly where that line sits is essential.

### Key Takeaway
> Moving to the cloud doesn't remove security responsibility — it redistributes it.
> Know exactly where your provider's job ends and yours begins, and audit that boundary regularly.

---

## 13. Operating System (OS) Hardening

### OS Hardening Techniques
```
Remove or disable unnecessary services and applications
Apply OS and software patches promptly
Enforce strong password policies
Configure host-based firewalls
Enable and review OS-level logging (audit logs)
Disable default/guest accounts
Apply the principle of least privilege to user accounts
```

### Baseline Configurations
A "known good" reference configuration used to detect unauthorized changes (drift) on a system over time.

### Why It Matters for Cybersecurity
- OS hardening is the last line of defense at the individual device level — if network and cloud controls fail, a hardened OS can still stop or slow an attacker.
- Baseline configurations make it possible to detect compromise through configuration drift, even before an alert fires.

### Key Takeaway
> Every layer of hardening — network, cloud, OS — assumes the layer above it might fail.
> That's not pessimism, it's defense in depth: hardening at every level means one mistake doesn't become one breach.

---

## Quick Reference — Course 3 Cheat Sheet

### TCP/IP Model (4 Layers)
```
Application | Transport | Internet | Network Access
```

### Network Types
```
PAN (personal) | LAN (building) | WLAN (wireless LAN) | WAN (wide-area)
```

### Firewall Types
```
Stateless | Stateful | Next-Generation (NGFW)
```

### VPN Types
```
Site-to-Site | Client-to-Site | Split Tunnel | Full Tunnel
```

### Common Intrusion Tactics
```
DoS/DDoS | Botnet | On-Path (MITM) | Packet Sniffing | IP Spoofing | ARP Poisoning | DNS Spoofing
```

### Hardening Layers
```
Network Hardening  → segmentation, VLANs, port security, NAC
Cloud Hardening     → IAM least privilege, secure storage configs, encryption
OS Hardening          → patching, disabling unused services, baseline configs
```

---

> **Overall Key Takeaway for Course 3:**
> Course 3 moves you from "what is security?" to "what does an actual network look like, and how do you defend it?"
> The TCP/IP model and protocols give you the vocabulary; devices and firewalls give you the terrain; intrusion tactics show you how attackers actually move through that terrain;
> and hardening — at the network, cloud, and OS level — is how you close the doors before they ever get the chance.
> Everything from here forward (Linux, SQL, threat detection) assumes you can already picture a network and know where it bends.
