#!/bin/bash
# ============================================
# Week 03 — Linux Fundamentals
# Author: Durga Madhav Chandra
# ============================================
#
# Everything below is safe to run as-is — all the "lab" functions
# work inside /tmp or against localhost, so nothing here touches
# a real system or a real target. Read the comments first, then
# run the script to watch each concept execute.


# ============================================
# 1. SHELL NAVIGATION & FILE BASICS
# ============================================

# pwd/ls/cd felt trivial until find showed me what they're really for.
# Searching a filesystem by hand vs. one find command — no comparison.

explore_filesystem() {
    echo "--- Current location ---"
    pwd

    echo "--- Hidden files most people scroll past ---"
    ls -la /tmp | head -5

    echo "--- Finding files by name (this is the post-exploitation move) ---"
    mkdir -p /tmp/lab/notes
    touch /tmp/lab/notes/passwords.txt
    find /tmp/lab -name "*.txt"
}


# ============================================
# 2. TEXT MANIPULATION — PIPES, GREP, CUT, SORT, UNIQ
# ============================================

# I used to read log files top to bottom like a human.
# Then I learned piping turns the terminal into a query language.

analyze_sample_log() {
    local log="/tmp/lab/sample_access.log"

    cat > "$log" <<EOF
192.168.1.10 - GET /login
192.168.1.15 - GET /admin
192.168.1.10 - POST /login
192.168.1.22 - GET /login
192.168.1.10 - GET /dashboard
EOF

    echo "--- Unique IPs, most active first ---"
    grep -oE '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' "$log" | sort | uniq -c | sort -rn

    echo "--- Only login attempts ---"
    grep "login" "$log" | cut -d' ' -f1,3
}


# ============================================
# 3. PERMISSIONS & OWNERSHIP
# ============================================

# This is the section that humbled me. chmod 777 once made me
# think I'd "fixed" a problem — I'd actually opened a door to everyone.
# Now I check who owns a file before I ever change what it allows.

permission_lab() {
    local file="/tmp/lab/secret.key"
    touch "$file"

    echo "--- Default permissions (driven by umask) ---"
    umask
    ls -l "$file"

    echo "--- Locking it down the way SSH expects for private keys ---"
    chmod 600 "$file"
    ls -l "$file"

    echo "--- What I should NOT do, and why SSH would reject this ---"
    chmod 644 "$file"
    ls -l "$file"
    echo "644 = owner + group + everyone can read. Never for keys or secrets."

    chmod 600 "$file"   # put it back the safe way
}


# ============================================
# 4. PROCESS MANAGEMENT
# ============================================

# Killing a process used to mean "make the red text go away."
# Now I know SIGTERM asks nicely and SIGKILL doesn't ask at all.

process_lab() {
    sleep 30 &
    local pid=$!

    echo "--- Background job started, PID $pid ---"
    ps -p "$pid"

    echo "--- Asking it to stop gracefully (SIGTERM) ---"
    kill "$pid" 2>/dev/null

    sleep 1
    if ps -p "$pid" > /dev/null 2>&1; then
        echo "--- Still alive, force kill (SIGKILL) ---"
        kill -9 "$pid"
    else
        echo "--- Process ended cleanly ---"
    fi
}


# ============================================
# 5. ENCODING & SSH KEYS
# ============================================

# Base64 looked like encryption to me at first.
# It isn't. It's just a different way of writing the same bytes —
# anyone can decode it instantly. Real secrets need real protection.

encoding_and_keys_lab() {
    echo "--- Base64 is encoding, not encryption ---"
    local encoded
    encoded=$(echo "not a secret" | base64)
    echo "Encoded: $encoded"
    echo "Decoded: $(echo "$encoded" | base64 -d)"

    echo "--- Generating a throwaway SSH key pair in /tmp ---"
    ssh-keygen -t rsa -b 2048 -f /tmp/lab/demo_key -N "" -q
    chmod 600 /tmp/lab/demo_key
    ls -l /tmp/lab/demo_key
}


# ============================================
# 6. AUTOMATION — CRON & BASH SCRIPTING
# ============================================

# My cron job ran fine by hand and did nothing on schedule.
# Turned out cron doesn't load my $PATH — so now I always use
# full paths inside anything I schedule.

cron_reference() {
    cat <<'EOF'
--- Cron syntax cheat sheet ---
* * * * * command
| | | | |
| | | | +── Day of week (0-7)
| | | +──── Month (1-12)
| | +────── Day of month (1-31)
| +──────── Hour (0-23)
+────────── Minute (0-59)

Example that actually survives cron's tiny environment:
*/5 * * * * /usr/bin/nmap -sV 127.0.0.1 >> /home/user/scan.log 2>&1
EOF
}

port_scanner_demo() {
    echo "--- Quick local port check (loopback only, fully safe) ---"
    for port in 22 80 443; do
        timeout 1 bash -c "echo > /dev/tcp/127.0.0.1/$port" 2>/dev/null \
            && echo "Port $port: open" \
            || echo "Port $port: closed"
    done
}


# ============================================
# 7. SUID & GIT BASICS
# ============================================

# SUID confused me until I saw it as "this file runs as its owner,
# not as me." That one sentence is the entire idea behind half the
# privilege escalation techniques on GTFOBins.

suid_lab() {
    echo "--- Files on this system that run with elevated privilege ---"
    find /usr/bin -perm -4000 -type f 2>/dev/null | head -5
}

git_lab() {
    local repo="/tmp/lab/repo"
    mkdir -p "$repo" && cd "$repo" || return

    git init -q
    echo "first version" > notes.txt
    git add notes.txt
    git commit -q -m "initial commit"

    echo "--- Commit history (this is what trufflehog goes hunting through) ---"
    git log --oneline

    cd - > /dev/null || return
}


# ============================================
# MAIN
# ============================================

main() {
    mkdir -p /tmp/lab

    echo "=== 1. Shell Navigation ==="
    explore_filesystem
    echo

    echo "=== 2. Text Manipulation ==="
    analyze_sample_log
    echo

    echo "=== 3. Permissions ==="
    permission_lab
    echo

    echo "=== 4. Process Management ==="
    process_lab
    echo

    echo "=== 5. Encoding & SSH Keys ==="
    encoding_and_keys_lab
    echo

    echo "=== 6. Cron & Automation ==="
    cron_reference
    port_scanner_demo
    echo

    echo "=== 7. SUID & Git ==="
    suid_lab
    git_lab

    echo
    echo "Done. Everything above ran inside /tmp or against localhost only."
}

main "$@"
