# Week 06 — Errors & Struggles

This week was Course 4 and Course 5 of the Google Cybersecurity Certificate —
Linux fundamentals, the Bash shell, file permissions, relational databases,
SQL, asset classification, attack surface, threat actors, and threat
modeling. Compared to last week's reading-heavy struggle, this week's
mistakes were louder — a wrong command actually errors out, a bad query
actually returns nothing. Documenting all of it below, exactly as it
happened.

---

## Struggle 1: I Tried to Numeric-Notation My Way Through `chmod` Without Understanding It

### The Problem

Working through Course 4's permissions lab, I hit a task asking me to
give a script owner read/write/execute, group read/execute, and others
nothing. I typed `chmod 750 script.sh` because I'd memorized "750 is a
common permission setting" from a cheat sheet — not because I understood
why those three digits meant what they meant.

### My Debugging Process

The lab asked me to change the requirement slightly — group should only
get read, not execute — and I froze. I had no idea which digit to change
or why, because I'd never actually connected `7`, `5`, and `0` back to
`rwx`, `r-x`, and `---`. I'd memorized the answer to one specific
question instead of learning the system that generates every answer.

### The Fix

I stopped treating numeric notation as a lookup table and rebuilt it
from the actual math every single time, until it stopped requiring
effort:

```
r = 4 | w = 2 | x = 1
Owner: rwx = 4+2+1 = 7
Group: r-- = 4+0+0 = 4   (what I actually needed, not 5)
Others: --- = 0+0+0 = 0

chmod 740 script.sh
```

**My Observation:**
A memorized number is only useful for the exact question it was
memorized for. The moment the lab changed one condition, the shortcut
collapsed — and rebuilding the permission from `r/w/x` values up was
slower the first time but the only version of this skill that actually
transfers to a real, different scenario.

---

## Struggle 2: I Spent Three Days Fighting a SQL Join — Because I Was Thinking About the Problem Backwards

### The Problem

This week I moved from the Linux/Bash side of Tools of the Trade into
SQL, and then straight into Assets, Threats, and Vulnerabilities.
Individually, each topic made sense. Together, they exposed a gap I
didn't know I had.

I could write a basic `SELECT` statement fine. Filter with `WHERE`, no
problem. But the second a lab asked me to pull data from two tables — an
assets table and a vulnerabilities table — using a `JOIN`, I completely
stalled. I kept trying to filter my way to the answer instead of
relating the tables to each other. Meanwhile I was learning how analysts
classify assets and score vulnerabilities by severity, and I couldn't
connect that "real" security work to the query sitting in front of me.

### My Debugging Process

A `JOIN` isn't a syntax trick — it's a relationship. An `asset_id` in one
table and the same `asset_id` in another table are literally how a
database connects "what device is this" to "what's wrong with it."
That's not abstract. That's the exact question a security analyst asks
every day: which assets have critical vulnerabilities, and how do I find
that fast in a database instead of scrolling a spreadsheet.

### The Fix

I stopped trying to memorize `JOIN` syntax and started drawing the
tables out by hand — `asset_id`, `hostname`, `owner` on one side,
`asset_id`, `CVE`, `severity` on the other. Once I could see the shared
column, the query wrote itself:

```sql
SELECT hostname, severity
FROM assets
INNER JOIN vulnerabilities ON assets.asset_id = vulnerabilities.asset_id
WHERE severity = 'Critical';
```

That one line did more to teach me vulnerability management than the
reading did — because I had to think like an analyst to even write it.

**My Observation:**
Knowing SQL syntax and knowing how to ask a security question in SQL are
two different skills — and the second one only shows up once you stop
filtering and start relating.

---

## Struggle 3: I Drew the Classification Line in the Wrong Place

### The Problem

In Course 5's asset classification activity, I was given a fictional
company's internal onboarding guide — useful to new employees, but never
meant to leave the building — and I classified it as **Public**. My
reasoning was "it's not sensitive data, nobody's harmed if it leaks."
That reasoning felt airtight right up until I checked it against the
answer key.

### My Debugging Process

I'd been classifying assets purely on *sensitivity of content*, when the
actual classification scheme also depends on *intended audience*. Public
doesn't mean "not embarrassing if leaked" — it means "there's genuinely
no restriction on who can see it." An onboarding guide might not contain
secrets, but it was still written for employees only, which makes it
Internal-Only by definition, regardless of how harmless the content
feels.

### The Fix

I built a quick two-question gut-check instead of relying on a single
"how bad would it be" instinct:

```
Who was this actually written for?        → defines the audience boundary
What happens if that audience expands?     → defines the classification tier
```

**My Observation:**
I'd been running one test (harm) when the classification scheme actually
runs two (harm *and* intended audience). Skipping the second question is
exactly how a low-harm document gets mislabeled Public when it was never
meant to leave the org in the first place.

---

## Struggle 4: I Mapped a Spoofing Scenario to the Wrong STRIDE Category

### The Problem

Course 5's threat modeling walkthrough gave me a scenario: an attacker
using a stolen employee badge to enter a restricted server room. I
confidently labeled it **Tampering**, since my brain jumped straight to
"something physical was altered — access was changed."

### My Debugging Process

Nothing in the scenario involved data or a system being *changed*.
Tampering is about integrity — modifying something that should stay
intact. What actually happened here was an attacker successfully
pretending to be someone they weren't, using stolen credentials to pass
as an authorized identity. That's **Spoofing**, which attacks
authentication, not integrity.

### The Fix

I rebuilt my STRIDE gut-check the same way I'd fixed the CIA Triad
mix-up last week — by asking what was actually violated, not what felt
dramatic:

```
Pretending to be someone else            → Spoofing (Authentication)
Changing data/systems without permission → Tampering (Integrity)
Denying an action you actually took       → Repudiation (Accountability)
Seeing data you shouldn't                  → Information Disclosure (Confidentiality)
Overwhelming a system                       → Denial of Service (Availability)
Gaining access beyond your permission level  → Elevation of Privilege (Authorization)
```

**My Observation:**
"Something bad happened to access" isn't specific enough to pick a
STRIDE category — a stolen badge and a tampered system both *feel*
like access problems, but they violate completely different
principles. The fix, again, was reading the scenario for what actually
happened instead of what category it superficially resembled.

---

## Week 6 Reflection on Struggles

This week's struggles were louder than last week's, but they traced back
to the exact same root cause. A memorized `chmod` value collapsed the
moment the requirement changed slightly. A SQL `JOIN` refused to click
until I stopped filtering and started relating two tables the way an
actual analyst would. A classification call felt obviously right until I
realized I'd only been testing for harm and had skipped the audience
question entirely. And a STRIDE category felt correct purely because it
*sounded* dramatic, not because it matched what was actually violated.

Last week I learned that a definition I can't apply under pressure isn't
actually learned yet. This week extended that lesson into places with
harder feedback — a terminal that errors out, a query that returns
nothing, an answer key that disagrees with me. That's a faster, blunter
teacher than a quiz question ever was, and I think that's exactly why
this week's mistakes stuck better than last week's did.

I didn't just learn Linux, SQL, and threat modeling this week. I learned
that hands-on feedback finds the gaps in your understanding faster than
reading ever will — because reading lets you *feel* like you understood
something, and a terminal doesn't care how you feel.

**Have you ever gotten stuck on a technical skill only to realize you
were solving the wrong problem entirely?**
