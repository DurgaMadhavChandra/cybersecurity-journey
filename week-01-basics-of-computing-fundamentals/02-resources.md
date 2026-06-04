# Week 01 — Resources

This is everything I used this week to learn Computing Fundamentals.
I'm documenting this so anyone starting from scratch can follow the same path.
All of this came from CS50 — honestly one of the best decisions I made
to start my cybersecurity journey with this course.

---

## The Course That Started Everything

I was confused about where to start my cybersecurity journey.
Then I found CS50 and everything changed.

It doesn't just teach you to code — it teaches you to THINK.
Week 0 alone was worth the entire course.

| Resource | Link | Type |
|----------|------|------|
| CS50 Introduction to Computer Science | [edX](https://www.edx.org/learn/computer-science/harvard-university-cs50-s-introduction-to-computer-science) | Full Course — Free |
| CS50 Official Website | [cs50.harvard.edu](https://cs50.harvard.edu/x) | Course Site |
| CS50 YouTube Playlist | [YouTube](https://www.youtube.com/cs50) | Free Videos |

---

## Lectures I Studied This Week

I didn't follow CS50 in order.
I picked the lectures that matched my Week 1 roadmap topics.

| Lecture | Topic | Link | My Thoughts |
|---------|-------|------|-------------|
| Week 0 | Computational Thinking | [Watch](https://cs50.harvard.edu/x/2024/weeks/0/) | Mind-blowing. Start here. |
| Week 1 | C Language | [Watch](https://cs50.harvard.edu/x/2024/weeks/1/) | Hard at first, clicked later |
| Week 3 | Algorithms | [Watch](https://cs50.harvard.edu/x/2024/weeks/3/) | Binary Search changed how I think |
| Week 5 | Data Structures | [Watch](https://cs50.harvard.edu/x/2024/weeks/5/) | Hash Tables felt like magic |

---

## Topic-wise Resources

### 1. Computational Thinking

This was my favourite topic this week.
I never thought problem-solving had a structure until I studied this.
The moment I understood decomposition everything became less scary.

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| CS50 Week 0 Notes | [Read](https://cs50.harvard.edu/x/2024/notes/0/) | Must Read | Best structured notes I found |
| BBC Computational Thinking Guide | [Read](https://www.bbc.co.uk/bitesize/guides/zp92mp3/revision/1) | Recommended | Simple and clear for beginners |
| Khan Academy Algorithms | [Watch](https://www.khanacademy.org/computing/ap-computer-science-principles/algorithms-101) | Good | Nice visual explanation |

**Real World Connection:**
Every cybersecurity analyst uses computational thinking daily.
Breaking an attack into stages — Recon, Scan, Exploit, Persist —
that's decomposition. Spotting suspicious login patterns — that's
pattern recognition. This isn't just theory. It's how security
professionals think.

---

### 2. Algorithms

Binary Search was my biggest aha moment this week.
I kept thinking — why would anyone need something faster than Linear Search?
Then I saw 1000 elements → 1000 checks vs 10 checks.
That comparison changed everything for me.

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| CS50 Week 3 Notes | [Read](https://cs50.harvard.edu/x/2024/notes/3/) | Must Read | Explained Big O in the simplest way |
| Big O Cheat Sheet | [Visit](https://www.bigocheatsheet.com) | Must Bookmark | My daily reference now |
| Visualgo Sorting | [Visualize](https://visualgo.net/en/sorting) | Must Try | Watching sorts happen live clicked everything |
| Binary Search Visualizer | [Visualize](https://www.cs.usfca.edu/~galles/visualization/Search.html) | Recommended | Helped me understand the logic visually |

**Real World Connection:**
Cybersecurity tools search through millions of log entries every second.
A SIEM system using Linear Search on 1 million logs would be painfully slow.
Binary Search and Hash Tables are what make real-time threat detection possible.
Understanding this made me appreciate why algorithms matter in security.

---

### 3. Data Structures

This topic confused me the most at the start.
I kept asking — why not just use arrays for everything?
Then I understood the resizing problem and linked lists made sense.
Hash Tables felt like magic until I understood collisions.

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| CS50 Week 5 Notes | [Read](https://cs50.harvard.edu/x/2024/notes/5/) | Must Read | Most detailed explanation |
| Visualgo Data Structures | [Visualize](https://visualgo.net/en) | Must Try | Watching linked lists build live helped a lot |
| GeeksForGeeks Data Structures | [Read](https://www.geeksforgeeks.org/data-structures/) | Good | Good for extra practice problems |

**Real World Connection:**
Password databases use Hash Tables — that's why your login is instant
even with millions of users. DNS lookup uses Tries — that's how
your browser resolves a domain name in milliseconds. Malware analysis
tools use queues to process suspicious files one by one without missing any.
Every data structure I learned this week has a direct job in cybersecurity.

---

### 4. C Language

C was intimidating. No auto-complete. No safety net. Just raw code.
But that's exactly why cybersecurity professionals need to know it.
Most low-level exploits and vulnerabilities exist at the C level.
Understanding C means understanding how attacks actually work.

| Resource | Link | My Rating | Why I Used It |
|----------|------|-----------|---------------|
| CS50 Week 1 Notes | [Read](https://cs50.harvard.edu/x/2024/notes/1/) | Must Read | Best intro to C I found |
| CS50 Manual Pages | [Visit](https://manual.cs50.io) | Must Bookmark | My go-to reference for C functions |
| Tutorialspoint C | [Read](https://www.tutorialspoint.com/cprogramming/index.htm) | Good | Useful for syntax reference |
| Learn C Interactive | [Practice](https://www.learn-c.org) | Recommended | Practiced directly in browser |

**Real World Connection:**
Buffer overflows, memory leaks, integer overflows — these are real
vulnerabilities that have caused massive security breaches.
They all happen at the C level. Learning C this week wasn't just
about programming. It was about understanding where attacks are born.

---

## Tools I Used This Week

| Tool | Purpose | Link |
|------|---------|------|
| CS50 Codespace | Wrote and ran all my C code here | [code.cs50.io](https://code.cs50.io) |
| Visualgo | Visualized every algorithm and data structure | [visualgo.net](https://visualgo.net) |
| Big O Cheat Sheet | Checked complexity while studying | [bigocheatsheet.com](https://www.bigocheatsheet.com) |
| VS Code | Wrote all my notes and code locally | [code.visualstudio.com](https://code.visualstudio.com) |

---

## My Honest Rating of This Week

| Topic | Difficulty | My Experience |
|-------|------------|---------------|
| Computational Thinking | Easy | Loved it — changed how I think completely |
| Algorithms | Medium | Really enjoyed — Binary Search was the highlight |
| Data Structures | Hard | Took time to click but worth every minute |
| C Language | Hard | Challenging but the most satisfying to get right |

---

## My Recommendation to Anyone Starting

If you are starting cybersecurity from zero — do CS50 Week 0 first.
Don't skip it thinking it's too basic.
It rewires how you think about problems.
Everything else builds on top of it.

The real world connection between these topics and cybersecurity
is not obvious at first. But after this week I can see it clearly.
Every tool, every attack, every defense starts with these fundamentals.