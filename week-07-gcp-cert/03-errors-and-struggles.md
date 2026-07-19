# Week 07 — Errors & Struggles

This week was Course 6 and Course 7 of the Google Cybersecurity
Certificate — incident response, packet analysis, IDS/IPS, SIEM
investigation, containment and recovery, and then straight into Python
fundamentals, debugging, and regex. Two heavy topics stacked back to
back. Where last week's struggles were about getting a command or query
to run at all, this week's struggles were about knowing *what to ask*
once the tool was already working. Documenting all of it below, exactly
as it happened.

---

## Struggle 1: I Was Searching for Data Instead of Investigating an Event

### The Problem

I could read through logs and understand what individual entries meant.
I could follow along with packet analysis just fine. But the moment a
lab put me inside a SIEM tool and asked me to investigate an event, I
froze. I kept writing queries trying to "find something" — throwing
filters at the tool hoping something useful would surface. I had no
direction. Meanwhile I was also learning IDS signatures, Python
functions, and regex, and none of it felt connected. I was collecting
concepts, not building understanding.

### My Debugging Process

IDS signatures changed how I saw everything. A signature isn't just a
rule — it's a written description of known attack behavior. When I
looked at one closely and traced it back to what an actual attacker
does, the SIEM query stopped being a search problem. It became a
question: did this specific behavior happen, and when? That's a
completely different mindset. I wasn't hunting for data anymore. I was
investigating an event.

### The Fix

I went back to the SIEM lab with that framing and it clicked. Instead of
pulling random fields, I asked what the attack actually looks like in a
log first, and let the query follow that question instead of leading
with it:

```
Before: pull fields and filter, hoping something useful surfaces
        (undirected exploration — no hypothesis, just noise)

After:  1. What does this attack behavior actually look like?
        2. What source IP, port, or time window would prove it happened?
        3. Only then → build the query around that specific answer
```

Python started making sense the same way. Regex isn't just pattern
matching — it's how you pull the exact indicator out of thousands of log
lines automatically. Detection, response, and automation aren't three
separate topics. They're one workflow.

**My Observation:**
A SIEM query without a security question behind it is just noise. The
tool only becomes powerful once you know what attack behavior you're
looking for — and that only comes from understanding how the attack
actually works, not from memorizing the query language.

---

## Struggle 2: I Wrote an IDS Rule Backwards Without Noticing

### The Problem

In the IDS rule-writing activity, I was asked to write a rule that
alerts on any traffic *coming into* a protected host on port 22
(SSH). I wrote:

```
alert tcp 192.168.1.10 22 -> any any (msg:"SSH login attempt"; sid:1000001;)
```

It looked right to me — the protected host and the port were right
there at the front of the rule. The lab flagged it as incorrect and I
couldn't immediately see why.

### My Debugging Process

I'd been reading the rule left-to-right as "subject, then action,"
the same way I'd read an English sentence — protected host first,
because it felt like the important part. But a Suricata-style rule
reads as `source -> destination`, not "important thing first." I had
the direction of the traffic completely backwards: my rule was watching
for traffic *leaving* port 22 on that host, not arriving at it.

### The Fix

I stopped trying to front-load the "important" IP and forced myself to
read the arrow literally, every time:

```
alert protocol source_ip source_port -> dest_ip dest_port (options)

What I wrote:  192.168.1.10:22 -> any:any   (traffic FROM the host, port 22)
What I needed: any:any -> 192.168.1.10:22   (traffic TO the host, port 22)

alert tcp any any -> 192.168.1.10 22 (msg:"SSH login attempt"; sid:1000001;)
```

**My Observation:**
A rule that "looks right" because the important detail is early in the
line isn't the same as a rule that's structurally correct. The arrow in
an IDS rule means something specific — direction — and skimming past it
is exactly how a detection rule ends up watching the wrong traffic
entirely.

---

## Struggle 3: My Regex Matched Nothing Because I Forgot to Escape a Period

### The Problem

In the Course 7 regex lab, I wrote a pattern to pull IP addresses out of
a sample log file:

```python
import re
match = re.search(r'\d+.\d+.\d+.\d+', log_line)
```

It ran without any errors, which made me assume it was correct. But when
I tested it against a log line that had a version number sitting right
next to an IP address, it matched the wrong thing entirely, and I had no
idea why a script with no errors could still be wrong.

### My Debugging Process

The script running without errors and the script being *correct* turned
out to be two completely different things. I'd forgotten that `.` in
regex means "any character," not a literal period. My pattern wasn't
looking for an IP address shape at all — it was matching almost any
group of digit-something-digit-something-digit-something-digit, which
is why it happily matched the wrong text.

### The Fix

I went back and escaped the periods so the pattern actually meant what I
intended:

```python
import re
match = re.search(r'\d+\.\d+\.\d+\.\d+', log_line)
```

**My Observation:**
"No error" is not the same as "correct." A script can run cleanly and
still be quietly wrong, especially in regex, where an unescaped
character doesn't throw an exception — it just silently changes what
you're actually matching against.

---

## Struggle 4: I Contained an Incident Before Confirming What I Was Containing

### The Problem

In the mock incident response activity, I was given an alert about
unusual outbound traffic from a host and asked to respond. I immediately
jumped to containment — isolating the host from the network — before
I'd actually confirmed what the traffic was or where it was going.

### My Debugging Process

The lab's follow-up question asked me to justify the containment
decision using evidence, and I realized I didn't have any yet. I'd
skipped straight from "alert fired" to "isolate the host," treating
containment as the automatic first move instead of a decision that
should follow analysis. Detection and Analysis comes before Containment
in the lifecycle for a reason — acting before confirming risks
containing the wrong thing, or missing evidence that would have shown
the full scope of what actually happened.

### The Fix

I went back through the alert properly before touching containment at
all:

```
1. Detection & Analysis  → what is this traffic, where is it going, is it actually malicious?
2. THEN Containment       → isolate based on what step 1 actually confirmed
3. Eradication            → remove the confirmed cause
4. Recovery                → restore and verify
```

**My Observation:**
Containment feels like the responsible, decisive move to make first —
but skipping straight to it without analysis isn't fast incident
response, it's just guessing with extra steps. The lifecycle puts
Detection & Analysis first because the containment decision is supposed
to be evidence-based, not reflexive.

---

## Week 7 Reflection on Struggles

This week's struggles were quieter than last week's, but arguably
sharper. Nothing threw a loud error — the SIEM query ran, the regex ran,
the IDS rule saved without complaint, and the containment action
"worked." Every single mistake this week was the tool doing exactly what
I told it to do, while I was telling it the wrong thing.

Last week's lesson was that a definition I can't apply under pressure
isn't actually learned yet. This week extended that further: sometimes
the tool doesn't even tell you you're wrong. A query with no direction
still returns results. A regex with an unescaped character still runs.
A rule read backwards still saves. The gap wasn't syntax — it was
knowing what question I was actually supposed to be asking before I
touched the keyboard.

I didn't just learn SIEM, IDS rules, regex, and incident response this
week. I learned that the most dangerous mistakes are the ones that don't
error out — because nothing forces you to go back and check your
reasoning if the tool never complains.

**Have you ever been handed a powerful tool and realized the gap wasn't
the tool — it was knowing what question to ask it?**
