# Course 6 — Sound the Alarm: Detection and Response Notes

---

## 1. Introduction to Detection and Incident Response

### What Is Incident Response?
The structured approach an organization takes to identify, contain, and recover from a security incident — turning chaos into a repeatable, documented process.

### The Incident Response Lifecycle (NIST Framework)
```
Preparation → Detection & Analysis → Containment, Eradication & Recovery → Post-Incident Activity
```

### Core Roles in Incident Response
| Role | Responsibility |
|---|---|
| SOC Analyst (Tier 1) | Monitors alerts, performs initial triage |
| SOC Analyst (Tier 2/3) | Deep investigation, escalation handling |
| Incident Commander | Coordinates the overall response |
| Forensics Investigator | Preserves and analyzes evidence |

### The Incident Handler's Journal
A running, timestamped log an analyst keeps during an investigation — every action taken, every observation made, every command run.

### Why It Matters for Cybersecurity
- An incident isn't "solved" until it's documented — the journal is often the only artifact that survives to become evidence, a lessons-learned report, or legal documentation.
- The lifecycle exists precisely so a stressful, high-stakes event still gets handled the same way every time, by whoever happens to be on shift.

### Key Takeaway
> Incident response isn't improvisation under pressure — it's a rehearsed process that just happens to be triggered by pressure.
> The journal isn't paperwork; it's the only proof, after the fact, that the process was actually followed.

---

## 2. Network Monitoring and Packet Analysis

### What Is Network Traffic Analysis?
The process of capturing and inspecting the data flowing across a network to identify normal behavior — and spot the behavior that isn't.

### Key Concepts
```
Packet    → the smallest unit of data transmitted across a network
Packet capture (PCAP) → a recorded file of network traffic for later analysis
Protocol analyzer      → a tool that captures and decodes network traffic
```

### Common Tools
| Tool | Purpose |
|---|---|
| tcpdump | Command-line packet capture |
| Wireshark | GUI-based deep packet inspection and protocol analysis |
| Zeek (formerly Bro) | Network traffic analysis framework, generates structured logs |

### Reading a Packet (Conceptual Structure)
```
Source IP / Port  → where the traffic came from
Destination IP / Port → where the traffic is going
Protocol           → TCP, UDP, ICMP, etc.
Payload             → the actual data being transmitted
```

### Why It Matters for Cybersecurity
- Malicious activity almost always leaves a trace in network traffic — unusual ports, unexpected destinations, malformed packets.
- Wireshark and tcpdump are two of the most universally expected tools on a SOC analyst's resume — this is hands-on, not theoretical, skill-building.

### Key Takeaway
> The network doesn't lie — an attacker can hide files and clear logs, but traffic that crossed the wire, crossed the wire.
> Packet analysis is reading the digital equivalent of a conversation transcript between two machines.

---

## 3. Intrusion Detection and Prevention Systems

### IDS vs. IPS
| System | Behavior |
|---|---|
| IDS (Intrusion Detection System) | Monitors traffic, generates alerts — does not block |
| IPS (Intrusion Prevention System) | Monitors traffic and actively blocks/drops malicious traffic |
| NIDS | Network-based IDS — monitors traffic across the network |
| HIDS | Host-based IDS — monitors activity on a single device |

### Detection Methods
```
Signature-based detection → matches traffic against known attack patterns
Anomaly-based detection    → flags traffic that deviates from an established baseline
```

### Suricata Rule Structure (Conceptual)
```
action protocol source_ip source_port -> dest_ip dest_port (rule options)

Example:
alert tcp any any -> 192.168.1.10 22 (msg:"SSH login attempt"; sid:1000001;)
```

### Why It Matters for Cybersecurity
- Signature-based detection catches known threats fast but misses novel attacks; anomaly-based detection catches the unknown but generates more false positives — real SOCs run both together.
- Writing and reading IDS rules is a direct, practical skill — it's the difference between an alert being noise and an alert being actionable.

