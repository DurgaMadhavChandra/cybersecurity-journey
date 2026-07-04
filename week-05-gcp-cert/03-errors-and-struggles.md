# Week 05 — Errors & Struggles

This week was Courses 1, 2, and 3 of the Google Cybersecurity Certificate —
CIA Triad, security domains, NIST CSF and RMF, frameworks and controls,
playbooks, network architecture, and hardening. Compared to last week's
hands-on packet chasing, this week felt safer on the surface. It was
reading, definitions, diagrams — the kind of material that feels solid
right up until you're actually asked to use it. Documenting all of it
below, exactly as it happened.

---

## Struggle 1: I Mixed Up Risk, Threat, and Vulnerability — Out Loud, in a Practice Scenario

### The Problem

Working through Course 2's risk section, I hit a practice question
describing an unpatched server exposed to the internet. I labeled the
unpatched server itself as "the risk." It felt right — it was the thing
that was wrong, after all.

### My Debugging Process

I went back to the definitions instead of trusting my gut. A
**vulnerability** is the weakness — the unpatched server. A **threat** is
whatever could exploit that weakness — an attacker scanning for exposed
services. **Risk** isn't either of those on its own; it's the potential
impact if the two ever meet. I'd been treating "risk" as a synonym for
"the bad thing sitting there," when it's actually the *outcome* of a
weakness and a threat colliding.

### The Fix

I rewrote the definitions side by side instead of leaving them stacked
in separate bullet points, since seeing them stacked was exactly what let
me blur them together:

```
Vulnerability → the unpatched server (the weakness)
Threat        → an attacker scanning for exposed services (the actor/event)
Risk          → potential damage if the attacker finds and exploits it (the outcome)
```

**My Observation:**
All three terms describe the same scenario from a different angle, which
is exactly why they're so easy to collapse into one word under pressure.
Getting this wrong isn't just a vocabulary slip — mislabeling risk as a
vulnerability (or vice versa) changes what you'd actually prioritize
fixing first.

---

## Struggle 2: I Recited the NIST RMF Steps Out of Order and Didn't Notice

### The Problem

I was drilling the seven NIST RMF steps from memory —
Prepare, Categorize, Select, Implement, Assess, Authorize, Monitor — and
in a practice quiz I confidently answered that "Authorize" comes right
after "Select." I was certain, right up until I got the question wrong.

### My Debugging Process

I'd memorized the steps as a loose group of seven words, not as a
strict sequence where each step depends on the one before it. Select
picks the controls; Implement actually deploys them; only after
deployment does Assess check whether they work — and only after that
does Authorize make sense, since you can't formally accept risk for a
control that hasn't even been verified yet.

### The Fix

I stopped memorizing the steps as a word list and rewrote them as a
dependency chain instead:

```
Prepare → Categorize → Select → Implement → Assess → Authorize → Monitor
(each step needs the output of the one before it — none of them are interchangeable)
```

**My Observation:**
A seven-item list feels like something you can shuffle in your head
without consequence. This framework isn't a checklist you can complete in
any order — it's a pipeline, and skipping ahead mentally is exactly how
I got the quiz question wrong.

---

## Struggle 3: I Flagged the Wrong Part of the CIA Triad on a DDoS Scenario

### The Problem

A Course 2 scenario described a DDoS attack taking a company's website
offline. Without thinking too hard, I flagged it as a confidentiality
issue — my brain jumped straight to "attack = data exposure."

### My Debugging Process

I reread the scenario slowly instead of pattern-matching "attack" to
"confidentiality" automatically. Nothing in a DDoS scenario touches data
being viewed or stolen — the entire point of the attack is to overwhelm
a system so legitimate users can't reach it. That's a textbook
availability problem, not a confidentiality one.

### The Fix

I built myself a quick gut-check instead of relying on instinct:

```
Data being seen by the wrong person   → Confidentiality
Data being changed without permission → Integrity
Service or data being inaccessible    → Availability
```

**My Observation:**
"Attack" and "confidentiality" had quietly become linked in my head just
from repetition — most cybersecurity news stories are about breaches and
leaked data. But not every attack targets the same pillar, and assuming
it does is exactly how you misclassify an incident's severity and send
the wrong team down the wrong path first.

---

## Struggle 4: I Assumed an IDS Would Stop the Attack It Detected

### The Problem

Reading through Course 3's network security devices, I glanced at "IDS"
and "IPS" side by side and mentally filed them as basically the same
thing — "the tool that stops bad traffic." I carried that assumption
straight into a practice question about incident response and got it
wrong.

### My Debugging Process

