# Week 04 — Errors & Struggles

This week was all Networking — OSI layers, ports and protocols, subnetting,
IPv6, routing, switching, VLANs, wireless, monitoring, attacks, and finally
the diagnostic tools that tie all of it together. More theory packed into
one week than any topic so far, and theory has a way of feeling solid right
up until it meets a real packet, a real scan, or a real terminal output.
Documenting all of it below, exactly as it happened.

---

## Struggle 1: I "Subnetted" a Network and Got the Host Count Wrong

### The Problem

While working through the IPv4 subnetting notes, I tried to split
`192.168.1.0/24` into four equal `/26` networks for a practice diagram. I
calculated each subnet would support 64 usable hosts, wrote it down, and
moved on — until I cross-checked it against the CIDR table in my own notes
and the number didn't match.

### My Debugging Process

I went back to first principles instead of trusting my memory. A `/26`
mask leaves 6 bits for hosts: `2^6 = 64` total addresses in the block. But
two of those addresses are never assignable to a host — the first address
in the block is the network address, and the last is the broadcast
address. I had calculated the block size, not the usable host count. I
manually listed out a `/26` block (`.0` through `.63`) and saw the
boundary addresses were reserved, not usable.

### The Fix

Usable hosts = `2^6 - 2 = 62`, not 64. I rebuilt the table from scratch
and checked every boundary:

```
192.168.1.0/26    → network .0   broadcast .63   usable .1–.62
192.168.1.64/26   → network .64  broadcast .127  usable .65–.126
192.168.1.128/26  → network .128 broadcast .191  usable .129–.190
192.168.1.192/26  → network .192 broadcast .255  usable .193–.254
```

**My Observation:**
The "minus 2" rule is one line in a table, easy to skim past. But this is
exactly the off-by-two error that, in a real environment, means a DHCP
scope handing out a broadcast address, or a firewall rule scoped to the
wrong boundary. Subnetting punishes confident arithmetic — it rewards
checking the boundary addresses every single time.

---

## Struggle 2: I Assumed DNS Always Uses UDP — Then a Packet Capture Proved Me Wrong

### The Problem

"DNS = UDP port 53" was memorized cold from the ports table. So when I ran
a few `nslookup`/`dig` queries and later looked back at a capture expecting
only UDP frames, I was thrown off seeing a DNS exchange happening over TCP
instead. My first thought was that I'd misconfigured something.

### My Debugging Process

I went back and reread the DNS section properly instead of trusting the
one-line port entry from memory. DNS defaults to UDP for speed and low
overhead — but UDP has a payload size limit, and once a response gets too
large (zone transfers, DNSSEC records, or a reply over 512 bytes), DNS
falls back to TCP so the response can be reliably reassembled. The table
wasn't wrong; my mental model of it was incomplete.

### The Fix

I rewrote the note to be explicit instead of leaving "DNS = TCP/UDP 53"
ambiguous:

```
DNS over UDP 53 → standard queries, fast, no handshake
DNS over TCP 53 → large responses, zone transfers, retransmission after truncation
```

**My Observation:**
A protocol table that lists "TCP/UDP" side by side hides a decision the
protocol is actually making in real time. It's also a real detection
signal — a spike in DNS-over-TCP on a network that's normally all
UDP-53 is a pattern worth a second look, since it can point to zone
transfers, tunneling, or exfiltration attempts.

---

## Struggle 3: I Thought VLAN Hopping Needed Physical Access — Double-Tagging Proved Otherwise

### The Problem

Reading the VLAN and trunking notes, my mental model was simple: trunk
ports carry multiple VLANs tagged with 802.1Q, so an attacker would need
to physically plug into a trunk port to break that isolation. I treated
VLAN hopping as a "you'd need to be inside the building" problem.

### My Debugging Process

That assumption fell apart once I read how double-tagging actually works.
If an access port sits on the same VLAN as the trunk's native VLAN, an
attacker can craft a frame with two 802.1Q tags stacked on top of each
other. The first switch strips the outer tag — the one matching the
native VLAN — and forwards what's left, which is the still-tagged inner
frame, straight onto the trunk and into a VLAN the attacker was never
authorized to reach. No physical trunk access required — just a
misconfigured native VLAN on an ordinary access port.

### The Fix

I split my VLAN notes into "what trunking does" versus "what trunking
assumes," since the assumption is the actual vulnerability:

```
Trunk strips outer tag matching native VLAN → forwards inner tag unchecked
Fix: never leave native VLAN as the default (VLAN 1); tag it explicitly
```

**My Observation:**
This was the moment switching stopped being "VLANs keep things separate"
and became "VLANs keep things separate only if every assumption behind
the config is also true." The control wasn't broken — the default config
just quietly assumed nobody would test the assumption.

---

## Struggle 4: traceroute Filled With Asterisks and I Thought My Lab Was Under Attack

### The Problem

I ran `traceroute 8.8.8.8` to watch the hops in real time after studying
the troubleshooting tools section. A few hops in, the output filled with
asterisks:

```
4  * * *
5  * * *
6  72.14.xxx.xxx  18.221 ms
```

My first reaction was that something was actively blocking or attacking
the trace.

### My Debugging Process