### Key Takeaway
> An IDS is a smoke detector, not a fire extinguisher — it tells you something's wrong, it doesn't put it out.
> The tradeoff between signature and anomaly detection is really a tradeoff between speed of detection and coverage of the unknown.

---

## 4. Security Information and Event Management (SIEM)

### What Is a SIEM?
A platform that aggregates, correlates, and analyzes log data from across an entire environment — turning thousands of disconnected logs into a searchable, alertable timeline.

### Core SIEM Functions
```
Log aggregation   → collecting logs from many sources into one place
Normalization      → converting logs from different formats into a consistent structure
Correlation         → linking related events across sources to detect patterns
Alerting              → notifying analysts when a correlation rule is triggered
```

### Common SIEM Tools
| Tool | Notes |
|---|---|
| Splunk | Widely used commercial SIEM, powerful search language (SPL) |
| Chronicle (Google SecOps) | Cloud-native SIEM, built for high-volume log analysis |
| IBM QRadar | Enterprise SIEM with strong correlation engine |

### Writing a Basic SIEM Query (Conceptual, Splunk-style)
```spl
index=firewall_logs action=blocked
| stats count by src_ip
| sort -count
```

### Why It Matters for Cybersecurity
- No analyst manually reads every log from every device — the SIEM is what makes SOC work possible at scale in the first place.
- SIEM query fluency is one of the most transferable skills across employers, since the underlying logic (search, filter, aggregate) is nearly identical even when the query syntax differs.

### Key Takeaway
> A SIEM doesn't replace analyst judgment — it just makes sure the analyst's judgment gets applied to the right ten events instead of ten million.
> Learning to query one SIEM well transfers to querying almost any other.

---

## 5. Containment, Eradication, and Recovery

### The Three Phases
```
Containment  → stop the incident from spreading further (isolate the host, disable the account)
Eradication   → remove the root cause (delete malware, close the vulnerability)
Recovery       → restore systems to normal operation and verify they're clean
```

### Containment Strategies
| Strategy | Example |
|---|---|
| Short-term containment | Disconnect an infected machine from the network |
| Long-term containment | Rebuild the system while keeping it isolated |
| Segmentation | Move affected systems to an isolated VLAN |

### Why It Matters for Cybersecurity
- Containing too slowly lets an incident spread; containing too aggressively can destroy the very evidence needed to understand what happened — this phase is a judgment call, not just a checklist.
- Recovery isn't complete until the system is verified clean — reintroducing a compromised system too early is a common, costly mistake.

### Key Takeaway
> Containment buys time, eradication removes the cause, recovery proves it's actually over.
> Skipping straight to "clean and restore" without proper containment is how the same incident happens twice.

---

## 6. Post-Incident Activity

### The Post-Incident Review
```
What happened?
How was it detected?
How well did the response work?
What should change going forward?
```

### The Final Report
A formal document summarizing the incident timeline, root cause, actions taken, and recommendations — often the artifact leadership and auditors actually read.

### Why It Matters for Cybersecurity
- An incident that isn't reviewed just gets repeated — post-incident activity is where an organization actually gets better, not just recovered.
- These reports frequently drive real budget and policy decisions — the technical work only pays off organizationally if it's communicated well.

### Key Takeaway
> The incident isn't truly over when the system is restored — it's over when the lesson is captured and the gap is closed.
> A good incident report turns one bad day into a permanently stronger defense.

---

## Quick Reference — Course 6 Cheat Sheet

### Incident Response Lifecycle
```
Preparation | Detection & Analysis | Containment, Eradication & Recovery | Post-Incident Activity
```

### IDS vs IPS
```
IDS: detect + alert | IPS: detect + block
NIDS: network-wide | HIDS: single host
```

### Detection Methods
```
Signature-based | Anomaly-based
```

### SIEM Core Functions
```
Aggregation | Normalization | Correlation | Alerting
```

