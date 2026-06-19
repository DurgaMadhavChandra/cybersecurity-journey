# Week 03 — Errors & Struggles

This week was all Linux — history, the command line, permissions, processes,
networking, cron, restricted shells, Git. More moving parts than any week so
far, which also means more ways to get something wrong. Documenting all of it
below, exactly as it happened.

---

## Struggle 1: SSH Refused My Own Key — "Permissions Too Open"

### The Problem

I generated a key pair to practice SSH key-based login and tried to connect:

```bash
ssh -i key.pem user@192.168.1.5
```

Instead of logging in, I got hit with this:

```
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@         WARNING: UNPROTECTED PRIVATE KEY FILE!          @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
Permissions 0644 for 'key.pem' are too open.
It is required that your private key files are NOT accessible by others.
```

My first reaction was — the key is fine, why is SSH being dramatic about it.

### My Debugging Process

I ran `ls -la key.pem` and saw:

```
-rw-r--r-- 1 madhav madhav 1823 Jun 17 key.pem
```

`rw-r--r--` means the owner can read/write, but the group and everyone else
can read it too. I went back to the permissions notes from this week and
realized SSH isn't being picky for no reason — a private key readable by
anyone on the system defeats the entire point of having a "private" key.

I checked what permission SSH actually expects, and it wants the key
restricted to the owner only — nobody else, not even the same group.

### The Fix

```bash
chmod 600 key.pem
ssh -i key.pem user@192.168.1.5
```

Connected instantly. No code changed — only the permission bits did.

**My Observation:**
This was the first time a permission number actually blocked something
real instead of being a quiz question. In cybersecurity, leaked or
world-readable private keys are a top initial-access vector — entire
breaches have started with a `.pem` file left at `644` in a public repo
or a misconfigured server. SSH refusing to even try the key isn't
annoying — it's the system protecting me from myself.

---

## Struggle 2: I Typed One Wrong `chmod` Command... and Suddenly Nothing Worked Anymore

### The Problem

Before this week, I thought Linux permissions were just a checkbox topic —
read, write, execute, simple enough. Then I ran `chmod 777` on a system file
just to "fix" a permission error I didn't understand. Instantly, things
broke. Scripts stopped running. SSH refused to connect. The system didn't
trust me anymore — and honestly, it had every right not to.

I had handed full control of a critical file to literally everyone. That's
not a fix. That's a security disaster.

### My Debugging Process

I had to stop and actually understand what I was typing instead of copying
commands from random search results.

```bash
ls -la
```

showed me the permission bits I had been ignoring for days. I went through
this week's notes on what each `rwx` actually means for files versus
directories, and learned `umask` controls the default permissions for every
new file I create. I also looked at `setuid` and the sticky bit again —
not advanced trivia, but what keeps shared Linux systems from descending
into chaos.

The moment that actually changed my thinking was realizing root isn't just
a "more powerful user." Root is a completely separate trust model. Every
time I casually typed `sudo`, I was borrowing that trust without fully
understanding the responsibility that comes with it.

### The Fix

I stopped reaching for `chmod 777` as a shortcut and started reading the
actual error messages instead. Nine times out of ten, the problem wasn't
the permission level at all — it was me not understanding who owned the
file and why.

```bash
ls -la file
chown correct_owner:correct_group file
chmod 644 file        # only what's actually needed
```

Once I understood users, groups, and the `/etc/passwd` structure,
permissions stopped feeling like random number combinations and started
feeling like a deliberate security design.

**My Observation:**
Linux doesn't hide things from you out of stubbornness. It hides things
because security is intentional. Every permission, every file owner, every
sticky bit exists because someone thought carefully about who should be
allowed to do what.

---

## Struggle 3: My grep Regex Matched Way Too Much

### The Problem

I was trying to pull IP addresses out of a sample access log using regex
I'd just learned:

```bash
grep -E "[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}" access.log
```

It "worked" — but it also matched garbage lines that had no IP at all,
and some matches looked like `192x168y1z1` style nonsense pulled out of
unrelated text. I assumed regex was just unreliable.

### My Debugging Process

I went back to the regex table from this week's notes:

```
.   → any single character
\.  → a literal dot
```

That was the bug. I had written `.` to mean "a dot," but in regex `.`
means "any character at all." So my pattern was really saying
"3 digits, any character, 3 digits, any character..." which happily
matched things like `192x168y1z1` because `x`, `y`, and `z` are all valid
matches for "any character."

I tested it manually on Regex101-style logic in my head with a small
example string: `192a168b1c1` — and confirmed it matched, which proved
the dots were never being treated as literal dots.

### The Fix

```bash
grep -E "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" access.log
```

Escaping the dots with `\.` made the pattern match actual IP-shaped text
only.

**My Observation:**
A single unescaped character changed what my filter actually meant,
without throwing any error. In log analysis and threat hunting this is
dangerous in both directions — too loose and you drown in false positives,
too strict and you silently miss the real indicator of compromise sitting
right there in the log.

---

## Struggle 4: My Cron Job Worked Manually but Did Nothing on Schedule

### The Problem

I wrote a small script and tested it directly — worked perfectly:

```bash
./monitor.sh
```

