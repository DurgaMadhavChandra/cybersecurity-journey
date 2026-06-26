# Week 03 — Linux Fundamentals Notes

---

## 1. Getting Started — Linux History & Choosing a Distro

### What is Linux?
An open-source, Unix-like operating system kernel created by Linus Torvalds in 1991.
Powers everything from phones and servers to supercomputers and hacking labs.

### Key Milestones
| Year | Event |
|------|-------|
| 1969 | Unix created at Bell Labs |
| 1983 | GNU Project launched by Richard Stallman |
| 1991 | Linux kernel released by Linus Torvalds |
| 1994 | Linux kernel v1.0 released |
| 2004 | Ubuntu released — Linux for everyone |

### Choosing a Distro
| Distro | Best For |
|--------|----------|
| Ubuntu | Beginners, general use |
| Kali Linux | Penetration testing, cybersecurity |
| Parrot OS | Privacy + security |
| Arch Linux | Advanced users, full control |
| Debian | Stability, servers |

### Key Takeaway
> Linux is not just an OS — it is the foundation of the cybersecurity world.
> Learn it deeply and everything else becomes easier.

---

## 2. Command Line — Shell, Navigation & Essential Commands

### What is the Shell?
An interface that accepts text commands and passes them to the OS kernel.
The most common shell is **Bash** (Bourne Again SHell).

### Filesystem Navigation
```bash
pwd          # Print current directory
ls           # List files
ls -la       # List all files including hidden, with details
cd /etc      # Change to /etc directory
cd ..        # Go one level up
cd ~         # Go to home directory
```

### Essential Commands
| Command | Purpose | Example |
|---------|---------|---------|
| `ls` | List directory contents | `ls -la` |
| `cd` | Change directory | `cd /var/log` |
| `pwd` | Print working directory | `pwd` |
| `find` | Search for files | `find / -name "*.txt"` |
| `man` | Read manual page | `man ls` |
| `alias` | Create command shortcut | `alias ll='ls -la'` |
| `echo` | Print text to terminal | `echo "hello"` |
| `cat` | Display file contents | `cat /etc/passwd` |
| `history` | Show command history | `history` |

### The `find` Command
```bash
find / -name "passwords.txt"       # Find by name
find /home -type f -name "*.sh"    # Find shell scripts
find / -perm -4000 2>/dev/null     # Find SUID files
```

### Aliases
```bash
alias ll='ls -la'
alias ..='cd ..'
alias cls='clear'
```
Add to `~/.bashrc` to make them permanent.

### Why It Matters for Cybersecurity
- Navigate target systems confidently post-exploitation
- Find sensitive files using `find` and `locate`
- Create aliases to speed up repetitive tasks

### Key Takeaway
> The command line is your most powerful tool.
> Master navigation before anything else.

---

## 3. Text Manipulation — Pipes, grep, sort, cut, tr, uniq

### The Pipe Operator `|`
Sends the output of one command as input to the next.
```bash
cat /etc/passwd | grep "root"
ls -la | sort | head -10
```

### Core Text Tools
| Tool | Purpose | Example |
|------|---------|---------|
| `grep` | Search for patterns | `grep "error" log.txt` |
| `sort` | Sort lines | `sort names.txt` |
| `cut` | Extract columns | `cut -d':' -f1 /etc/passwd` |
| `tr` | Translate/replace characters | `echo "hello" \| tr 'a-z' 'A-Z'` |
| `uniq` | Remove duplicate lines | `sort file.txt \| uniq` |
| `wc` | Count words/lines/characters | `wc -l file.txt` |
| `awk` | Pattern scanning and processing | `awk -F':' '{print $1}' /etc/passwd` |
| `sed` | Stream editor, find and replace | `sed 's/old/new/g' file.txt` |

### Practical Examples
```bash
# Get all usernames from /etc/passwd
cut -d':' -f1 /etc/passwd

# Count failed SSH logins
grep "Failed password" /var/log/auth.log | wc -l

# Find unique IPs in a log
grep -oE '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' access.log | sort | uniq -c | sort -rn
```

### Why It Matters for Cybersecurity
- Parse and analyze log files quickly
- Extract usernames, IPs, and credentials from dumps
- Automate threat hunting with chained commands

### Key Takeaway
> Piping commands together is how analysts process data at scale
> without writing a single line of code.

---

## 4. Text Editors — Vim, Emacs & Regex

### Vim Basics
Modal editor — operates in different modes.