### Containment/Eradication/Recovery
```
Containment (stop the spread) → Eradication (remove root cause) → Recovery (restore + verify)
```

---

> **Overall Key Takeaway for Course 6:**
> Course 6 is where detection theory becomes a live workflow: packets get captured, IDS rules fire, a SIEM correlates the noise into a signal, and a human decides what to do about it.
> Containment, eradication, and recovery are the actual "response" in incident response — and the post-incident report is what makes the next incident faster to handle than this one.

---

# Course 7 — Automate Cybersecurity Tasks with Python Notes

---

## 1. Introduction to Python for Security

### Why Python in Cybersecurity
```
Readable syntax     → fast to write, fast to review
Huge library ecosystem → pre-built tools for almost any security task
Cross-platform         → runs the same way on Linux, Windows, macOS
Scriptable automation    → turns repetitive manual tasks into a single command
```

### Running Python
```bash
python3 script.py       # run a script from the terminal
python3                  # open an interactive Python shell (REPL)
```

### Why It Matters for Cybersecurity
- Analysts who can script save hours a week automating log parsing, report generation, and repetitive checks — this is what separates "does the job manually" from "does the job at scale."
- Python is the de facto scripting language across security tooling, from SOAR playbooks to custom detection scripts.

### Key Takeaway
> Every manual, repetitive security task is a candidate for a Python script.
> Learning to automate the boring 80% is what frees up time for the 20% that actually needs a human analyst's judgment.

---

## 2. Python Basics — Variables and Data Types

### Core Data Types
| Type | Example | Notes |
|---|---|---|
| String (`str`) | `"suspicious_ip"` | Text data, wrapped in quotes |
| Integer (`int`) | `443` | Whole numbers |
| Float (`float`) | `3.14` | Decimal numbers |
| Boolean (`bool`) | `True` / `False` | Logical values |
| List | `["10.0.0.1", "10.0.0.2"]` | Ordered, mutable collection |
| Dictionary (`dict`) | `{"ip": "10.0.0.1", "port": 443}` | Key-value pairs |

### Variable Assignment
```python
ip_address = "192.168.1.10"
port = 443
is_blocked = True
```

### Why It Matters for Cybersecurity
- Nearly every piece of security data — an IP, a log line, a list of flagged hosts — maps directly onto one of these basic types, which is why fluency here unlocks everything after it.
- Dictionaries in particular mirror how structured log data (JSON) actually looks in the real world.

### Key Takeaway
> Data types aren't abstract computer science — an IP address is a string, a port is an integer, and a list of blocked hosts is, unsurprisingly, a list.
> Getting comfortable naming what kind of data you're holding is the first real step toward manipulating it.

---

## 3. Strings, Conditionals, and Functions

### String Operations
```python
log_line = "Failed login from 192.168.1.10"
log_line.split(" ")          # breaks the string into a list of words
log_line.lower()             # converts to lowercase
"192.168.1.10" in log_line    # checks if a substring exists
```

### Conditionals
```python
if "Failed" in log_line:
    print("Suspicious activity detected")
elif "Success" in log_line:
    print("Normal login")
else:
    print("Unrecognized log format")
```

### Functions
```python
def is_suspicious(log_line):
    return "Failed" in log_line

result = is_suspicious("Failed login from 10.0.0.5")
```

### Why It Matters for Cybersecurity
- Nearly every log-parsing script is, at its core, a loop full of string operations and conditionals checking for specific patterns.
- Wrapping logic in functions is what turns a one-off script into a reusable tool other analysts can call on new data.

### Key Takeaway
> A log file is just a big string waiting to be split apart and questioned.
> Conditionals are how you encode "if this looks bad, do something" into a process a computer can run a million times without getting bored.

---

## 4. Debugging Python Code

