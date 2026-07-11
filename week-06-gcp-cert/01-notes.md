# Course 4 — Tools of the Trade: Linux and SQL Notes

---

## 1. Operating Systems — The Bridge Between Hardware and Applications

### What Is an Operating System?
Software that manages a computer's hardware resources and provides services so applications can run — it sits between the hardware layer and the software layer.

### Core OS Responsibilities
```
Managing memory (RAM allocation between running programs)
Managing processes (deciding what runs, when, and for how long)
Managing devices (input/output — keyboard, mouse, disk, network)
Providing a user interface (GUI or CLI)
Managing files (creating, storing, organizing, deleting)
```

### GUI vs. CLI
| Interface | Meaning | Trade-off |
|---|---|---|
| GUI (Graphical User Interface) | Visual, point-and-click interaction | Easier to learn, slower for repetitive/bulk tasks |
| CLI (Command Line Interface) | Text-based commands typed directly | Steeper learning curve, faster, scriptable, more precise |

### Why It Matters for Cybersecurity
- Nearly every security tool an analyst touches — SIEMs, packet analyzers, vulnerability scanners — either runs on or is administered through a CLI.
- Understanding what the OS actually manages is what makes concepts like privilege escalation and process injection make sense later.

### Key Takeaway
> The OS isn't just "the thing that boots the computer" — it's the referee between every application and the hardware.
> Every attack that touches a system ultimately has to go through, around, or past the OS's management of memory, processes, and files.

---

## 2. The Linux Operating System

### Why Linux Matters in Cybersecurity
```
Open-source          → source code is publicly available and auditable
Highly customizable    → distributions (distros) tailored to specific needs
Widely used on servers  → most of the internet's backend infrastructure runs Linux
Common in security tools → many SIEM, IDS/IPS, and pentesting tools are Linux-native
```

### Linux Architecture (Layers)
```
Hardware → Kernel → Shell → Applications
```
```
Kernel  → the core of the OS, manages hardware/memory/processes directly
Shell   → the interface (CLI) that lets a user send commands to the kernel
```

### Common Linux Distributions
| Distro | Common Use Case |
|---|---|
| Ubuntu | General-purpose, beginner-friendly |
| Debian | Stability-focused, base for many other distros |
| Kali Linux | Pre-loaded with penetration testing/security tools |
| Red Hat / CentOS | Enterprise servers |
| Parrot OS | Security research, forensics |

### The Shell
The **shell** is the command-line interpreter that takes typed commands and passes them to the kernel to execute. **Bash** (Bourne Again Shell) is the most common shell used in Linux distributions.

### Why It Matters for Cybersecurity
- Security-focused distros like Kali exist specifically because the tooling ecosystem for offensive and defensive security is overwhelmingly Linux-first.
- Being comfortable in *any* distro's shell transfers almost directly to the others — the differences are mostly in package management, not core commands.

### Key Takeaway
> Linux isn't one operating system — it's a family of them sharing the same kernel philosophy.
> Learn the shell, not just a distro; the shell is what stays constant everywhere you go in this field.

---

## 3. Navigating the Linux Filesystem

### The Filesystem Hierarchy
```
/            → root of the entire filesystem
/home        → user directories
/etc         → system configuration files
/var         → variable data (logs, spool files)
/bin, /usr/bin → executable programs
/tmp         → temporary files
/root        → the root user's home directory
```

### Core Navigation Commands
```bash
pwd            # print working directory — where am I right now?
ls             # list files/directories in the current location
ls -l          # long listing — permissions, owner, size, date
ls -a          # show hidden files (dotfiles)
cd <path>      # change directory
cd ..          # move up one level
cd ~           # go to home directory
```

### File and Directory Management
```bash
mkdir <name>       # create a directory
touch <file>       # create an empty file
cp <src> <dest>    # copy a file
mv <src> <dest>    # move or rename a file
rm <file>          # remove a file
rm -r <dir>        # remove a directory and its contents
cat <file>         # print file contents to the terminal
less <file>        # view file contents page by page
```

### Absolute vs. Relative Paths
```
Absolute path → starts from root: /home/user/documents/report.txt
Relative path → starts from current location: documents/report.txt
```

### Why It Matters for Cybersecurity
- Log files, config files, and evidence during an investigation almost always live at predictable filesystem locations (`/var/log`, `/etc`) — knowing the hierarchy speeds up every investigation.
- Confusing absolute and relative paths is a common source of scripting errors, including in automated security tooling.

### Key Takeaway
> The filesystem hierarchy is a map you'll use constantly — `/var/log` alone will become one of the most-visited paths in your career.
> Get comfortable enough that navigating doesn't require conscious thought; it should feel like muscle memory before you move to more advanced commands.