| Mode | How to Enter | Purpose |
|------|-------------|---------|
| Normal | `Esc` | Navigate, delete, copy |
| Insert | `i` | Type text |
| Visual | `v` | Select text |
| Command | `:` | Save, quit, search |

```bash
vim file.txt      # Open file
i                 # Enter insert mode
Esc               # Return to normal mode
:w                # Save
:q                # Quit
:wq               # Save and quit
:q!               # Quit without saving
/pattern          # Search forward
dd                # Delete current line
yy                # Copy (yank) line
p                 # Paste
```

### Emacs Basics
```bash
Ctrl+x Ctrl+f     # Open file
Ctrl+x Ctrl+s     # Save
Ctrl+x Ctrl+c     # Exit
Ctrl+s            # Search
```

### Regular Expressions (Regex)
| Pattern | Matches |
|---------|---------|
| `.` | Any single character |
| `*` | Zero or more of previous |
| `+` | One or more of previous |
| `^` | Start of line |
| `$` | End of line |
| `[abc]` | Any of a, b, c |
| `\d` | Any digit |
| `\w` | Any word character |

```bash
grep -E "^root" /etc/passwd          # Lines starting with root
grep -E "[0-9]{1,3}\.[0-9]{1,3}" file  # Match IP-like pattern
```

### Why It Matters for Cybersecurity
- Edit config files on remote servers (no GUI available)
- Use regex to parse logs, find patterns, detect anomalies
- Vim is available on virtually every Linux system

### Key Takeaway
> You will almost always have Vim available on a compromised or remote system.
> Learn at least the basics — it can be the difference between success and failure.

---

## 5. User Management — Users, Groups, Root & /etc/passwd

### Key Files
| File | Purpose |
|------|---------|
| `/etc/passwd` | User account information |
| `/etc/shadow` | Encrypted passwords |
| `/etc/group` | Group information |

### /etc/passwd Format
```
username:password:UID:GID:comment:home:shell
root:x:0:0:root:/root:/bin/bash
```

### User Management Commands
```bash
useradd username          # Create new user
passwd username           # Set password
usermod -aG sudo username # Add user to sudo group
userdel username          # Delete user
id username               # Show user ID and groups
whoami                    # Show current user
su username               # Switch to another user
sudo command              # Run command as root
```

### Groups
```bash
groupadd devteam          # Create group
usermod -aG devteam alice # Add alice to devteam
groups alice              # Show alice's groups
```

### Root vs Regular Users
| Feature | Root | Regular User |
|---------|------|--------------|
| UID | 0 | 1000+ |
| Access | Full system | Limited |
| Symbol | `#` prompt | `$` prompt |
| Risks | High | Low |

### Why It Matters for Cybersecurity
- Privilege escalation → find misconfigured sudo or SUID
- Enumerate users from `/etc/passwd` post-exploitation
- Understand who has root access on a target system

### Key Takeaway
> Always understand who the users are and what privileges they hold —
> that map is your path to escalation.

---

## 6. Permissions — chmod, chown, umask, setuid, Sticky Bit

### Permission Structure
```
-rwxr-xr--  1  owner  group  size  date  filename
```

| Symbol | Meaning |
|--------|---------|
| `-` | Regular file |
| `d` | Directory |
| `r` | Read (4) |
| `w` | Write (2) |
| `x` | Execute (1) |

### chmod — Change Permissions
```bash
chmod 755 file.sh          # rwxr-xr-x
chmod 644 file.txt         # rw-r--r--
chmod +x script.sh         # Add execute
chmod -w file.txt          # Remove write
chmod u+x,g-w file.sh     # User add execute, group remove write
```

### chown — Change Ownership
```bash
chown alice file.txt          # Change owner
chown alice:devteam file.txt  # Change owner and group
chown -R alice /home/alice    # Recursive
```

### Special Permissions
| Permission | Octal | Effect |
|-----------|-------|--------|
| SUID | 4000 | File runs as owner, not current user |
| SGID | 2000 | File runs as group; directory inherits group |
| Sticky Bit | 1000 | Only file owner can delete (used on /tmp) |

```bash
chmod u+s /usr/bin/program     # Set SUID
chmod +t /tmp                  # Set sticky bit
find / -perm -4000 2>/dev/null # Find all SUID files
```

### umask
Default permission mask applied when new files are created.
```bash
umask           # Show current umask (usually 022)
umask 027       # New files: 640 (rw-r-----), dirs: 750
```

### Why It Matters for Cybersecurity
- Find SUID binaries to escalate privileges
- Misconfigured permissions are a top Linux vulnerability
- Sticky bit and SGID misuse leads to file tampering attacks