### Common Error Types
| Error | Meaning |
|---|---|
| SyntaxError | Code doesn't follow Python's grammar rules |
| NameError | Referencing a variable that doesn't exist |
| TypeError | Performing an operation on an incompatible data type |
| IndexError | Trying to access a list position that doesn't exist |

### Debugging Approach
```
1. Read the error message and traceback carefully — it usually names the exact line
2. Isolate the failing section — print() variables to see their actual values
3. Test in small pieces rather than the whole script at once
4. Check data types — a common hidden cause of TypeErrors
```

### Why It Matters for Cybersecurity
- Security scripts often run unattended against live data — a script that fails silently or crashes on unexpected input can mean missed detections.
- Debugging methodically (not guessing) is a transferable skill that maps directly onto incident investigation itself: isolate, test, confirm.

### Key Takeaway
> The traceback isn't the enemy — it's the most direct clue Python gives you about exactly where and why something broke.
> Debugging a script and investigating an incident use the same muscle: narrow down the possibilities until only the truth is left.

---

## 5. Regular Expressions for Pattern Matching

### What Is a Regular Expression (Regex)?
A pattern-matching syntax used to search, extract, or validate specific text patterns within a larger body of text — essential for pulling structured data out of unstructured logs.

### Common Regex Patterns
```
\d       → any digit
\d+      → one or more digits
[a-zA-Z] → any letter
.        → any character
*        → zero or more of the preceding character
+        → one or more of the preceding character
```

### Using Regex in Python
```python
import re

log_line = "Failed login from 192.168.1.10 on port 22"
match = re.search(r'\d+\.\d+\.\d+\.\d+', log_line)
if match:
    print(match.group())   # prints: 192.168.1.10
```

### Why It Matters for Cybersecurity
- Extracting IP addresses, timestamps, and usernames from raw log text is one of the most common automation tasks in a SOC — regex is the tool that makes it possible.
- The same pattern-matching mindset used here is what underlies IDS signature rules from Course 6 — it's the same skill in a different context.

### Key Takeaway
> Regex is how you tell Python "find me the shape of an IP address," without knowing in advance what the actual IP will be.
> It looks cryptic at first, but it's really just a very compact way of describing a pattern.

---

## 6. Working with Files and APIs

### Reading and Writing Files
```python
with open("access.log", "r") as file:
    for line in file:
        if "Failed" in line:
            print(line.strip())

with open("flagged_ips.txt", "w") as file:
    file.write("192.168.1.10\n")
```

### Making API Requests
```python
import requests

response = requests.get("https://api.example.com/threat-intel/192.168.1.10")
data = response.json()
print(data["risk_score"])
```

### Why It Matters for Cybersecurity
- Reading files is how nearly every log-analysis script actually gets its data — this is the practical bridge between "I wrote some Python" and "I automated a real security task."
- Calling threat-intelligence APIs (checking if an IP or hash is known-malicious) is a routine automation pattern in real SOC tooling.

### Key Takeaway
> A script that can open a log file and call an API can, in principle, check every login attempt against a threat feed automatically.
> This is the point where "learning Python" becomes "having built something that actually does SOC work."

---

## Quick Reference — Course 7 Cheat Sheet

### Core Data Types
```
str | int | float | bool | list | dict
```

### String & Control Flow
```
split() | lower() | in | if/elif/else | def function():
```

### Common Error Types
```
SyntaxError | NameError | TypeError | IndexError
```

### Regex Basics
```
\d | \d+ | [a-zA-Z] | . | * | +
import re | re.search()
```

### File & API Handling
```
open() with "r"/"w" | requests.get() | .json()
```

---

> **Overall Key Takeaway for Course 7:**
> Course 7 turns Python from a language into a security tool: variables and data types give you a way to represent security data faithfully, strings and regex give you a way to extract signal from raw logs, and file/API handling gives you a way to connect that logic to real systems.
> Combined with Course 6's detection and response workflow, this is the point where the certificate closes the loop — you can now not just recognize an incident, but script the process of catching one.