---

## 4. File Permissions and Authorization in Linux

### The Permission Model
```
Every file/directory has three permission sets:
Owner (u) | Group (g) | Others (o)

Each set can have:
r (read) | w (write) | x (execute)
```

### Reading `ls -l` Output
```
-rwxr-xr--  1 user group  1024 Jul 10 12:00 script.sh

-rwx  → owner: read, write, execute
r-x   → group: read, execute
r--   → others: read only
```

### Changing Permissions
```bash
chmod u+x script.sh     # add execute permission for the owner
chmod 755 script.sh     # numeric notation: rwx r-x r-x
chown user:group file   # change file ownership
```

### Numeric Permission Values
```
r = 4 | w = 2 | x = 1
7 = rwx | 6 = rw- | 5 = r-x | 4 = r-- | 0 = ---
```

### Authentication vs. Authorization (Recap in Linux Context)
```
Authentication → proving who you are (login credentials)
Authorization  → what you're allowed to do once logged in (permissions)
```

### User and Group Management
```bash
sudo <command>       # execute a command with elevated (root) privileges
useradd <username>    # create a new user
usermod -aG <group> <user>  # add a user to a group
passwd <username>      # set or change a user's password
```

### Why It Matters for Cybersecurity
- Misconfigured file permissions (world-writable config files, executable scripts owned by the wrong user) are a classic, still-common real-world vulnerability.
- The principle of least privilege is enforced at the OS level exactly through this permission model — understanding `chmod`/`chown` is understanding least privilege in practice, not just theory.

### Key Takeaway
> Every permission bit is a tiny access-control decision, multiplied across every file on the system.
> An attacker doesn't need to break encryption if a critical file was left world-writable — permissions are often the actual front door.

---

## 5. Introduction to Relational Databases

### What Is a Relational Database?
A database that organizes data into **tables** (rows and columns), where relationships between tables are defined through shared keys.

### Core Concepts
```
Table       → a collection of related data, organized in rows and columns
Row (record) → a single entry in a table
Column (field) → a specific attribute/category of data
Primary Key  → a unique identifier for each row in a table
Foreign Key   → a field that references the primary key of another table, creating a relationship
```

### Example Table Structure
| employee_id (PK) | name | department_id (FK) |
|---|---|---|
| 1 | Alice | 10 |
| 2 | Bob | 20 |

### Why Relational Databases Matter in Security
```
Log storage       → SIEM tools often store parsed logs in relational structures
Asset inventories   → tracking devices, owners, and classifications
User/access records  → who has access to what, and when it was granted
```

### Why It Matters for Cybersecurity
- Reading a database schema is a core investigative skill — incident data, user records, and asset inventories are frequently stored relationally.
- Understanding primary/foreign keys is what makes SQL joins make sense instead of feeling like syntax to memorize.

### Key Takeaway
> A relational database is really just several spreadsheets that know how to talk to each other through keys.
> Once you can picture the tables and their relationships, writing the SQL to query them becomes translation, not invention.

---

## 6. Querying Data with SQL

### What Is SQL?
**Structured Query Language** — the standard language used to create, read, update, and delete data in a relational database.

### Core SQL Commands
```sql
SELECT column1, column2 FROM table_name;      -- retrieve specific columns
SELECT * FROM table_name;                     -- retrieve all columns
SELECT * FROM table_name WHERE condition;      -- filter rows
SELECT * FROM table_name ORDER BY column;       -- sort results
SELECT * FROM table_name LIMIT 10;               -- restrict number of rows returned
```

### Filtering with WHERE
```sql
SELECT * FROM logins WHERE username = 'admin';
SELECT * FROM logins WHERE attempt_count > 5;
SELECT * FROM logins WHERE country != 'US';
```

### Combining Conditions
```sql
SELECT * FROM logins WHERE failed = TRUE AND country != 'US';
SELECT * FROM logins WHERE username = 'admin' OR username = 'root';
```

### Joins — Combining Multiple Tables
| Join Type | Behavior |
|---|---|
| INNER JOIN | Returns only rows that match in both tables |
| LEFT JOIN | Returns all rows from the left table, matched rows from the right (NULLs where no match) |
| RIGHT JOIN | Returns all rows from the right table, matched rows from the left |
| FULL JOIN | Returns all rows from both tables, matched or not |

```sql
SELECT users.name, logins.timestamp
FROM users
INNER JOIN logins ON users.user_id = logins.user_id;
```