### Key Takeaway
> Permissions are the gatekeepers of Linux.
> Misconfigurations here are gold for attackers.

---

## 7. Processes — ps, kill, Signals, Job Control & /proc

### Viewing Processes
```bash
ps aux              # All running processes
ps aux | grep nginx # Find specific process
top                 # Real-time process monitor
htop                # Interactive process viewer
```

### Process States
| State | Meaning |
|-------|---------|
| R | Running |
| S | Sleeping |
| Z | Zombie (dead but not reaped) |
| T | Stopped |

### Signals & kill
```bash
kill PID            # Send SIGTERM (graceful stop)
kill -9 PID         # Send SIGKILL (force kill)
kill -l             # List all signals
killall nginx       # Kill by name
```

| Signal | Number | Meaning |
|--------|--------|---------|
| SIGTERM | 15 | Graceful termination |
| SIGKILL | 9 | Force kill, cannot be ignored |
| SIGHUP | 1 | Reload config |
| SIGINT | 2 | Interrupt (Ctrl+C) |

### Job Control
```bash
command &           # Run in background
Ctrl+Z              # Suspend job
jobs                # List background jobs
fg %1               # Bring job 1 to foreground
bg %1               # Resume job 1 in background
nohup command &     # Run immune to hangups
```

### The /proc Filesystem
Virtual filesystem exposing kernel and process info.
```bash
cat /proc/1/cmdline       # Command that started PID 1
cat /proc/cpuinfo         # CPU info
cat /proc/meminfo         # Memory info
ls /proc/$$               # Info about current shell process
```

### Why It Matters for Cybersecurity
- Malware analysis → identify suspicious processes
- Kill rogue processes on compromised systems
- `/proc` reveals live process memory and open files

### Key Takeaway
> Understanding processes is essential for both defense and offense —
> every attack and every service leaves a trace here.

---

## 8. Package Management — apt, rpm, yum, tar, gzip

### Debian/Ubuntu — APT
```bash
apt update               # Refresh package list
apt upgrade              # Upgrade installed packages
apt install nmap         # Install nmap
apt remove nmap          # Remove nmap
apt search keyword       # Search for package
dpkg -l                  # List installed packages
```

### Red Hat/CentOS — YUM / RPM
```bash
yum install nmap         # Install nmap
yum remove nmap          # Remove
yum update               # Update all
rpm -ivh package.rpm     # Install RPM file
rpm -qa                  # List installed RPMs
```

### Archives — tar & gzip
```bash
tar -cvf archive.tar files/    # Create tar archive
tar -xvf archive.tar           # Extract tar archive
tar -czvf archive.tar.gz files/ # Create compressed archive
tar -xzvf archive.tar.gz       # Extract compressed archive
gzip file.txt                  # Compress file
gunzip file.txt.gz             # Decompress file
```

| Flag | Meaning |
|------|---------|
| `-c` | Create archive |
| `-x` | Extract archive |
| `-v` | Verbose output |
| `-f` | Specify filename |
| `-z` | Use gzip compression |

### Why It Matters for Cybersecurity
- Install tools on target or lab systems
- Transfer and compress files during engagements
- Identify installed software to find vulnerable versions

### Key Takeaway
> Package management keeps your toolkit sharp.
> Always know what is installed — and what should not be.

---

## 9. Networking — Netcat, OpenSSL, Nmap & SSH Keys

### Nmap — Network Scanner
```bash
nmap 192.168.1.1             # Basic scan
nmap -sV 192.168.1.1         # Version detection
nmap -sC -sV -oN out.txt IP  # Script scan, save output
nmap -p- IP                  # Scan all 65535 ports
nmap -A IP                   # Aggressive scan
```

### Netcat — The Swiss Army Knife
```bash
nc -lvnp 4444                    # Listen on port 4444
nc 192.168.1.5 4444              # Connect to remote host
nc -lvnp 4444 > received.txt     # Receive file
nc 192.168.1.5 4444 < file.txt   # Send file
```

### SSH — Secure Shell
```bash
ssh user@192.168.1.5             # Connect to remote host
ssh -i key.pem user@IP           # Connect with private key
ssh -L 8080:localhost:80 user@IP # Local port forwarding
scp file.txt user@IP:/tmp/       # Secure copy file
```

### SSH Key Setup
```bash
ssh-keygen -t rsa -b 4096        # Generate key pair
ssh-copy-id user@IP              # Copy public key to server
cat ~/.ssh/id_rsa.pub            # View public key
```