Then I scheduled it with cron to run every 5 minutes:

```bash
*/5 * * * * /home/madhav/monitor.sh
```

I waited. Nothing happened. No output file, no errors, no sign it ever ran
at all.

### My Debugging Process

I checked `crontab -l` to confirm the job was actually registered — it was.
So the job existed but produced nothing. I added logging to capture
whatever cron was seeing:

```bash
*/5 * * * * /home/madhav/monitor.sh >> /home/madhav/cron.log 2>&1
```

A few minutes later the log finally had something:

```
monitor.sh: line 4: nmap: command not found
```

That was the answer. When I run the script myself in my interactive shell,
my full `$PATH` is loaded from `.bashrc`. Cron runs with a tiny, minimal
environment that doesn't know where `nmap`, or sometimes even basic tools,
actually live.

### The Fix

```bash
#!/bin/bash
NMAP=/usr/bin/nmap
$NMAP -sV 192.168.1.0/24 >> /home/madhav/scan.log
```

Using full, absolute paths inside the script instead of relying on
`$PATH` made the cron job behave identically to running it by hand.

**My Observation:**
This was a perfect example of a "silent failure" — exactly the kind of
bug I struggled with back in Week 1 with my stack overflow function. Cron
misconfiguration is also a real privilege-escalation angle: a root cron
job calling a script by relative path, in a writable directory, is a
classic way attackers hijack scheduled tasks to run their own code as
root instead.

---

## Struggle 5: My Bash Script Crashed With "Unary Operator Expected"

### The Problem

I wrote a simple script to classify a number passed in as an argument:

```bash
#!/bin/bash
if [ $1 -gt 100 ]; then
    echo "Big number"
else
    echo "Small number"
fi
```

Running it with an argument worked fine. Running it with no argument at
all blew up:

```
./check.sh: line 2: [: -gt: unary operator expected
```

### My Debugging Process

I traced through what the shell actually does before the comparison runs.
When I call the script with no arguments, `$1` is empty. The line
`[ $1 -gt 100 ]` doesn't become `[ "" -gt 100 ]` — it becomes:

```bash
[ -gt 100 ]
```

The empty value just disappears, leaving `-gt` sitting where a number
should be, which the `test` command can't parse. This is the bash
equivalent of the off-by-one bug I hit with binary search back in Week 1 —
a value I assumed would always be there simply wasn't, and the program
had no idea how to handle that gap.

### The Fix

```bash
#!/bin/bash
if [ -z "$1" ]; then
    echo "Usage: $0 <number>"
    exit 1
fi

if [ "$1" -gt 100 ]; then
    echo "Big number"
else
    echo "Small number"
fi
```

Quoting `"$1"` and checking for an empty argument with `-z` before
comparing it fixed both the crash and the silent bad behavior.

**My Observation:**
Unquoted variables in bash are the C of shell scripting — they look
harmless until an edge case (empty input, spaces, special characters)
breaks everything. Plenty of real-world shell script vulnerabilities,
including command injection through unsanitized arguments, come from
exactly this habit of trusting `$1` without checking it first.

---

## Struggle 6: I Got Stuck in a Restricted Shell During Bandit

### The Problem

While working through OverTheWire Bandit, I landed on a level where the
shell felt different — half my usual commands either didn't exist or got
rejected outright. No `cd`, no piping, barely anything worked. I assumed
I'd broken my terminal.

### My Debugging Process

I checked `echo $SHELL` and a few basic commands and realized this wasn't
broken — it was intentional. I was inside a restricted shell, designed to
box users into a very small set of allowed commands.

I went back to this week's notes on restricted shells and GTFOBins and
remembered binaries with extra privileges or interactive sub-shells can be
abused to break out. I checked what was actually available to me and
found `vim` was reachable.

```bash
vim
:set shell=/bin/bash
:shell
```

### The Fix

Dropping into `vim` and spawning a real shell from inside it bypassed the
restricted shell entirely and gave me a normal, fully-featured prompt to
keep working from.

**My Observation:**
Restricted shells are a textbook example of why understanding the
*intent* behind a security control matters more than memorizing it. The
restriction wasn't a bug to "fix" — it was a deliberate boundary, and the
entire skill of breaking out of one is really just knowing which trusted
binaries quietly carry more power than the boundary intended them to.

---

## Week 3 Reflection on Struggles

Looking back, almost every struggle this week traced back to the same
idea: a boundary I didn't fully respect or understand yet. The SSH key
permission, the `chmod 777` mistake, the regex that matched too much, the
cron job missing its environment, the unguarded `$1`, the restricted
shell — all of them were really about trust. Who is allowed to read this.
What is this command actually allowed to assume. What happens at the edge
where my assumption stops being true.

Linux this week didn't feel like learning commands. It felt like learning
where the walls are, why someone built them, and what happens the moment
I forget they're there. That's the same instinct offensive security runs
on — every privilege escalation, every restricted-shell escape, every
SUID exploit is just someone finding the one wall that was built slightly
wrong, or not at all.

I didn't just get more comfortable with the terminal this week. I started
seeing every permission bit and every boundary as a decision someone made
on purpose — and learned to ask why before I tried to undo it. 