I went back and read each acronym slowly instead of skimming past them
as a pair. IDS stands for Intrusion **Detection** System — it watches and
alerts, nothing more. IPS stands for Intrusion **Prevention** System — it
watches *and* actively blocks. I'd been treating the "D" and the "P" as
interchangeable letters instead of the entire point of the distinction.

### The Fix

I wrote the difference out in terms of what an analyst would actually
have to do next, since that's the part that matters in practice:

```
IDS fires an alert   → a human still has to decide and act
IPS fires and blocks → the system has already acted, the human reviews after
```

**My Observation:**
Two acronyms that differ by one letter are exactly the kind of detail
that's easy to blur when you're speed-reading a device list. But that one
letter is the difference between "someone needs to respond right now" and
"the system already responded — go confirm it did the right thing."

---

## Struggle 5: I Thought I Understood Security Frameworks — Until I Tried to Actually Use One

### The Problem

Three courses in one week — NIST CSF, the CIA Triad, security domains,
playbooks, network architecture, hardening. On paper, everything made
sense. Then I sat down to map a simple incident to an actual playbook,
and I froze. I could recite the CIA Triad, list the eight security
domains, explain what a playbook is for. But the moment a scenario asked
"what's your first step," I hesitated.

This wasn't a knowledge problem. It was an application problem. I had
memorized the map without ever walking the terrain.

### My Debugging Process

I went back over what I actually knew versus what I could actually do
with it, and the gap was obvious once I looked for it. I knew the
definitions cold, but every time a concept needed to be *applied* to a
scenario instead of *recited*, I stalled.

- A vulnerability showed up in a practice scenario, and I needed to ask
  which part of the CIA Triad it actually threatened — not just repeat
  the acronym back.
- A playbook needed to function as a decision tree under pressure, not a
  document to admire and summarize.
- Network architecture connected directly back to hardening — every open
  port was a risk the frameworks exist to manage — but I hadn't drawn
  that line myself until I was forced to.

Foundations gave me vocabulary. Risk management gave me structure.
Networking gave me terrain. I just hadn't connected the three — I'd been
studying them as three separate subjects instead of one continuous way
of thinking.

### The Shift

I started asking one question after every concept: **"If I were the
analyst on shift, what would I actually do right now?"**

I took a basic scenario — an unauthorized login attempt on a network
device — and walked it end to end:

```
Which domain does this fall under?         → Security & Risk Management / IAM
Which control should have caught this?      → Access control / MFA enforcement
What does the playbook say to do first?      → Detection and Analysis phase
Where does this sit in the architecture?      → Access layer, network device
```

That one exercise taught me more than three weeks of reading. The CIA
Triad stopped being abstract — it's why I flagged availability first,
not confidentiality, since the concern was an active login attempt
potentially locking out or disrupting the legitimate device owner. The
playbook stopped being paperwork — it's what stopped me from improvising
under pressure once I actually needed a first step and didn't have one
memorized.

**My Observation:**
Knowing a framework and knowing how to *think* in a framework are two
different skills — and only one of them helps when something actually
goes wrong. It's easy to mistake fluent recall for real understanding,
right up until a scenario asks you for a decision instead of a
definition.

---

## Week 5 Reflection on Struggles

Looking back, almost every struggle this week traced back to the same
idea: the gap between defining something and deciding with it. I could
recite risk, threat, and vulnerability separately, but blurred them the
moment a scenario asked me to label one. I knew the seven RMF steps by
name, but hadn't internalized that order was the entire point. I knew
the CIA Triad's three pillars, but let "attack" default to
"confidentiality" out of habit instead of reading the scenario properly.
I knew IDS and IPS were different tools, right up until a one-letter
difference tripped me on a quiz. And I knew every framework, domain, and
playbook by definition — right up until a single scenario asked me for a
first step instead of a definition, and I had nothing memorized that
could answer that.

Last week, Wireshark humbled me by showing me raw packets I couldn't yet
read. This week, a handful of quiet, low-drama mix-ups did the same job
without any tool involved at all — just definitions that looked solid on
paper and blurred together the moment a real scenario asked me to choose
between them. That's the same instinct a SOC analyst runs on every
shift: an incident doesn't arrive with a label telling you which term,
which step, or which pillar applies. You either know how to reach for the
right one under pressure, or you don't — and the only way to find out
which one you are is to stop reciting and start deciding.

I didn't just learn frameworks and definitions this week. I learned that
a definition I can't apply under pressure isn't actually learned yet —
it's just memorized.

**Have you ever memorized something perfectly, only to blank when it was
time to apply it?**
