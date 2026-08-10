# Week 10 — Errors & Struggles

This week was the Cyber Threat Intelligence module of the SOC Level 1
Path — Pyramid of Pain, the Kill Chain models, the Diamond Model, MITRE
ATT&CK, MISP, OpenCTI, and YARA. After two hands-on tooling weeks, I
expected this week to be the "easy" one — read the frameworks, apply
them. Instead the real difficulty was precision: every framework this
week has terms that sound interchangeable but aren't, and getting them
"roughly right" wasn't the same as getting them right. Documenting all of
it below, exactly as it happened.

---

## Struggle 1: I Mapped an Alert's "How" and Called It the "Why" in MITRE ATT&CK

### The Problem

I was given a scenario describing a phishing email that dropped a
malicious macro to gain a foothold on a machine, and had to classify it
using MITRE ATT&CK. I confidently labeled "Phishing" as the Tactic. It
felt right — phishing is the attack. ATT&CK marked it wrong, and I
couldn't figure out why for a good ten minutes.

### My Debugging Process

I'd been reading Tactics and Techniques as the same thing wearing
different labels. They're not. A Tactic is the attacker's goal — the
"why" (in this case, Initial Access). A Technique is the specific method
used to achieve that goal — the "how" (Phishing is the Technique, sitting
underneath the Initial Access Tactic). I'd been naming the tool the
attacker used and calling it their objective.

### The Fix

Now, before I map anything, I ask two separate questions instead of one,
in order:

```
1. "What was the attacker trying to accomplish?"      → that's the Tactic
2. "What specific method did they use to accomplish it?" → that's the Technique
```

Answering them separately, in that order, stops me from collapsing the
two into a single guess.

**My Observation:**
Getting a framework "roughly right" isn't the same as getting it right.
Mislabeling a Technique as a Tactic doesn't just cost a wrong answer — in
a real SOC, it means writing the incident report at the wrong level of
detail entirely. Slow down on the vocabulary before trusting your
instinct on the mapping.

---

## Struggle 2: I Treated a Rotated IOC as "New Intel" Instead of the Same IOA

### The Problem

Working through the Pyramid of Pain room, I was looking at a scenario
where an attacker's C2 IP changed between two incidents. My first
instinct was to log it as a separate, unrelated finding — new IP, new
entry.

### My Debugging Process

I went back to the IOC vs IOA distinction from the Intro to CTI room and
realized I'd been thinking entirely in IOC terms — treating each new hash
or IP as its own isolated fact — instead of asking whether the underlying
*behavior* connecting them was the same. The IP had changed; the
technique used to stand it up hadn't. I was tracking artifacts, not the
attacker.

### The Fix

Before logging any indicator as "new," I now check it against the
behavior first:

```
1. Has this IOC (hash/IP/domain) changed? → expected, low pain to rotate
2. Has the underlying TTP changed?           → if no, it's still the same actor/campaign
3. Log it as a continuation, not a new event
```

**My Observation:**
The whole point of the Pyramid of Pain is that low-pain indicators are
*supposed* to change. Treating every rotated IOC as a brand-new finding
means missing that it's the same campaign wearing a different IP — exactly
the gap the pyramid exists to prevent.

---

## Struggle 3: I Built a MISP Event and Assumed It Was Shared the Moment I Saved It

### The Problem

In the Threat Intelligence Tools room, I created a MISP event, added a
few attributes (IOCs), and moved on assuming the event was now visible to
the connected community — only to later realize nothing had actually been
shared.

### My Debugging Process

Saving an event in MISP and publishing it are two different actions. I'd
created and populated the event but never hit publish, and I also hadn't
set a Traffic Light Protocol (TLP) tag on it — so even if I had published
it, MISP had no instruction on who it was actually cleared to reach.

### The Fix

I now walk through the full sequence explicitly instead of stopping at
"saved":

```
1. Create Event
2. Add Attributes (IOCs)
3. Tag with TLP (who's allowed to see this)
4. Publish
```

**My Observation:**
An unpublished MISP event is functionally the same as an analyst's
private notes — accurate, but useless to anyone else. The entire value
of a TIP is step 4, not step 2.

---

## Struggle 4: I Stayed on One Vertex of the Diamond Model Instead of Pivoting

### The Problem

In the Trooper room, I identified a malicious IP (Infrastructure) early
and spent most of my time trying to learn more *about that IP* — more
WHOIS lookups, more passive DNS — instead of moving anywhere else.

### My Debugging Process

I'd found one vertex of the Diamond Model and kept digging straight down
into it instead of using it to reach the other three. The room's actual
expectation was to pivot from that one Infrastructure data point out to
Capability (what tooling connected to it) and eventually Adversary — not
to exhaustively mine a single vertex before moving on.

### The Fix

I now treat any single finding as a starting point across all four
vertices, not an endpoint to fully exhaust first:

```
Adversary ←→ Infrastructure ←→ Capability ←→ Victim
   (found one? ask what it connects to on each of the other three)
```

**My Observation:**
The Diamond Model's value is in the pivoting, not in any one vertex
alone. Going deep on Infrastructure without ever crossing to Capability
or Adversary is the CTI equivalent of reading one page of a report and
calling it the investigation.

---

## Struggle 5: My YARA Rule "Matched" Everything Because I Never Wrote a Real Condition

### The Problem

Writing my first YARA rule in the YARA room, I defined a few `strings`
that looked specific to the sample malware, ran the rule, and it flagged
almost every file in the test set — including clearly unrelated ones.

### My Debugging Process

I'd copied the rule structure but left the `condition` block as a lazy
catch-all instead of actually combining the strings with real logic. A
condition like "any of them" will match if even one loosely common string
shows up anywhere, which is exactly what happened — one of my patterns
was generic enough to appear in unrelated files too.

### The Fix

I rewrote the condition to require multiple specific strings together,
not just any single match:

```
condition:
    $a and $b and not $c    # require the specific combination,
                              # explicitly exclude a known false-positive pattern
```

**My Observation:**
The `strings` block is just a list of candidates — the `condition` block
is what actually turns YARA into a detection instead of a keyword search.
A rule with strong strings and a weak condition is still a weak rule.

---

## Week 10 Reflection on Struggles

Looking back, this week's struggles had a different shape than Week-09's.
Week-09 was about trusting my first assumption when a tool's *output*
looked wrong — blaming the SIEM, the port state, the exploit, the proxy,
before checking my own configuration. This week, every struggle came from
collapsing two related-but-different concepts into one: Tactic vs
Technique, IOC vs IOA, saving vs publishing, one vertex vs pivoting across
all four. In every case the framework was precise — I was the one being
loose with it.

That's a different muscle than the one Week-09 built, but it's the same
job. A SOC analyst's tools rarely lie, and neither do the frameworks
underneath them — the risk is always in how carefully *I* apply the
vocabulary. Week-09 taught me to stop distrusting the tool before
checking myself. This week taught me to stop assuming "close enough" on
a term means I actually understand it.

I didn't just learn new frameworks this week. I learned that the fastest
way to write a wrong report isn't a bad tool — it's a sloppy definition
that felt right enough not to double-check.

**Have you ever been confidently wrong about a term you thought you already
understood, only to realize you'd been quietly using it incorrectly the
whole time?**
