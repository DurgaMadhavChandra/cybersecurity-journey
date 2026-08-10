# Week 10 Notes — TryHackMe: SOC Level 1 Path (Cyber Threat Intelligence Module)

---

## 1. Introduction to Cyber Threat Intelligence

### Definition
CTI is the process of collecting, analyzing, and using information about existing or emerging threats to help an organization make informed security decisions, rather than reacting blindly to every alert.

### Key Concepts
```
Threat Intelligence  → evidence-based knowledge about adversaries, their motives, and their methods
Intelligence Cycle      → Direction → Collection → Processing → Analysis → Dissemination → Feedback
Types of Intel             → Strategic (execs, high-level trends) | Tactical (TTPs, for defenders)
                              | Operational (specific campaigns) | Technical (IOCs — hashes, IPs, domains)
IOC vs IOA                    → IOC = evidence an attack already happened (hash, IP) |
                                 IOA = evidence of attacker intent/behavior in progress
```

### Why It Matters for Cybersecurity
- Without CTI, a SOC only ever reacts to what already triggered an alert — CTI is what lets a team anticipate instead.
- Mixing up IOCs and IOAs means chasing static artifacts that change constantly (an IP can rotate) instead of behavior that doesn't.

### Key Takeaway
> Intelligence isn't data — it's data that's been turned into something you can actually act on.
> Raw log lines and IP lists become CTI only after the Intelligence Cycle processes and contextualizes them.

---

## 2. The Pyramid of Pain

### Key Concepts
```
Hash Values        → trivial for an attacker to change, trivial for a defender to block (lowest pain)
IP Addresses          → slightly harder to change, still cheap for the attacker to rotate
Domain Names             → costs the attacker registration + setup time to change
Network/Host Artifacts      → forces the attacker to alter tooling/configuration
Tools                          → forces the attacker to rebuild or replace their toolset entirely
TTPs                              → forces the attacker to change fundamental behavior (highest pain)
```

### Why It Matters for Cybersecurity
- Blocking a hash feels productive but costs an attacker seconds to bypass — detecting TTPs is what actually disrupts a campaign.
- The pyramid is a prioritization tool: it tells a SOC where limited detection-engineering time delivers the most disruption.

### Key Takeaway
> The higher up the pyramid your detection lives, the more pain it causes an attacker to evade it.
> Chasing IOCs alone is playing whack-a-mole; targeting TTPs changes the game.

---

## 3. The Cyber Kill Chain

### The Seven Stages
| # | Stage | What Happens |
|---|---|---|
| 1 | Reconnaissance | Attacker researches the target (OSINT, scanning) |
| 2 | Weaponization | Malicious payload is built/paired with an exploit |
| 3 | Delivery | Payload is transmitted (phishing email, drive-by) |
| 4 | Exploitation | The vulnerability is triggered, code executes |
| 5 | Installation | Malware/backdoor is installed for persistence |
| 6 | Command & Control (C2) | Attacker establishes a channel back to the host |
| 7 | Actions on Objectives | Attacker achieves the actual goal (exfil, ransomware, etc.) |

### Why It Matters for Cybersecurity
- Every stage is a chance to break the chain — defenders don't need to stop everything, just one link.
- It's the shared vocabulary a SOC uses to describe how far an intrusion actually got.

### Key Takeaway
> An attack isn't one event — it's a sequence. The earlier in the chain you detect and disrupt it, the less damage is already done.

---

## 4. The Unified Kill Chain

### Key Concepts
```
Why It Exists     → Lockheed Martin's Kill Chain is linear and external-focused;
                     real intrusions loop, pivot, and move laterally inside a network
18 Phases            → groups into 3 objectives: Initial Foothold → Network Propagation → Action on Objectives
Iterative Nature        → attackers repeat recon/exploitation/persistence steps internally,
                            not just once at the perimeter
```

### Why It Matters for Cybersecurity
- The original Kill Chain undersells post-compromise activity (lateral movement, privilege escalation) — the Unified model fixes that blind spot.
- More phases = more places a SOC can plant detections, especially for the "assume breach" mindset modern defense relies on.

### Key Takeaway
> The Cyber Kill Chain tells you how an attacker gets in. The Unified Kill Chain tells you what they do once they're already inside — and that's usually where the real damage happens.

---

## 5. Diamond Model of Intrusion Analysis

### Key Concepts
```
Four Core Features  → Adversary (who) | Infrastructure (what they used to connect)
                       | Capability (tools/malware/technique) | Victim (target)
Meta-Features           → Timestamp, Phase, Result, Direction, Methodology, Resources
Pivoting                   → moving between the four vertices to uncover more of the same campaign
                              (e.g. found one malicious IP → pivot to find related infrastructure)
```

### Why It Matters for Cybersecurity
- The Diamond Model forces an analyst to ask "who, what, how, and against whom" for every single event — not just log a raw indicator.
- Pivoting across the diamond is literally how analysts uncover an entire attacker campaign from one initial artifact.

### Key Takeaway
> Any single intrusion event can be mapped onto these four vertices — and once mapped, pivoting from one vertex often reveals the rest of the attacker's infrastructure.

---

## 6. MITRE ATT&CK Framework

### Key Concepts
```
Matrix         → knowledge base of real-world adversary Tactics, Techniques, and Procedures (TTPs)
Tactics           → the "why" — the attacker's goal at a given stage (e.g. Persistence, Exfiltration)
Techniques           → the "how" — the specific method used to achieve that tactic
Sub-Techniques          → more granular breakdown of a technique
Navigator                  → tool to visualize/track which techniques a threat actor or defense covers
```

