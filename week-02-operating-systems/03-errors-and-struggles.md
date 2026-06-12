# Week 02 — Errors & Struggles

This week felt completely different from Week 1.

In Week 1, I was learning how to think like a programmer.
This week, I had to think like an operating system.

I thought Operating Systems would just be another theory subject.
Instead, I realized it's the invisible manager that keeps everything inside a computer organized. Most of my struggles came from trying to change the way I imagined a computer actually works.

---

## Struggle 1: I Thought Programs Just Run Until They Finish

### The Problem

Before this week, my mental model was very simple.

I double-click an application.
The CPU runs it.
When it finishes, the next application runs.

That was it.

Then I started learning about **processes**, **process states**, **CPU scheduling**, and **context switching**.

Suddenly I was reading things like:

- Process enters Ready state.
- Scheduler dispatches process to CPU.
- Time quantum expires.
- Process moves back to Ready queue.

I remember stopping the video and thinking:

**"Wait... the CPU keeps interrupting my program even when nothing is wrong?"**

That idea completely broke my understanding of how computers work.

### My Debugging Process

I stopped trying to memorize the process states and instead followed a single example.

Imagine I open:

- Chrome
- VS Code
- Spotify

I asked myself:
Who gets the CPU first?
What happens if I click a new browser tab?
What happens if Spotify is downloading data from the internet?

Then the Ready → Running → Waiting → Ready cycle finally made sense.

I even drew this on paper:

```
          +---------+
          |  Ready  |
          +---------+
               |
               | CPU Assigned
               v
          +---------+
          | Running |
          +---------+
           /       \
 I/O Wait /         \ Time Quantum Over
         v           v
   +---------+   +---------+
   | Waiting |   |  Ready  |
   +---------+   +---------+
```

Suddenly the operating system stopped feeling magical.
It just looked like a really efficient traffic controller.

### The Fix

I stopped thinking about programs as isolated pieces of code.

Instead, I started thinking about them as processes competing for a limited resource — CPU time.

That one mental shift made CPU scheduling and context switching much easier.

**My Observation:**
The operating system isn't there to run one program. It's there to make thousands of tiny decisions every second about who gets access to the CPU next.

---

## Struggle 2: Every Scheduling Algorithm Looked Exactly the Same

### The Problem

FCFS. SJF. Priority Scheduling. Round Robin. MLQ. MLFQ.

After studying them for a while, they all started blending together.

I kept forgetting:

- Which one was preemptive?
- Which one caused starvation?
- Which one suffered from convoy effect?
- Which one was designed for time-sharing systems?

I tried memorizing comparison tables, but five minutes later everything was mixed up again.

### My Debugging Process

Instead of asking:
**"How does this algorithm work?"**

I changed the question to:
**"What problem was this algorithm trying to solve?"**

That completely changed the way I studied.

- FCFS → simplest possible scheduling.
- SJF → reduce average waiting time.
- Priority → let important jobs run first.
- Round Robin → make the system feel fair for everyone.
- MLFQ → balance fairness and performance.

Then I started connecting them to real life.

FCFS reminded me of a line at a ticket counter.
Round Robin felt like a teacher giving each student exactly one minute to answer before moving to the next person.
Priority Scheduling looked like an emergency room where critical patients are treated first.

### The Fix

I stopped memorizing definitions and started remembering the story behind each algorithm.

After that, I could usually figure out the properties of the algorithm even if I forgot the exact textbook definition.

**My Observation:**
Most computer science concepts are easier to remember when you understand the problem they were invented to solve.

---

## Struggle 3: Concurrency Completely Broke My Brain

### The Problem

I thought concurrency simply meant:
"Two things happen at the same time."

That sounded easy.

Then I reached the **Critical Section Problem** and **Race Conditions**.

I saw examples where two threads both tried to increment the same variable, and somehow the final answer was wrong.

I remember thinking:

**"How can adding 1 and adding 1 not become 2?"**

It felt impossible.

### My Debugging Process

I stopped reading and manually acted out the example.

Suppose `count = 5`.

```
Thread A reads count → 5
Before it writes back 6, the OS switches to Thread B
Thread B also reads count → still 5
Thread B writes 6
CPU switches back
Thread A writes... 6

Expected: 7    Actual: 6
```

That was the moment race conditions finally clicked.

### The Fix

Once I understood that thread execution order is unpredictable, mutexes and semaphores suddenly stopped looking like random theory.

They were simply ways to tell the operating system:

**"Only one thread is allowed in this critical section at a time."**

**My Observation:**
Concurrency bugs are scary because the code can work perfectly a hundred times and fail only once depending on thread timing.

---

## Struggle 4: Deadlock Was Easy to Memorize but Hard to Understand

### The Problem

I could memorize the four necessary conditions:

- Mutual Exclusion
- Hold and Wait
- No Preemption
- Circular Wait

But honestly, I had no idea why they mattered.

I could write them in an exam and still not understand what was happening.

### My Debugging Process

The Dining Philosophers problem helped, but what really made it click was imagining four friends sharing four bike locks.

Each person picks up one lock and waits for another lock held by someone else.