### OpenSSL
```bash
openssl s_client -connect site.com:443     # Check SSL cert
openssl enc -aes-256-cbc -in f -out f.enc  # Encrypt file
openssl genrsa -out key.pem 2048           # Generate RSA key
```

### Why It Matters for Cybersecurity
- Nmap is the first tool in every recon phase
- Netcat creates reverse shells and transfers files
- SSH key weaknesses are a common attack vector

### Key Takeaway
> Networking tools are your hands in the dark.
> Know them well enough to use them without thinking.

---

## 10. Encoding & Compression — Base64, ROT13, Hexdumps

### Base64
Encodes binary data as ASCII text — commonly used in web and CTFs.
```bash
echo "hello" | base64              # Encode
echo "aGVsbG8K" | base64 -d       # Decode
base64 -d encoded.txt              # Decode from file
```

### ROT13
Simple Caesar cipher — rotates letters by 13 positions.
```bash
echo "hello" | tr 'a-zA-Z' 'n-za-mN-ZA-M'
```

### Hex & Hexdumps
```bash
xxd file.txt                    # Hexdump of file
xxd -r hex.txt > output.bin     # Reverse hexdump
od -A x -t x1z file.txt        # Octal dump in hex
```

### Common Encodings Summary
| Encoding | Use Case | Example |
|----------|----------|---------|
| Base64 | Binary-to-text, web tokens | `aGVsbG8=` |
| Hex | Binary representation | `68 65 6c 6c 6f` |
| ROT13 | Simple obfuscation | `uryyb` |
| URL Encoding | Safe URLs | `hello%20world` |
| ASCII | Standard text | `A=65, Z=90` |

### Why It Matters for Cybersecurity
- CTF challenges heavily use Base64, hex, ROT13
- Malware often encodes payloads to evade detection
- Forensics involves reading hexdumps of unknown files

### Key Takeaway
> Recognizing encoded data at a glance is a core analyst skill.
> If something looks like noise, it is probably encoded.

---

## 11. Cron & Bash Scripting

### Cron — Task Scheduling
```bash
crontab -e          # Edit your cron jobs
crontab -l          # List cron jobs
cat /etc/crontab    # System-wide cron jobs
ls /etc/cron.d/     # Drop-in cron configs
```

### Cron Syntax
```
* * * * * command
│ │ │ │ │
│ │ │ │ └── Day of week (0-7, Sun=0)
│ │ │ └──── Month (1-12)
│ │ └────── Day of month (1-31)
│ └──────── Hour (0-23)
└────────── Minute (0-59)
```

```bash
0 2 * * * /opt/backup.sh          # Run at 2:00 AM daily
*/5 * * * * /opt/monitor.sh       # Every 5 minutes
@reboot /opt/start.sh             # On system boot
```

### Bash Scripting Basics
```bash
#!/bin/bash
# This is a comment

NAME="Madhav"
echo "Hello, $NAME"

# Conditionals
if [ $1 -gt 100 ]; then
    echo "Big number"
else
    echo "Small number"
fi

# Loops
for i in 1 2 3 4 5; do
    echo "Number: $i"
done

# Read input
read -p "Enter username: " username
echo "You entered: $username"
```

### Useful Scripting Patterns
```bash
#!/bin/bash
# Simple port checker
for port in 22 80 443 3306; do
    nc -zv $1 $port 2>&1 | grep -i "open"
done
```

### Why It Matters for Cybersecurity
- Automate recon, scanning, and log parsing
- Cron misconfigurations → privilege escalation
- Write custom tools quickly without compiling code

### Key Takeaway
> A bash script that saves you 10 minutes every day
> saves you 60 hours a year. Automate everything you repeat.

---

## 12. Advanced Shell — SUID, .bashrc & Background Jobs

### .bashrc & Shell Configuration
```bash
cat ~/.bashrc           # View shell config
source ~/.bashrc        # Reload after edits
nano ~/.bashrc          # Edit it

# Add custom prompt
export PS1="\u@\h:\w\$ "

# Add to PATH
export PATH=$PATH:/opt/tools
```

### SUID Exploitation
SUID (Set User ID) files run as their owner, not the caller.
```bash
find / -perm -u=s -type f 2>/dev/null    # Find SUID files
find / -perm -4000 -type f 2>/dev/null   # Same in octal
```

Common SUID escalation via GTFOBins:
```bash
# If /usr/bin/find has SUID set
find . -exec /bin/sh -p \; -quit

# If /usr/bin/vim has SUID set
vim -c ':!/bin/sh'
```

