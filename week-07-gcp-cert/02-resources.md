# Week-07 — Resources

This is everything I used this week to complete **Course 6** and **Course 7** of the **Google Cybersecurity Professional Certificate** on Coursera.
I'm documenting this so anyone starting from scratch can follow the same path.
Course 4 and 5 handed me the terminal and the database. This week handed me an alert queue and a script editor — the certificate stopped teaching "how systems work" and started teaching "how you actually respond when something goes wrong, and how you automate the parts that shouldn't need a human every time."

---

## The Resources That Shaped This Week

Week 6 was command-line and query-syntax learning. This week split into two very different halves: the first half (Course 6) was investigative — reading packets, reading alerts, reading logs like a detective reads a case file. The second half (Course 7) was constructive — writing Python instead of just reading output.

Coursera was still the backbone for both, but I didn't want Wireshark or Python to be things I only saw inside a guided lab. So for Course 6 I pulled up real sample PCAP files and poked around in Wireshark on my own, and for Course 7 I kept a Python shell open the entire week just to test small snippets outside the course exercises.

---

## Core Resources I Used This Week

| Resource | Link | Type |
|----------|------|------|
| Course 6 — Sound the Alarm: Detection and Response | [coursera.org/learn/detection-and-response](https://www.coursera.org/learn/detection-and-response) | Coursera Course — Google Career Certificates |
| Course 7 — Automate Cybersecurity Tasks with Python | [coursera.org/learn/automate-cybersecurity-tasks-with-python](https://www.coursera.org/learn/automate-cybersecurity-tasks-with-python) | Coursera Course — Google Career Certificates |
| Wireshark Official Docs | [wireshark.org/docs](https://www.wireshark.org/docs/) | Primary Source — Free |
| Splunk Free Trial + Docs | [splunk.com/en_us/download.html](https://www.splunk.com/en_us/download.html) | Practice — Free tier |
| Python Official Docs | [docs.python.org/3](https://docs.python.org/3/) | Primary Source — Free |
| regex101.com | [regex101.com](https://regex101.com/) | Practice — Free |
| MITRE ATT&CK Framework | [attack.mitre.org](https://attack.mitre.org/) | Primary Source — Free |

---

## Course Activities — Where the Theory Got Applied

This week's labs were the most hands-on yet — Course 6 runs inside a simulated SIEM and packet-capture environment, and Course 7 is built entirely around writing and running real Python scripts inside Coursera's code editor.

### What I Completed
| Activity | Course | What It Involved |
|------|-----------|-----------|
| Packet Analysis Lab | Course 6 | Used Wireshark to inspect a sample PCAP and identify suspicious traffic |
| IDS Rule-Writing Activity | Course 6 | Wrote and interpreted basic Suricata-style detection rules |
| SIEM Query Lab | Course 6 | Ran search queries in a simulated SIEM to correlate log events |
| Incident Handler's Journal | Course 6 | Documented a full mock incident from detection through containment |
| Python Fundamentals Lab | Course 7 | Practiced variables, data types, and conditionals in the course's code editor |
| Debugging Exercise | Course 7 | Fixed intentionally broken scripts to practice reading tracebacks |
| Regex + Log Parsing Lab | Course 7 | Wrote regex patterns to extract IPs and timestamps from sample log files |

### Why This Mattered
Reading about IDS signatures is one thing. Actually writing a rule, testing it against traffic, and watching it either fire or stay silent — that's what made "signature-based detection" click as something specific rather than a vague category.
The Python debugging exercise was the same lesson from a different angle: I learned more from fixing three deliberately broken scripts than I would have from reading a chapter on syntax rules.

---

## Topic-wise Resources

### Course 6 — Sound the Alarm: Detection and Response

#### 9. Incident Response Fundamentals

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| Coursera — Course 6, Module 1 | [Watch](https://www.coursera.org/learn/detection-and-response) | Must Watch | Introduces the NIST incident response lifecycle and analyst roles |
| Portfolio Activity — Incident Handler's Journal | Built into course | Must Do | Practiced documenting an incident in real time, not after the fact |

**Real World Connection:**
Keeping the journal while the mock incident was still "in progress" — instead of writing it up afterward from memory — was the part that made this feel like a real job task instead of a homework assignment.

---

#### 10. Network Traffic and Packet Analysis

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| Coursera — Course 6, Module 2 | [Watch](https://www.coursera.org/learn/detection-and-response) | Must Watch | Covers packet structure and protocol analyzers |
| Wireshark Official Docs | [Read](https://www.wireshark.org/docs/) | Must Read | Went beyond the course lab to understand filter syntax properly |

**Real World Connection:**
Once I understood what a packet actually contains, opening Wireshark stopped feeling like staring at random noise — I could pick out source/destination and protocol at a glance.

---

#### 11. IDS/IPS and SIEM Tools

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| Coursera — Course 6, Module 3 | [Watch](https://www.coursera.org/learn/detection-and-response) | Must Watch | Covers IDS/IPS concepts and introduces SIEM correlation |
| Splunk Free Trial + Docs | [Try](https://www.splunk.com/en_us/download.html) | Recommended | Practiced writing search queries outside the course's simulated SIEM |

**Real World Connection:**
Writing my first working SIEM search that actually correlated two different log sources felt like the direct payoff of Course 4's SQL work — same instinct, different tool.

---

#### 12. Containment, Eradication, Recovery, and Post-Incident Activity

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| Coursera — Course 6, Module 4 | [Watch](https://www.coursera.org/learn/detection-and-response) | Must Watch | Covers the full containment-through-recovery process and post-incident reporting |
| Portfolio Activity — Mock Incident Response | Built into course | Must Do | Walked a sample incident through containment, eradication, and recovery |

**Real World Connection:**
This is the module that finally made "the incident isn't over when the system's back online" feel real — the post-incident report step was the part I would have skipped if the course hadn't forced it.

---

### Course 7 — Automate Cybersecurity Tasks with Python

#### 13. Python Fundamentals for Security

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| Coursera — Course 7, Module 1 | [Watch](https://www.coursera.org/learn/automate-cybersecurity-tasks-with-python) | Must Watch | Covers variables, core data types, and why Python is used in security |
| Python Official Docs | [docs.python.org/3](https://docs.python.org/3/) | Recommended | Reference for anything the course lab moved past too quickly |

**Real World Connection:**
Realizing an IP address is just a string and a list of blocked hosts is just a list made the whole "why does Python matter for security" question stop being abstract.

---

#### 14. Conditionals, Functions, and Debugging

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| Coursera — Course 7, Module 2 | [Watch](https://www.coursera.org/learn/automate-cybersecurity-tasks-with-python) | Must Watch | Covers conditionals, functions, and reading Python tracebacks |
| Portfolio Activity — Debugging Exercise | Built into course | Must Do | Fixed deliberately broken scripts to practice reading error messages |

**Real World Connection:**
Debugging someone else's broken script turned out to be closer to incident investigation than I expected — isolate, test, narrow it down, confirm.

---

#### 15. Regular Expressions and File/API Automation

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| Coursera — Course 7, Module 3 | [Watch](https://www.coursera.org/learn/automate-cybersecurity-tasks-with-python) | Must Watch | Covers regex pattern matching and working with files and APIs |
| regex101.com | [Practice](https://regex101.com/) | Must Try | Free live regex tester — let me see matches highlighted instantly instead of guessing |

**Real World Connection:**
Writing a regex that pulled every IP address out of a messy log file, then writing that to its own output file, was the first time this week felt like an actual finished automation tool rather than an exercise.

---

## Tools & Platforms I Used This Week

| Tool | Purpose | Link |
|------|---------|------|
| Coursera | Followed Course 6 and Course 7 of the Google Cybersecurity Certificate | [coursera.org](https://www.coursera.org) |
| Wireshark | Practiced packet analysis outside the course sandbox | [wireshark.org](https://www.wireshark.org/) |
| Splunk | Extra SIEM query practice on the free trial | [splunk.com](https://www.splunk.com/en_us/download.html) |
| Python (python.org) | Ran and tested scripts outside the course editor | [python.org](https://www.python.org/) |
| regex101.com | Tested and debugged regex patterns live | [regex101.com](https://regex101.com/) |
| MITRE ATT&CK | Cross-referenced detection concepts against real adversary techniques | [attack.mitre.org](https://attack.mitre.org/) |

---

## My Honest Rating of This Week

| Topic | Difficulty | My Experience |
|-------|------------|---------------|
| Incident Response Lifecycle | Easy | Logical sequence, easy to remember once I saw it applied to a real mock incident |
| Packet Analysis (Wireshark) | Medium | Reading individual packets was fine; spotting the *suspicious* one in a full capture took practice |
| IDS/IPS Rule Writing | Medium | Rule syntax felt unfamiliar at first, similar learning curve to early SQL |
| SIEM Queries | Easy | Directly transferable from Course 4's SQL logic |
| Containment/Eradication/Recovery | Medium | Easy to define, harder to sequence correctly under a realistic mock scenario |
| Python Fundamentals | Easy | Syntax was approachable, especially coming in with some CS background |
| Debugging | Medium | Reading tracebacks got much easier after the third broken script |
| Regex | Hard | Conceptually simple but genuinely fiddly to get exactly right without a live tester |
| Files and APIs | Medium | Straightforward once I stopped overcomplicating the `with open()` syntax |

---

## My Recommendation to Anyone Starting This Path

If Course 4 taught you to move around a system and Course 5 taught you to think about risk, **Course 6 is where you finally sit in the analyst's chair** — don't rush the packet analysis lab, and actually open Wireshark on a sample capture outside the guided walkthrough at least once.
For Course 7, don't skip straight to regex before you're solid on strings and conditionals — regex clicks a lot faster once you already understand what you're searching *through*, not just what pattern you're searching *for*.
Keep a regex tester open the whole time. It's the same lesson as Week 6's SQLBolt — a fast feedback loop turns a frustrating syntax into an intuitive one.

Last week was about operating inside the system — commands and queries. This week was about watching the system for trouble and then writing the code to watch it for you. Four courses down, three to go — the SOC-analyst shape of this certificate is starting to feel real now, not just theoretical.
