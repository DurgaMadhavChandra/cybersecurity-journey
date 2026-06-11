# Week 02 — Resources

This week was all about understanding what happens behind the scenes when a
computer runs multiple programs at the same time. I started with the basics
of what an Operating System actually does and gradually moved into process
management, synchronization, memory management, and concurrency problems.

Unlike Week 01 where I explored multiple CS50 lectures, this week I focused
on building a complete mental model of Operating Systems. I chose one main
learning path and used a few additional references whenever I wanted a
different explanation or a real-world perspective.

---

## My Main Learning Path

I wanted a resource that covered Operating Systems from the ground up without
jumping between different playlists. The following course became the backbone
of my learning this week.

| Resource                                    | Link                                             | Why I Chose It                                                     |
| ------------------------------------------- | ------------------------------------------------ | ------------------------------------------------------------------ |
| Operating Systems Full Course — Love Babbar | https://youtu.be/3obEP8eLsCw?si=vneU76j-zafqpvVG | Covered the complete roadmap in one place with simple explanations |
| CodeHelp YouTube Channel                    | https://www.youtube.com/@CodeHelp                | Great for revisiting individual concepts later                     |

---

## Topics I Explored

This week wasn't just about learning definitions. I tried to understand how
different Operating System concepts connect with each other.

| Area                   | Topics I Covered                                                                          |
| ---------------------- | ----------------------------------------------------------------------------------------- |
| OS Basics              | What is an Operating System, Types of OS, Components of OS, System Calls, OS Boot Process |
| Process Management     | Process Creation, Process States, Context Switching, Multitasking vs Multithreading       |
| CPU Scheduling         | FCFS, SJF, Priority Scheduling, Round Robin, MLQ, Scheduling Comparison, Convoy Effect    |
| Concurrency            | Threads, Critical Section, Semaphores, Condition Variables                                |
| Classical Problems     | Producer-Consumer, Reader-Writer, Dining Philosophers                                     |
| Deadlocks              | Deadlock Conditions, Avoidance, Detection, Recovery                                       |
| Memory Management      | Free Space Management, Paging, Segmentation, Virtual Memory                               |
| Advanced Memory Topics | FIFO, LRU, Optimal, LFU, Thrashing                                                        |
| Practice               | Solving Concurrency Problems (LeetCode)                                                   |

---

## Resources That Helped Me Understand Better

Sometimes I needed a second explanation or a quick refresher while writing
my notes. These resources were useful for filling those gaps.

| Resource                                     | Link                                                                 | Why It's Useful                                                 |
| -------------------------------------------- | -------------------------------------------------------------------- | --------------------------------------------------------------- |
| Operating Systems: Three Easy Pieces (OSTEP) | https://pages.cs.wisc.edu/~remzi/OSTEP/                              | One of the best free books for understanding OS concepts deeply |
| GeeksforGeeks — Operating Systems            | https://www.geeksforgeeks.org/operating-systems/                     | Quick revision and interview-oriented explanations              |
| GeeksforGeeks — CPU Scheduling               | https://www.geeksforgeeks.org/cpu-scheduling-in-operating-systems/   | Good visual examples for scheduling algorithms                  |
| GeeksforGeeks — Memory Management            | https://www.geeksforgeeks.org/memory-management-in-operating-system/ | Helped reinforce paging and virtual memory concepts             |

---

## Visual Learning & Practice Tools

I realized that many OS concepts become easier when you can actually
visualize them. Dry-running examples and drawing process states helped me
much more than simply reading theory.

| Tool                          | Why I Used It                                  |
| ----------------------------- | ---------------------------------------------- |
| VS Code                       | Wrote all my notes and small code experiments  |
| Git & GitHub                  | Documenting my learning journey publicly       |
| Markdown                      | Structured my notes and reflections            |
| Draw.io                       | Drew process state diagrams and memory layouts |
| LeetCode Concurrency Problems | Applied synchronization concepts in code       |

---

## Topics That Changed the Way I Think

A few ideas stood out because they completely changed my understanding of
how computers work.

### CPU Scheduling

Before this week, I assumed programs simply "run" when we open them.
Learning scheduling algorithms made me realize that the operating system is
constantly making decisions about which process deserves CPU time next.

### Concurrency & Synchronization

The Critical Section problem and Semaphores showed me that running multiple
tasks together is much harder than it looks. One small mistake can lead to
race conditions or deadlocks.

### Memory Management

Virtual Memory and Paging were probably the biggest "aha!" moments for me.
The idea that a program can run even when it isn't fully loaded into RAM was
something I had never thought about before.

---

## Cybersecurity Connection

One reason I wanted to study Operating Systems early in my cybersecurity
journey is that almost every security concept depends on understanding how
the OS works.

* Process isolation helps contain malicious programs.
* Memory management is the foundation for understanding buffer overflows.
* Race conditions can become real-world security vulnerabilities.
* Deadlocks and synchronization issues can affect system reliability.
* System calls are the bridge between applications and the operating system.

The more I study cybersecurity, the more I realize that Operating Systems
isn't just another subject—it's one of the foundations everything else is
built on.

---

## My Recommendation to Anyone Learning OS

Don't try to memorize scheduling algorithms or page replacement techniques
just for interviews. Instead, keep asking one question:

**"What problem was the operating system trying to solve by introducing this concept?"**

Once I started looking at OS topics from that perspective, everything became
more connected. FCFS, Semaphores, Virtual Memory, and even Deadlocks all
started to feel like different solutions to the same challenge:
**efficiently sharing limited computer resources.**