### Background Jobs & nohup
```bash
sleep 100 &             # Run in background
jobs                    # List background jobs
fg %1                   # Bring to foreground
bg %1                   # Continue in background
nohup ./script.sh &     # Survives terminal close
disown %1               # Detach from shell
```

### Shell Variables
```bash
echo $HOME              # Home directory
echo $PATH              # Executable paths
echo $USER              # Current user
echo $SHELL             # Current shell
env                     # All environment variables
export MYVAR="hello"    # Set env variable
```

### Why It Matters for Cybersecurity
- SUID binaries are a top privilege escalation vector
- Background jobs let payloads persist after shell setup
- `.bashrc` backdoors maintain persistence post-exploitation

### Key Takeaway
> The shell environment tells a story.
> Know how to read it and how to write your own chapters in it.

---

## 13. Git — Clone, Log, Branches, Tags & Push

### What is Git?
A distributed version control system for tracking changes in files.
Essential for managing scripts, tools, and finding exposed secrets.

### Core Git Commands
```bash
git clone https://github.com/user/repo.git   # Clone repo
git init                                     # Initialize new repo
git status                                   # Show changes
git add file.txt                             # Stage file
git add .                                    # Stage all
git commit -m "message"                      # Commit changes
git push origin main                         # Push to remote
git pull                                     # Pull latest changes
```

### Branches & Tags
```bash
git branch                    # List branches
git branch feature-x          # Create branch
git checkout feature-x        # Switch branch
git checkout -b new-branch    # Create + switch
git merge feature-x           # Merge into current
git tag v1.0                  # Create tag
git log --oneline             # Short commit history
git log --all --graph         # Visual branch history
```

### Secrets in Git History
```bash
git log --all                           # View all commits
git show <commit-hash>                  # Show commit details
git diff HEAD~1 HEAD                    # Diff last two commits
trufflehog git https://github.com/...  # Scan for secrets
```

### Why It Matters for Cybersecurity
- Public repos often contain hardcoded API keys and passwords
- Review commit history during bug bounty and source code audits
- Manage your own tools, scripts, and write-ups professionally

### Key Takeaway
> Developers push secrets to Git every day.
> Always check the commit history — it remembers everything.

---

## 14. Restricted Shells & Shell Escapes

### What is a Restricted Shell?
A shell with limited commands — used to contain users or poorly configured systems.
Common restricted shells: `rbash`, `rzsh`, limited sudoers.

### Escaping Restricted Shells
```bash
# Via vim
vim
:set shell=/bin/bash
:shell

# Via more/less
more /etc/passwd
!/bin/bash

# Via awk
awk 'BEGIN {system("/bin/bash")}'

# Via find
find / -name . -exec /bin/bash \; -quit

# Via Python
python3 -c 'import os; os.system("/bin/bash")'
```

### GTFOBins
A curated list of Unix binaries that can be abused to escape restrictions.
Website: **gtfobins.github.io**

| Binary | Escape Method |
|--------|--------------|
| `vim` | `:!/bin/bash` |
| `python` | `os.system('/bin/bash')` |
| `less` | `!/bin/bash` |
| `awk` | `system("/bin/bash")` |
| `find` | `-exec /bin/bash \;` |

### Uppercase Shell Trick
```bash
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
export TERM=xterm
```

### Why It Matters for Cybersecurity
- CTF and real-world boxes often drop you in restricted shells
- Shell escapes are a critical post-exploitation skill
- Understanding restrictions helps you both set them and break them

### Key Takeaway
> A restricted shell is just a door with a simple lock.
> If you know the techniques, every lock looks the same.

---

## Quick Reference — Linux Cheat Sheet

### File & Navigation
```bash
ls -la | pwd | cd | cp | mv | rm | mkdir | touch | find | locate
```

### Text
```bash
cat | less | more | head | tail | grep | cut | sort | uniq | awk | sed | tr
```

### Users & Permissions
```bash
whoami | id | sudo | su | useradd | usermod | passwd | chmod | chown | umask
```

### Processes & Jobs
```bash
ps aux | top | kill | killall | jobs | fg | bg | nohup | &
```

### Networking
```bash
nmap | nc | ssh | scp | curl | wget | ping | netstat | ss | ifconfig | ip a
```

### Encoding
```bash
base64 | base64 -d | xxd | tr | openssl enc
```

---

> **Overall Key Takeaway for Week 3:**
> Linux is the native environment of cybersecurity.
> Every tool, every exploit, every server runs on it.
> Invest deeply in Linux fundamentals — you will use every single concept here
> for the rest of your career.