Nobody wants to let go.
Nobody can move forward.
Everyone just waits forever.

Then I mapped that example back to the four conditions and realized that deadlock isn't one bug — it's the result of several conditions existing at the same time.

### The Fix

I stopped treating the four conditions as a list to memorize.

Instead, I asked:
"If I remove just one of these conditions, can the deadlock still happen?"

That question helped me understand deadlock prevention much more naturally.

**My Observation:**
The hardest part of Operating Systems isn't learning the solutions. It's understanding why the problems exist in the first place.

---

## Struggle 5: Virtual Memory Felt Like It Shouldn't Work

### The Problem

This was probably my biggest confusion of the entire week.

If my laptop has only a fixed amount of RAM, how can a program larger than that memory still run?

The idea sounded impossible.

I thought:
"If the memory isn't there, where is the program actually running?"

### My Debugging Process

I stopped thinking about memory as one giant block.

Instead, I imagined my study desk.

My desk is small, so I don't keep every book on it. I only keep the books I need right now and leave the others on a nearby shelf. Whenever I need another book, I swap it in.

That is almost exactly what virtual memory does.
RAM is the desk.
Disk storage is the shelf.
Pages move back and forth depending on what the program needs.

Then concepts like page faults, paging, and page replacement algorithms started fitting together naturally.

### The Fix

I realized the operating system is constantly trading speed for space.

The program doesn't need to be fully loaded into RAM. It only needs the pieces currently being used.

**My Observation:**
Virtual Memory might be the best example of how clever software can make limited hardware feel much more powerful than it actually is.

---

## Struggle 6: I Couldn't Understand Why We Need System Calls

### The Problem

When I first saw system calls, I thought:
"Why can't a program just access the hardware directly?"

If my C program wants to create a file, why doesn't it simply write to the disk? Why does it have to ask the operating system for permission?

It felt like an unnecessary extra step.

### My Debugging Process

I imagined what would happen if every application could directly control the hardware.

- What if two programs tried to write to the same file at exactly the same time?
- What if a normal application could directly overwrite kernel memory?
- What if malware could freely access every hardware device?

I realized the operating system acts like a security guard. Applications don't get direct access — they make requests, and the OS decides whether those requests are allowed.

### The Fix

I stopped thinking of system calls as a limitation. They're actually a **protection mechanism** between user programs and the kernel.

**My Observation:**
The more I study cybersecurity, the more I realize that boundaries matter. System calls are one of the first security boundaries every program crosses.

---

## Struggle 7: 32-bit vs 64-bit Didn't Feel Important

### The Problem

I always saw software downloads offering two versions:

- 32-bit
- 64-bit

I used to pick 64-bit because everyone said it was "better," but I never understood why.

I thought the difference was only about performance.

### My Debugging Process

I learned that the number refers to the size of the CPU registers and the address space the processor can handle.

Then I discovered that a 32-bit system can only directly address around 4 GB of memory, while a 64-bit system can theoretically address an enormous amount of memory.

That was the first time I connected architecture with memory management.

### The Fix

Instead of memorizing numbers, I connected them to a practical question:
"How much memory can this processor actually work with?"

That made the difference much easier to remember.

**My Observation:**
Many technical concepts become simpler when you ask what real-world problem they solve instead of trying to memorize specifications.

---

## Struggle 8: Processes and Threads Kept Mixing Up in My Head

### The Problem

I understood the definitions individually.
A process is a running program.
A thread is a lightweight process.

But whenever someone asked me to compare them, I froze.

I couldn't clearly explain why browsers use multiple threads instead of creating hundreds of separate processes.

### My Debugging Process

I imagined a restaurant.

The restaurant itself is the process.
The workers inside it are the threads.

All the workers share the same kitchen and ingredients, but each worker can perform a different task independently.

That analogy immediately made resource sharing make sense.

### The Fix

I stopped comparing definitions and started comparing behavior.

- Processes have separate memory.
- Threads share memory inside the same process.
- Creating a thread is cheaper than creating a new process.

**My Observation:**
A good analogy can save more study time than reading the same definition ten times.

---

## Struggle 9: The Convoy Effect Didn't Feel Like a Real Issue

### The Problem

I memorized the definition:
"A long process delays many short processes."

But I kept thinking:
"So what? The short processes will eventually run anyway."

I couldn't understand why operating systems cared so much about it.

### My Debugging Process

I imagined a supermarket with only one billing counter.

One customer arrives with 200 items.
Ten customers behind him have only one item each.

Technically the system is fair because everyone is served in order. But practically, everyone except the first customer has a terrible experience.

That was exactly the convoy effect.

### The Fix

I realized that scheduling isn't only about correctness. It's also about **responsiveness** and **user experience**.

**My Observation:**
The "best" algorithm isn't always the simplest one. Sometimes fairness and speed matter more than strict order.

---

## Struggle 10: I Thought Context Switching Was Free

### The Problem

At first, I thought:
"If the OS can switch between processes so quickly, why not switch every millisecond?"

I assumed context switching had almost no cost.

### My Debugging Process

Then I learned what actually happens during a context switch:

1. Save registers
2. Save the program counter
3. Save process state in the PCB
4. Load the next process state
5. Restore registers and continue execution

The CPU isn't doing useful work during this time. It's just preparing to do useful work.

### The Fix

I started thinking of context switching like changing drivers in a race car. The switch is necessary, but while it's happening, the car isn't moving.

**My Observation:**
Many optimizations in computer science are trade-offs. Too few context switches reduce responsiveness. Too many create unnecessary overhead.

---

## Struggle 11: I Thought Mutex and Semaphore Were the Same Thing

### The Problem

Every article I read seemed to mention both mutexes and semaphores together.

At one point I honestly thought:
"Semaphore is just another word for mutex."

### My Debugging Process

I simplified it using a classroom example.

A mutex is like the key to a single classroom. Only one person can have the key at a time.

A counting semaphore is like having ten parking spaces. Multiple cars can enter until all spaces are occupied.

That distinction finally separated the two concepts in my head.

### The Fix

I wrote one sentence in my notes:

> **Mutex protects ownership. Semaphore manages availability.**

That single line became my revision shortcut.

**My Observation:**
Sometimes creating your own one-line explanation is more useful than copying an entire textbook paragraph.

---

## Struggle 12: The Producer-Consumer Problem Looked Like an Exam Question

### The Problem

I kept thinking:
"Nobody actually writes programs about producers and consumers."

It felt like one of those artificial examples invented only for textbooks.

### My Debugging Process

Then I started connecting it to things I use every day.

A YouTube livestream is a producer.
My video player is the consumer.
The video buffer between them is literally the shared buffer in the Producer-Consumer problem.

- If the producer is too slow, the buffer becomes empty.
- If the producer is too fast, the buffer fills up.

Suddenly the example didn't feel imaginary anymore.

### The Fix

I tried connecting every "classic OS problem" to a real application I already knew.

**My Observation:**
A lot of computer science examples sound unrealistic until you realize they're simplified versions of systems we use every day.

---

## Struggle 13: Page Replacement Algorithms Turned Into Alphabet Soup

### The Problem

FIFO. LRU. LFU. OPT.

After studying them all together, I kept forgetting which one removed the oldest page, which one removed the least recently used page, and which one needed future knowledge.

### My Debugging Process

I rewrote them in plain English.

| Algorithm | Plain English |
|-----------|--------------|
| FIFO | "Who came first?" |
| LRU | "Who have I ignored the longest?" |
| LFU | "Who have I barely talked to?" |
| OPT | "If I could see the future, who wouldn't I need again?" |

That translation made revision much easier.

### The Fix

I stopped memorizing abbreviations and started remembering the idea behind them.

**My Observation:**
If I can't explain a concept in simple words, I probably don't understand it well enough yet.

---

## Struggle 14: I Kept Treating Operating Systems as a Theory Subject

### The Problem

For the first couple of days, I approached OS the same way I used to prepare for school exams:
Read definition → Highlight important line → Memorize.

The result?
I could repeat definitions but couldn't answer simple "why" questions.

### My Debugging Process

I changed my study method completely.

For every topic, I forced myself to answer:

- Why does this exist?
- What problem does it solve?
- Where would I see this in the real world?
- How could this matter in cybersecurity?

That single habit made the subject much more interesting.

### The Fix

I stopped collecting definitions and started collecting **mental models**.

**My Observation:**
The biggest difference between memorizing and understanding is being able to connect a concept to a real-world problem.

---

## Struggle 15: I Didn't Expect Operating Systems to Be So Important for Cybersecurity

### The Problem

At the beginning of the week, I treated OS as just another computer science subject I needed to "get through" before reaching the interesting security topics.

Then I noticed something strange.

- Race conditions can become vulnerabilities.
- Memory management is connected to buffer overflows.
- System calls are monitored by EDR tools.
- Processes and threads are exactly what malware manipulates.

I realized I had been studying cybersecurity topics without understanding the foundation they depend on.

### My Debugging Process

Whenever I learned a new OS concept, I asked:
"How could an attacker abuse this?"

That simple question made the connections appear naturally.

### The Fix

Instead of treating OS as a separate subject, I started treating it as part of my **cybersecurity toolkit**.

**My Observation:**
The more I learn, the more I realize that cybersecurity is not separate from computer science — it is computer science applied to defending and attacking real systems.

---

## Week 02 Reflection on Struggles

Looking back, I didn't struggle because the topics were too difficult.
I struggled because I was carrying the wrong mental model.

- I thought programs ran one after another.
- I thought concurrency meant "everything happens together."
- I thought RAM had to contain an entire program.
- I thought scheduling algorithms were just formulas to memorize.

Every time I got stuck, the solution wasn't to read faster.
It was to stop, draw diagrams, build examples, and ask:

**"What problem was the operating system trying to solve?"**

That single question changed the way I approached every topic this week.

I didn't just learn Operating Systems.
I started seeing the computer as a collection of limited resources that need to be shared fairly, efficiently, and safely.

And honestly, that's a much more interesting way to think about computers than I had before. ⚙️🔐