### Why It Matters for Cybersecurity
- SQL is one of the most directly job-relevant technical skills in this certificate — querying logs, asset databases, and user records is routine SOC work.
- SQL injection (a top-tier real-world web vulnerability) is far easier to understand defensively once you've written legitimate queries yourself.

### Key Takeaway
> SQL turns "I need to find every failed login from outside the US in the last 24 hours" from a manual scroll-through into a single query.
> Fluency here isn't optional for a modern analyst — it's one of the fastest ways to go from raw data to an actual answer.

---

## Quick Reference — Course 4 Cheat Sheet

### OS Core Responsibilities
```
Memory management | Process management | Device management | File management | User interface
```

### Linux Filesystem Hierarchy
```
/ (root) | /home | /etc | /var | /bin | /tmp | /root
```

### Navigation & File Commands
```
pwd | ls | cd | mkdir | touch | cp | mv | rm | cat | less
```

### Permissions
```
r (4) w (2) x (1) — Owner | Group | Others
chmod, chown, sudo, useradd, passwd
```

### Relational Database Concepts
```
Table | Row | Column | Primary Key | Foreign Key
```

### SQL Core Commands
```
SELECT | WHERE | ORDER BY | LIMIT | AND/OR | INNER/LEFT/RIGHT/FULL JOIN
```

---

> **Overall Key Takeaway for Course 4:**
> Course 4 is where the certificate stops being purely conceptual and starts being operational.
> Linux gives you the environment nearly every security tool actually runs in; SQL gives you the language to actually query the data those tools produce.
> Everything from here forward — threat detection, log analysis, automation — assumes you're comfortable typing commands and writing queries, not just reading about them.

---

# Course 5 — Assets, Threats, and Vulnerabilities Notes

---

## 1. Introduction to Asset Security

### What Is an Asset?
Anything of value to an organization that must be protected — including hardware, software, data, and even people/reputation.

### Types of Assets
| Type | Examples |
|---|---|
| Physical | Servers, laptops, badges, network hardware |
| Digital | Databases, source code, customer data, credentials |
| People | Employees, contractors, their knowledge and access |
| Reputation | Brand trust, customer confidence |

### The Asset Lifecycle
```
Procurement → Deployment → Maintenance → Retirement/Disposal
```
Each phase carries its own security responsibility — an asset that's improperly disposed of (e.g., a hard drive with data still on it) is as risky as one that's improperly deployed.

### How Organizations Actually Calculate Risk
```
Likelihood × Impact = Risk
```
The likelihood side is where a security team spends most of its effort — reducing the odds that a threat successfully exploits a vulnerability in the first place, since the impact of a given asset being compromised is often fixed by what that asset already is.

### Threat and Vulnerability Sub-Categories
```
Threats        → Intentional (a malicious hacker) vs. Unintentional (an employee holding a door open)
Vulnerabilities → Technical (misconfigured software) vs. Human (a lost access card)
```

### Why It Matters for Cybersecurity
- You can't protect what you don't know you have — asset inventory is consistently one of the most underrated, highest-leverage security activities.
- Assets aren't just physical objects; data itself is one of the highest-value assets an organization owns.
- Splitting threats and vulnerabilities into these sub-categories is what stops "threat" from meaning only "hacker" — an employee's honest mistake is just as much a threat as a deliberate attacker.

### Key Takeaway
> Security starts with an inventory, not a firewall.
> An organization that doesn't know what it owns has no way of knowing what it's actually protecting — or failing to.
> And risk isn't just "the bad thing that could happen" — it's a product of how likely that thing is and how much it would hurt, which is exactly why security teams spend most of their energy on the likelihood side of the equation.

---

## 2. Classifying and Prioritizing Assets

### Asset Classification Levels
```
Public       → no harm if disclosed (marketing materials)
Internal      → limited harm (internal memos)
Confidential   → serious harm (financial records, employee PII)
Restricted      → severe/catastrophic harm (trade secrets, SPII)
```

### Data Classification Types (Recap + Expansion)
| Type | Meaning |
|---|---|
| PII | Personally Identifiable Information (name, SSN, address) |
| SPII | Sensitive PII (biometric data, health records, financial account numbers) |
| Intellectual Property | Trade secrets, patents, proprietary processes |
| Regulated data | Data governed by law (HIPAA, GDPR, PCI-DSS) |

### Asset Prioritization
```
Criticality  → how essential is this asset to business operations?
Sensitivity   → how much harm results if this asset is exposed/altered/lost?
```

### The CIA Triad Applied to Asset Value
```
An asset's protection level should map to:
- How confidential must it stay?
- How intact/accurate must it remain?
- How available must it be?
```

