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
