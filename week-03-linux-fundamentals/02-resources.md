# Week 03 — Resources

This is everything I used this week to learn Linux Fundamentals.
I'm documenting this so anyone starting from scratch can follow the same path.
Linux is not optional in cybersecurity — it is the environment where everything happens.
These resources helped me go from zero to genuinely comfortable in the terminal.

---

## The Resources That Shaped This Week

I was nervous about the command line at the start of this week.
Then I found the right resources and everything clicked.

What made the difference was not just reading — it was practicing live in a real terminal.
The moment I stopped reading about commands and started typing them, Linux stopped being scary.

---

## Core Resources I Used This Week

| Resource | Link | Type |
|----------|------|------|
| Linux Command Line Basics — Ubuntu | [ubuntu.com](https://ubuntu.com/tutorials/command-line-for-beginners#1-overview) | Official Tutorial — Free |
| Linux Survival | [linuxsurvival.com](https://linuxsurvival.com) | Browser Practice — Free |
| Linux From Scratch | [linuxfromscratch.org](https://www.linuxfromscratch.org) | Deep Reference — Free |
| Linux Journey — Grasshopper | [linuxjourney.com](https://linuxjourney.com) | Guided Course — Free |
| Linux Zero to Hero — Abhishek Veeramalla | [YouTube Playlist](https://youtube.com/playlist?list=PLdpzxOOAlwvIBIRWcReRV-m2kgIW6V6gr) | Video Course — Free |
| OverTheWire: Bandit | [overthewire.org](https://overthewire.org/wargames/bandit/) | Hands-on Wargame — Free |

---

## Hands-On Practice — Setting Up My Own Lab

This was the part of the week I am most proud of.
I didn't just follow tutorials — I set up a real environment and practiced everything myself.

I installed **Kali Linux** on a virtual machine and used it as my primary practice environment
for the entire week. Every command from the notes was typed here, not just read.

### What I Set Up
| Step | What I Did |
|------|-----------|
| Hypervisor | Installed VirtualBox / VMware on my host machine |
| ISO | Downloaded the official Kali Linux ISO from kali.org |
| VM Config | Allocated RAM, storage, and configured network adapter |
| First Boot | Completed Kali setup and updated all packages with `apt update && apt upgrade` |
| Practice | Ran every command from this week's notes inside the VM |

### What I Practiced Hands-On
- Navigated the full Kali filesystem from the terminal
- Created users, set passwords, and managed groups
- Applied `chmod` and `chown` on real files and observed the changes
- Wrote and executed my first bash scripts
- Used `grep`, `cut`, and `awk` to parse real log files
- Ran `nmap` scans against my own network
- Set up a Netcat listener and connected to it from another terminal
- Searched for SUID binaries using `find`

### Why This Mattered
Reading about Linux and using Linux are two completely different things.
The VM gave me a safe space to break things, fix them, and break them again.
Every mistake I made in the VM taught me more than any tutorial could.
Kali Linux also comes pre-loaded with the exact tools used in real security work —
so I was practicing in the same environment professionals use on the job.

---

## Topic-wise Resources

### 1. Command Line & Navigation

This is where I spent the most time at the start of the week.
I kept confusing `cd` paths and getting lost in the filesystem.
The Ubuntu tutorial was the first thing that made it all feel structured.
After finishing it I could navigate any Linux system without thinking.

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| Linux Command Line Basics — Ubuntu | [Read](https://ubuntu.com/tutorials/command-line-for-beginners#1-overview) | Must Read | Official, clear, and beginner-friendly |
| Linux Journey — Grasshopper | [Visit](https://linuxjourney.com) | Must Try | Taught navigation with quizzes after each concept |
| Linux Survival | [Practice](https://linuxsurvival.com) | Must Try | Typed real commands in a simulated terminal |

**Real World Connection:**
Every penetration test and every incident response starts with someone
navigating a Linux filesystem from the command line.
Knowing `find`, `ls -la`, and `cat` fluently is not optional —
it is the bare minimum every security professional needs on day one.

---

### 2. Permissions, Users & Processes

This was my favourite section of the week.
I never fully understood why file permissions mattered until I saw
how SUID files can be abused to escalate privileges.
That one moment connected the theory directly to real attacks.

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| Linux Journey — Grasshopper | [Visit](https://linuxjourney.com) | Must Read | Best explanation of chmod and users I found |
| Linux Command Line Basics — Ubuntu | [Read](https://ubuntu.com/tutorials/command-line-for-beginners#1-overview) | Recommended | Covered users and groups with clear examples |
| Linux From Scratch | [Read](https://www.linuxfromscratch.org) | Good | Helped me understand how the OS sets permissions from scratch |

**Real World Connection:**
Misconfigured permissions are one of the top privilege escalation vectors on Linux.
A single SUID binary left misconfigured can give an attacker root access.
Understanding `chmod`, `chown`, and `umask` is not just admin knowledge —
it is core offensive and defensive security knowledge.

---

### 3. Text Manipulation & Shell Scripting

This section surprised me the most.
I didn't expect `grep`, `cut`, and pipes to feel this powerful.
Once I started chaining commands together the terminal felt like a programming language by itself.
Writing my first bash script that actually did something useful was a genuinely exciting moment.

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| Linux Journey — Grasshopper | [Visit](https://linuxjourney.com) | Must Read | Explained pipes and text tools step by step |
| Linux Survival | [Practice](https://linuxsurvival.com) | Must Try | Let me practice grep and sort hands-on |
| Linux From Scratch | [Read](https://www.linuxfromscratch.org) | Good | Showed how scripting fits into real system builds |

**Real World Connection:**
Security analysts parse thousands of log lines every day using `grep`, `awk`, and `sed`.
A one-liner that extracts all failed SSH login IPs from a log file
is something every blue teamer needs to write without thinking.
These tools are the difference between manual investigation and instant answers.

---

### 4. Networking & Advanced Shell

This was the hardest section of the week.
Netcat confused me at first — I kept asking why not just use a browser.
Then I used it to set up a listener and catch a reverse shell and everything changed.
Nmap felt like a superpower the first time I ran it against my own lab network.

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| Linux Journey — Grasshopper | [Visit](https://linuxjourney.com) | Recommended | Good intro to networking concepts on Linux |
| Linux Command Line Basics — Ubuntu | [Read](https://ubuntu.com/tutorials/command-line-for-beginners#1-overview) | Good | Covered SSH setup clearly |
| Linux From Scratch | [Read](https://www.linuxfromscratch.org) | Good | Helped understand how networking tools are built into the OS |

**Real World Connection:**
Nmap, Netcat, and SSH are in every single penetration tester's toolkit.
Nmap is the first tool fired in every recon phase.
Netcat is how reverse shells are caught and how files are transferred mid-engagement.
SSH key misconfigurations are a real-world attack vector found regularly in bug bounties.
This section was where the week felt most directly tied to real security work.

---

### 5. Shell Scripting — Linux Zero to Hero by Abhishek Veeramalla

This playlist was the resource that tied everything together for me this week.
I had picked up individual commands but I didn't know how to combine them into something useful.
Watching Abhishek build real scripts from scratch — explaining every line as he went —
was exactly the format I needed to make scripting finally click.
The 13-video series covers Linux broadly but the shell scripting episodes were the highlight.

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| Linux Zero to Hero — Abhishek Veeramalla | [Watch](https://youtube.com/playlist?list=PLdpzxOOAlwvIBIRWcReRV-m2kgIW6V6gr) | Must Watch | Best free video series I found for Linux + bash scripting |

**Real World Connection:**
Bash scripting is how security professionals automate the work that would take hours manually.
Log parsing, port scanning, user enumeration, backup automation — all of it gets scripted.
Every DevOps and security engineer writes bash daily.
This playlist gave me the confidence to start writing scripts that actually do real things.

---

### 6. OverTheWire: Bandit — Putting It All Into Practice

This was the most important part of the week.
Reading and watching only takes you so far — Bandit is where I found out what I actually knew.
Every level threw a real challenge at me and I had to use the commands I had been studying.
Getting stuck on a level and then solving it was more satisfying than finishing any tutorial.

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| OverTheWire: Bandit | [Play](https://overthewire.org/wargames/bandit/) | Must Do | Applied every concept learned in a real SSH environment |

**Real World Connection:**
Bandit is structured exactly like a real post-exploitation scenario.
You SSH into a machine, find files, read permissions, decode strings, and escalate level by level.
Every skill from this week — `find`, `grep`, `cat`, `chmod`, Base64, SSH — gets used here.
If you want to know whether your Linux fundamentals are solid, Bandit will tell you honestly.

---

## Tools & Platforms I Used This Week

| Tool | Purpose | Link |
|------|---------|------|
| Linux Journey | Guided lessons with quizzes after each concept | [linuxjourney.com](https://linuxjourney.com) |
| Linux Survival | Practiced commands in a browser-based terminal | [linuxsurvival.com](https://linuxsurvival.com) |
| Ubuntu Tutorial | Followed the official beginner command line guide | [ubuntu.com](https://ubuntu.com/tutorials/command-line-for-beginners) |
| Linux From Scratch | Used as a deep reference for how Linux works underneath | [linuxfromscratch.org](https://www.linuxfromscratch.org) |
| Linux Zero to Hero | Watched for Linux fundamentals and bash scripting | [YouTube](https://youtube.com/playlist?list=PLdpzxOOAlwvIBIRWcReRV-m2kgIW6V6gr) |
| OverTheWire: Bandit | Applied everything learned in real CTF challenges | [overthewire.org/wargames/bandit](https://overthewire.org/wargames/bandit/) |
| GTFOBins | Referenced for shell escapes and SUID exploitation | [gtfobins.github.io](https://gtfobins.github.io) |

---

## My Honest Rating of This Week

| Topic | Difficulty | My Experience |
|-------|------------|---------------|
| Command Line & Navigation | Easy | Clicked fast — practice made it feel natural |
| Text Manipulation | Medium | Surprisingly powerful once I started chaining commands |
| Permissions & Users | Medium | Made sense after I connected it to privilege escalation |
| Processes & Cron | Medium | Interesting — cron misconfigs were an eye-opener |
| Networking & Netcat | Hard | Confusing at first but the most exciting when it worked |
| Shell Escapes & SUID | Hard | Challenging — but the most directly useful for CTFs |

---

## My Recommendation to Anyone Starting Linux

Start with **Linux Journey Grasshopper** — it is the most beginner-friendly structured path.
Then move to **Linux Survival** to practice what you learned in a real terminal without setup.
Watch **Linux Zero to Hero by Abhishek Veeramalla** when you are ready to write real scripts —
it is the clearest free video resource I found for bash scripting and Linux fundamentals together.
Use **OverTheWire Bandit** from day one — even Level 0 will teach you something.
Don't just read. Type every command. Break things. Fix them.

Linux does not become comfortable from reading about it.
It becomes comfortable from living inside it.
This week I stopped fearing the terminal and started enjoying it.
That shift changes everything.