### Why It Matters for Cybersecurity
- Not every asset deserves the same level of protection — treating a public marketing PDF the same as a customer database wastes security budget and attention.
- Real-world security spending decisions are justified almost entirely through this classification-and-prioritization process.

### Key Takeaway
> Classification isn't bureaucracy — it's triage.
> The whole point is to know, before an incident happens, which assets are worth fighting hardest for.

---

## 3. Understanding the Attack Surface

### What Is an Attack Surface?
All the possible points (physical and digital) where an unauthorized user could try to enter or extract data from an environment.

### Common Attack Surface Components
```
Network-facing services  → open ports, exposed APIs
Applications                → web apps, mobile apps
Endpoints                    → laptops, phones, IoT devices
Human factors                  → employees susceptible to social engineering
Physical access                  → unsecured entry points, unattended devices
Third-party/vendor access          → supply chain connections
```

### Reducing the Attack Surface
```
Minimize unnecessary services and open ports
Apply the principle of least privilege
Patch and update regularly
Segment networks
Train employees against social engineering
```

### Why It Matters for Cybersecurity
- Every new device, application, or integration an organization adds expands the attack surface — growth and risk increase together unless deliberately managed.
- Attack surface analysis is a foundational step before any penetration test or security assessment — you can't test what you haven't mapped.

### Key Takeaway
> The attack surface is every door, window, and unlocked drawer an organization has — most of them installed for convenience, not defense.
> Reducing it isn't about eliminating functionality; it's about eliminating the *unnecessary* parts of that functionality.

---

## 4. Threat Actors and Their Motivations

### Threat Actor Types (Recap + Expansion)
| Actor | Motivation | Typical Sophistication |
|---|---|---|
| Advanced Persistent Threats (APTs) | State-sponsored, long-term espionage | Very high |
| Insider Threats | Malicious or negligent employees/contractors | Varies — high access, low-to-high skill |
| Hacktivists | Political/social causes | Moderate |
| Script Kiddies | Curiosity, notoriety, low skill | Low — relies on pre-built tools |
| Organized Crime | Financial gain (ransomware, fraud) | High |
| Competitors | Corporate/industrial espionage | Varies |

### Insider Threats — A Closer Look
```
Malicious insider   → intentionally misuses access (theft, sabotage)
Negligent insider    → unintentionally causes harm (misconfiguration, falling for phishing)
Compromised insider   → legitimate credentials stolen and used by an external attacker
```

### Why It Matters for Cybersecurity
- Different threat actors require fundamentally different defensive priorities — hardening against a script kiddie looks nothing like hardening against an APT.
- Insider threats are consistently underestimated despite being responsible for a large share of real breaches, since insiders already bypass perimeter defenses by having legitimate access.

### Key Takeaway
> Not every attacker looks the same, and treating them all identically wastes limited defensive resources.
> Knowing *who* is likely to target you is just as important as knowing *how* they'd do it.

---

## 5. Social Engineering — Attacking the Human Layer

### Core Social Engineering Techniques (Recap + Expansion)
```
Phishing         → fraudulent messages tricking users into revealing info
Spear phishing     → targeted at a specific person/org
Whaling             → targeted at executives
Smishing              → phishing via SMS
Vishing                → phishing via voice call
Pretexting               → inventing a false scenario to manipulate a target
Baiting                    → luring victims with something enticing (USB drops, downloads)
Quid pro quo                → offering a service/benefit in exchange for info or access
Tailgating/Piggybacking       → following an authorized person into a restricted area
Watering hole attacks           → compromising a site the target is known to visit
```

### Why Social Engineering Works
```
Exploits trust, urgency, fear, curiosity, and authority — not technical flaws
Bypasses technical controls entirely by targeting the human decision-maker directly
```

### Why It Matters for Cybersecurity
- Social engineering remains the single most common initial access vector across real-world breaches — no firewall stops a convincing phone call.
- Recognizing the psychological lever being pulled (urgency, authority, fear) is often a faster tell than recognizing the specific attack type by name.

### Key Takeaway
> Every social engineering technique is really the same attack wearing a different costume: manipulate a human into doing something they otherwise wouldn't.
> Technology can filter emails; only awareness and healthy skepticism stop the ones that get through.

---

## 6. Malware and Web-Based Exploits

### Malware Types (Recap + Expansion)
| Type | Behavior |
|---|---|
| Virus | Attaches to files, spreads when executed |
| Worm | Self-replicates across networks, no user action needed |
| Ransomware | Encrypts data, demands payment |
| Spyware | Secretly monitors user activity |
| Trojan | Disguises as legitimate software |
| Rootkit | Grants privileged access while hiding its presence |
| Keylogger | Records keystrokes to capture credentials |
| Adware | Displays unwanted advertising, often bundled with other malware |