I went back to the ICMP notes instead of jumping to conclusions.
traceroute works by sending packets with increasing TTL values and
reading the "TTL expired" message each hop sends back. An asterisk just
means no reply came back from that hop within the timeout — not that the
hop failed. Plenty of routers are configured to silently drop or
rate-limit those ICMP replies for security reasons, while still
forwarding the actual traffic perfectly fine.

### The Fix

Nothing to fix — the trace was working as expected. The real fix was
correcting my interpretation: asterisks followed by a valid reply at the
next hop just mean an intermediate router didn't respond, not that the
path was broken or compromised.

**My Observation:**
"No response" and "attack" are not the same thing, even though they can
look identical in one line of output. Jumping to the alarming explanation
before the boring one is a habit I need to unlearn early — most anomalies
in networking are configuration choices, not incidents.

---

## Struggle 5: My nmap Scan Came Back "Filtered" and I Assumed It Meant Vulnerable

### The Problem

I ran a basic `nmap` scan against my own lab machine to practice reading
output against this week's ports notes:

```
PORT     STATE    SERVICE
22/tcp   open     ssh
80/tcp   closed   http
443/tcp  filtered https
```

I read "filtered" and assumed it meant the port was reachable but
misconfigured — something to flag as a weakness.

### My Debugging Process

I went back over the port states instead of guessing from the label.
`open` means a service answered. `closed` means the host responded but
nothing is listening. `filtered` is actually the most locked-down state
of the three — it means nmap got no response at all, which usually means
a firewall is silently dropping the probe rather than replying with a
rejection. I had the security implication backwards.

### The Fix

I corrected my notes explicitly, since the labels don't read intuitively:

```
open     → service is listening and responding
closed   → host is up, port has no service, but it did reply
filtered → no reply at all — usually a firewall silently dropping probes
```

**My Observation:**
"Filtered" being the safest state, not the most exposed one, was the
opposite of my first instinct. Misreading scan output in the wrong
direction is a fast way to either chase a non-issue or, worse, walk past
a port that's actually wide open while focused on the wrong row.

---

## Struggle 6: Wireshark Humbled Me

### The Problem

I opened Wireshark for the first time... and completely froze. Hundreds
of packets. Scrolling endlessly. Colors I didn't understand. And me,
staring at the screen like I had never heard of networking in my life.
That was the moment Week 4 humbled me.

This week was packed with networking fundamentals — OSI Model,
subnetting, routing, switching, VLANs, attacks, wireless, DNS, DHCP, VPNs.
I powered through the theory, but when I opened Wireshark, reality hit:
packets everywhere (TCP, UDP, ICMP, ARP, DNS), yet I couldn't make sense
of what I was seeing. It was a clear reminder that understanding concepts
is one thing, but interpreting real network traffic is where the real
learning begins. It wasn't Wireshark's fault. It was mine.

### The Realization

Wireshark doesn't hide anything from you. It shows you the raw truth of
what's happening on a network — every handshake, every request, every
response. But here's what I didn't expect:

- When a DNS query appeared, I had to know Port 53 and why UDP is used
  there — not TCP.
- When I saw a 3-way handshake, I had to mentally map it to Layer 4 of
  the OSI model.
- When ARP packets flooded in, I had to connect that to Layer 2, MAC
  addresses, and why ARP poisoning is a real attack.
- When I saw ICMP, I finally understood what ping is actually doing
  under the hood.

Every single concept from this week — ports, protocols, layers, attacks,
routing — was sitting right there inside those packets. Wireshark wasn't
a separate tool. It was the exam for everything else I had studied. And I
was not ready.

### The Shift

I stopped trying to understand Wireshark and went back to the
fundamentals. I rebuilt my understanding layer by layer — literally. OSI
Model first. Then ports and protocols. Then I ran a simple ping, opened
Wireshark, and watched the ICMP packets appear in real time. That one
moment — seeing a concept I had just studied show up live in a packet
capture — changed everything.

Suddenly subnetting wasn't just binary math. It was the reason packets
know where to go. Suddenly VLANs weren't just a switching concept. They
were the reason certain traffic stays isolated. Suddenly a DoS attack
wasn't just a definition. I could see what a flood of packets actually
looks like.

**My Observation:**
The biggest lesson from Week 4: tools like Wireshark don't teach you
networking. They reveal whether you actually understand it. Wireshark
taught me that networking is a conversation — and I finally learned to
listen.

---

## Week 4 Reflection on Struggles

Looking back, almost every struggle this week traced back to the same
idea: the gap between defining something and recognizing it. I could
recite the subnet table, but I still miscounted usable hosts. I knew DNS
"uses UDP 53," but I didn't expect to see it over TCP. I knew what trunk
ports do, but not what they silently assume. I knew traceroute and nmap
existed, but I read their output backwards the first time each one mattered.
And I knew every protocol on the OSI model by name, right up until
Wireshark put all of them in front of me at once, unlabeled, in real time.

Networking this week didn't feel like learning new commands the way Linux
did last week. It felt like learning to translate — taking something I
already had a definition for and forcing myself to recognize it in raw
output, in scan results, in a packet capture, with no label telling me
which concept I was looking at. That's the same instinct a SOC analyst
runs on every single shift: a log line, an alert, or a capture doesn't
arrive with the textbook definition attached. You either recognize the
pattern, or you don't.

I didn't just learn networking theory this week. I started learning how
to recognize it in the wild — and realized that's a completely different
skill from memorizing it in the first place.