### Why It Matters for Cybersecurity
- ATT&CK is the industry-standard shared language — a detection engineer, a red teamer, and a CTI analyst can all reference "T1059" and mean the exact same thing.
- Mapping detections against the ATT&CK matrix instantly shows a SOC's coverage gaps.

### Key Takeaway
> ATT&CK turns "the attacker did something sneaky" into a precise, searchable technique ID — that precision is what makes threat intel actually shareable and actionable.

---

## 7. CTI Tools — MISP

### Key Concepts
```
MISP  → open-source Threat Intelligence Platform (TIP) for storing, correlating, and sharing IOCs
Events   → the core object in MISP — a bundle of related indicators/attributes tied to one incident/campaign
Attributes  → individual IOCs within an event (IP, hash, domain, etc.)
Sharing Groups → control which organizations/communities an event is shared with
```

### Practical Application
```
Create an Event → add Attributes (IOCs) → tag with TLP (Traffic Light Protocol) → publish/share
Correlate: MISP automatically flags when a new IOC matches something already in the platform
```

### Why It Matters for Cybersecurity
- MISP is how CTI actually becomes collaborative — one org's IOC becomes every connected org's detection rule.
- TLP tagging is what keeps sensitive intel from leaking to the wrong audience while still enabling sharing.

### Key Takeaway
> Threat intel that stays in one analyst's head is nearly worthless. MISP's whole purpose is turning individual findings into shared, structured, actionable community defense.

---

## 8. CTI Tools — OpenCTI

### Key Concepts
```
OpenCTI  → open-source platform for structuring, visualizing, and linking threat intel data
STIX2       → the data standard OpenCTI is built around (Structured Threat Information eXpression)
Knowledge Graph → visually links entities — threat actors, malware, campaigns, IOCs — to show relationships
```

### Why It Matters for Cybersecurity
- OpenCTI's graph view is what turns a wall of disconnected IOCs into "this actor, this malware, this campaign" — visible relationships instead of a flat list.
- STIX2 standardization is what lets OpenCTI, MISP, and other platforms interoperate instead of each speaking their own format.

### Key Takeaway
> Raw IOCs answer "what." A knowledge graph like OpenCTI's answers "who, and how is this connected to everything else we've seen" — that's the difference between data and intelligence.

---

## 9. YARA Rules

### Key Concepts
```
YARA        → pattern-matching tool ("the pattern matching swiss army knife") for identifying malware families
Rule Structure → meta (info) + strings (patterns to match) + condition (logic combining the strings)
Use Cases         → static malware classification, threat hunting across a filesystem, triage at scale
```

### Practical Application
```
rule Example_Rule
{
    meta:
        description = "Detects a suspicious string pattern"
    strings:
        $a = "malicious_string_example"
    condition:
        $a
}
```

### Why It Matters for Cybersecurity
- YARA rules are how a single IOC discovery scales into "scan every endpoint for this same signature" instantly.
- It's a core tool bridging CTI (writing the rule from known malware behavior) and DFIR (running the rule during an investigation).

### Key Takeaway
> A YARA rule is threat intelligence made executable — instead of describing what malware looks like, you're writing something a machine can go hunt for directly.

---

## 10. Applied CTI — Practical Rooms (Trooper, Summit, Eviction, Friday Overtime)

### Key Concepts
```
Scenario-Based Practice  → each room simulates a real incident requiring CTI research + tool usage
                            end-to-end, not just theory recall
Skills Combined              → OSINT pivoting, MISP/OpenCTI lookups, MITRE mapping, and
                                report-style conclusions, all in one exercise
```

### Why It Matters for Cybersecurity
- These rooms are where the individual concepts (Pyramid of Pain, Kill Chain, MITRE, tools) stop being separate facts and start being one connected workflow.
- Real SOC/CTI work is rarely "answer one question" — it's exactly this kind of multi-step investigation under a scenario.

### Key Takeaway
> Theory rooms teach the vocabulary. Practical rooms are where you find out if you can actually use it under a realistic, messy scenario — that gap is worth practicing deliberately.

---

## Quick Reference — Week 10 Cheat Sheet

### SOC Level 1 Path — CTI Module
```
Room 1: Intro & Analyst Role | Room 2: Pyramid of Pain | Room 3: Cyber Kill Chain
Room 4: Unified Kill Chain | Diamond Model | MITRE ATT&CK
Intro to CTI | Threat Intelligence Tools (MISP, OpenCTI) | YARA
Practical: Trooper | Summit | Eviction | Friday Overtime
```

### Core Concepts Introduced This Week
```
Intelligence Cycle | IOC vs IOA | Pyramid of Pain | Cyber Kill Chain | Unified Kill Chain
Diamond Model | MITRE ATT&CK (Tactics/Techniques) | MISP | OpenCTI | STIX2 | YARA Rules
```

---

> Overall Key Takeaway — Week 10:
> This week moved from detecting threats (Week 09's tooling) to understanding them before they even hit a detection.
> The Pyramid of Pain, Kill Chain models, and Diamond Model are all different lenses for the same question: how far did the attacker get, and what will actually cost them to change?
> MISP, OpenCTI, and YARA are how that understanding gets operationalized — shared, correlated, and turned into something a SOC can actually hunt with.