### Common Web-Based Exploits
```
SQL Injection (SQLi)      → malicious SQL inserted into input fields to manipulate a database
Cross-Site Scripting (XSS)  → injecting malicious scripts into trusted web pages
Cross-Site Request Forgery (CSRF) → tricking an authenticated user's browser into making unwanted requests
Remote Code Execution (RCE)   → allows an attacker to run arbitrary code on a target system
Buffer Overflow                 → writing more data to memory than allocated, corrupting adjacent memory
```

### The OWASP Top 10 (Recap in This Context)
The OWASP Top 10 is the industry-standard reference for the most critical web application security risks (injection, broken authentication, security misconfiguration, and others) — it's a primary source for prioritizing which web vulnerabilities matter most.

### Why It Matters for Cybersecurity
- Malware and web exploits are the two categories analysts triage most frequently — recognizing behavior patterns (not just signatures) is what catches novel variants.
- Web-based exploits specifically are why input validation and secure coding practices (Course 1's Software Development Security domain) exist in the first place.

### Key Takeaway
> Malware attacks the system; web exploits attack the application logic sitting on top of it.
> Both ultimately chase the same goal — unauthorized access, data theft, or disruption — just through different doors.

---

## 7. Introduction to Threat Modeling

### What Is Threat Modeling?
The process of identifying, evaluating, and prioritizing potential threats to a system, so defenses can be designed proactively rather than reactively.

### The Threat Modeling Process (General Steps)
```
1. Define the scope       → what system/application are we analyzing?
2. Identify assets          → what needs protecting within that scope?
3. Identify threats           → what could go wrong? (use a framework, e.g., STRIDE)
4. Identify vulnerabilities     → where are the actual weaknesses?
5. Prioritize                     → which threats pose the greatest risk?
6. Mitigate                          → design/implement controls to address top risks
```

### STRIDE Threat Categories
| Letter | Threat Category | Violates |
|---|---|---|
| S | Spoofing | Authentication |
| T | Tampering | Integrity |
| R | Repudiation | Non-repudiation (accountability) |
| I | Information Disclosure | Confidentiality |
| D | Denial of Service | Availability |
| E | Elevation of Privilege | Authorization |

### The MITRE ATT&CK Framework
A publicly available, continuously updated knowledge base of real-world adversary tactics and techniques, organized by attack lifecycle stage (reconnaissance, initial access, execution, persistence, etc.). Widely used to map detected activity to known attacker behavior patterns.

### Why It Matters for Cybersecurity
- Threat modeling is what shifts security from "wait for an incident, then respond" to "design the system assuming an attacker is already thinking about it."
- MITRE ATT&CK is referenced constantly in real SOC work — mapping an alert to a specific ATT&CK technique is standard practice for structured incident analysis.

### Key Takeaway
> Threat modeling asks "what could go wrong here, on purpose, before it does" — instead of learning the answer from an incident report.
> STRIDE gives you the categories; MITRE ATT&CK gives you the real-world examples of how each category actually plays out.

---

## Quick Reference — Course 5 Cheat Sheet

### Asset Classification Levels
```
Public | Internal | Confidential | Restricted
```

### Attack Surface Components
```
Network-facing services | Applications | Endpoints | Human factors | Physical access | Third-party access
```

### Threat Actor Types
```
APTs | Insider Threats | Hacktivists | Script Kiddies | Organized Crime | Competitors
```

### Social Engineering Techniques
```
Phishing | Spear phishing | Whaling | Smishing | Vishing | Pretexting | Baiting | Tailgating
```

### Malware Types
```
Virus | Worm | Ransomware | Spyware | Trojan | Rootkit | Keylogger | Adware
```

### Web-Based Exploits
```
SQL Injection | XSS | CSRF | RCE | Buffer Overflow
```

### STRIDE Threat Model
```
Spoofing | Tampering | Repudiation | Information Disclosure | Denial of Service | Elevation of Privilege
```

---

> **Overall Key Takeaway for Course 5:**
> Course 5 connects everything before it into one working question: *what exactly are we protecting, from whom, and how would they actually get to it?*
> Asset classification tells you what matters. Attack surface analysis tells you where the doors are. Threat actors and social engineering tell you who's likely to walk through them and how.
> Threat modeling — STRIDE and MITRE ATT&CK — is where all of that becomes a proactive plan instead of a reactive one.
> Combined with Course 4's Linux and SQL skills, this is the point where the certificate stops teaching *concepts* and starts teaching *analysis*.
