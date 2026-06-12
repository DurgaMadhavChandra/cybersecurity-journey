# Week 02 — Operating Systems Notes

---

## 1. What is an Operating System & Types of OS

### What is Software?

| Type | Definition | Example |
|------|-----------|---------|
| Application Software | Performs specific task for the user | Chrome, VLC |
| System Software | Operates and controls the computer system, provides platform to run apps | OS, Drivers |

### What is an Operating System?

A piece of software that manages all the resources of a computer system — both hardware and software — and provides an environment in which the user can execute programs in a convenient and efficient manner by hiding underlying complexity of the hardware and acting as a resource manager.

### Why OS? — What if there is no OS?

- Bulky and complex apps (hardware interaction code must be in the app's codebase)
- Resource exploitation by a single app
- No memory protection

### What is an OS made up of?

A collection of system software.

### OS Functions

| Function | Also Called |
|----------|------------|
| Access to computer hardware | — |
| Interface between user and hardware | — |
| Resource management (memory, device, file, security, process) | Arbitration |
| Hides the underlying complexity of hardware | Abstraction |
| Facilitates execution of application programs with isolation and protection | — |

### OS Goals

- Maximum CPU utilization
- Less process starvation
- Higher priority job execution

### Types of Operating Systems

| Type | Example | Key Feature |
|------|---------|------------|
| Single Process OS | MS-DOS (1981) | Only 1 process executes at a time from the ready queue |
| Batch Processing OS | ATLAS, Manchester Univ. (late 1950s–early 1960s) | Jobs grouped into batches by operator |
| Multiprogramming OS | THE, Dijkstra (early 1960s) | Multiple jobs in memory; CPU switches on I/O wait |
| Multitasking OS | CTSS, MIT (early 1960s) | Logical extension of multiprogramming; time sharing |
| Multi-processing OS | Windows NT | More than 1 CPU in a single computer |
| Distributed OS | LOCUS | Loosely connected autonomous nodes |
| Real Time OS (RTOS) | ATCS | Error-free computations within tight time boundaries |

### Batch Processing OS — How it works

1. User prepares job using punch cards
2. Submits job to computer operator
3. Operator collects jobs from different users and sorts into batches with similar needs
4. Operator submits batches to processor one by one
5. All jobs of one batch are executed together

**Drawbacks:**
- Priorities cannot be set if a job comes with higher priority
- May lead to starvation (a batch may take more time to complete)
- CPU may become idle in case of I/O operations

### Multiprogramming

Increases CPU utilization by keeping multiple jobs (code and data) in memory so that the CPU always has one to execute in case some job gets busy with I/O.

- Single CPU
- Context switching for processes
- Switch happens when current process goes to wait state
- CPU idle time reduced

### Multitasking

A logical extension of multiprogramming.

- Single CPU
- Able to run more than one task simultaneously
- Context switching and time sharing used
- Increases responsiveness
- CPU idle time is further reduced

### Multi-processing OS

More than 1 CPU in a single computer.

- Increases reliability — if 1 CPU fails, others can work
- Better throughput
- Lesser process starvation (if 1 CPU is working on a process, another process can execute on another CPU)

### Distributed OS

- OS manages many bunches of resources: ≥1 CPUs, ≥1 memory, ≥1 GPUs, etc.
- Loosely connected autonomous, interconnected computer nodes
- Collection of independent, networked, communicating, and physically separate computational nodes

### Real Time OS (RTOS)

- Real time error-free computations within tight time boundaries
- Examples: Air Traffic Control System, ROBOTS

---

## 2. Multitasking vs Multithreading

### Key Definitions

| Term | Definition | Storage |
|------|-----------|---------|
| Program | Executable file containing a set of instructions to complete a specific job | Stored on Disk (compiled code, ready to execute) |
| Process | Program under execution | Resides in Computer's primary memory (RAM) |
| Thread | Single sequence stream / independent path of execution within a process | Light-weight process |

### Thread — Key Points

- Single sequence stream within a process
- An independent path of execution in a process
- Light-weight process
- Used to achieve parallelism by dividing a process's tasks which are independent paths of execution
- Example: Multiple tabs in a browser; text editor where spell-checking, formatting, and saving happen concurrently by multiple threads

### Multitasking vs Multithreading — Comparison

| Feature | Multi-Tasking | Multi-Threading |
|---------|--------------|----------------|
| Definition | Execution of more than one task simultaneously | A process is divided into several sub-tasks (threads), each with its own path of execution |
| Context | More than 1 process being context switched | More than 1 thread; threads are context switched |
| No. of CPUs | 1 | ≥1 (better to have more than 1) |
| Memory | Isolation and memory protection exists. OS must allocate separate memory and resources to each program | No isolation and memory protection. Resources are shared among threads of that process |
| OS Allocation | OS allocates separate memory per program | OS allocates memory to process; multiple threads share the same memory and resources |

### Thread Context Switching vs Process Context Switching

| Thread Context Switching | Process Context Switching |
|------------------------|--------------------------|
| OS saves current state of thread & switches to another thread of the same process | OS saves current state of process & switches to another process by restoring its state |
| Does NOT include switching of memory address space (but Program Counter, registers & stack are included) | Includes switching of memory address space |
| Fast switching | Slow switching |
| CPU's cache state is preserved | CPU's cache state is flushed |

---

## 3. System Calls

### How do apps interact with the Kernel?

→ Using system calls.

### What is a System Call?

A mechanism using which a user program can request a service from the kernel which it does not have the permission to perform. User programs typically do not have permission to perform operations like accessing I/O devices or communicating with other programs.

> **System Calls are the only way through which a process can go into kernel mode from user mode.**

System calls are implemented in C.

### System Architecture

```
User Mode    →  [ User App ]
                    ↓
                [ Glibc ]
─────────────── Software Interrupt ───────────────
Kernel Mode  →  [ System Call Interface (SCI) ]
                    ↓
                [ Kernel ]
                    ↓
                [ Hardware ]
```

### Example — Creating a Process

1. User executes a process (User Space)
2. Gets system call (User Space)
3. Exec system call to create a process (Kernel Space)
4. Return to User Space

Transitions from User Space (US) to Kernel Space (KS) are done by **software interrupts**.

### Types of System Calls

| Category | Examples |
|----------|---------|
| Process Control | end, abort, load, execute, create/terminate process, get/set process attributes, wait, signal, allocate/free memory |
| File Management | create/delete file, open, close, read, write, reposition, get/set file attributes |
| Device Management | request/release device, read, write, reposition, get/set device attributes, attach/detach devices |
| Information Maintenance | get/set time or date, get/set system data, get/set process/file/device attributes |
| Communication Management | create/delete connection, send/receive messages, transfer status information, attach/detach remote devices |

### Windows vs Unix System Calls

| Category | Windows | Unix |
|----------|---------|------|
| Process Control | CreateProcess(), ExitProcess(), WaitForSingleObject() | fork(), exit(), wait() |
| File Management | CreateFile(), ReadFile(), WriteFile(), CloseHandle(), SetFileSecurity() | open(), read(), write(), close(), chmod(), umask(), chown() |
| Device Management | SetConsoleMode(), ReadConsole(), WriteConsole() | ioctl(), read(), write() |
| Information Management | GetCurrentProcessID(), SetTimer(), Sleep() | getpid(), alarm(), sleep() |
| Communication | CreatePipe(), CreateFileMapping(), MapViewOfFile() | pipe(), shmget(), mmap() |

---

## 4. 32-Bit vs 64-Bit Operating Systems

### Core Differences

| Feature | 32-bit OS | 64-bit OS |
|---------|----------|----------|
| Register size | 32-bit registers | 64-bit registers |
| Addressable memory | 2^32 addresses = 4 GB | 2^64 addresses = ~17.18 billion GB |
| Data processing | 32 bits per instruction cycle | 64 bits per instruction cycle |
| Can run 32-bit OS? | Yes | Yes |
| Can run 64-bit OS? | No | Yes |

### Advantages of 64-bit over 32-bit

**a. Addressable Memory**
32-bit CPU → 2^32 memory addresses; 64-bit CPU → 2^64 memory addresses.

**b. Resource Usage**
Installing more RAM on a 32-bit system doesn't impact performance. Upgrading to a 64-bit OS allows the system to actually use that extra RAM.

**c. Performance**
All calculations take place in registers. A 32-bit processor can execute 4 bytes of data in 1 instruction cycle while a 64-bit processor can execute 8 bytes per instruction cycle.

**d. Compatibility**
A 64-bit CPU can run both 32-bit and 64-bit OS. A 32-bit CPU can only run 32-bit OS.

**e. Better Graphics Performance**
8-byte graphics calculations make graphics-intensive apps run faster.

---

## 5. Storage Devices Basics

### Memory Hierarchy (Top = Fastest & Most Expensive)

```
Register         ┐
Cache            ├── Primary Memory
Main Memory      ┘
Electronic Disk  ┐
Magnetic Disk    │
Optical Disk     ├── Secondary Memory
Magnetic Tapes   ┘
```

### Types of Memory

| Type | Definition |
|------|-----------|
| Register | Smallest unit of storage. Holds an instruction, storage address, or data. Used to quickly accept, store, and transfer data being used immediately by the CPU |
| Cache | Additional memory system that temporarily stores frequently used instructions and data for quicker processing by the CPU |
| Main Memory | RAM |
| Secondary Memory | Storage media on which the computer can store data and programs |

### Comparison

| Feature | Primary (Registers/Cache/RAM) | Secondary |
|---------|------------------------------|-----------|
| Cost | Costly (Registers most expensive) | Cheaper |
| Access Speed | Higher (Registers fastest, then Cache, then Main Memory) | Lower |
| Storage Size | Less | More |
| Volatility | Volatile (data lost on power off) | Non-volatile |

---

## 6. Introduction to Process

### Key Questions

| Question | Answer |
|----------|--------|
| What is a program? | Compiled code, ready to execute |
| What is a process? | Program under execution |
| How does OS create a process? | Converting program into a process |

### Steps OS Takes to Create a Process

1. Load the program & static data into memory
2. Allocate runtime stack
3. Heap memory allocation
4. I/O tasks
5. OS hands off control to main()

### Architecture of a Process (Memory Layout)

| Section | Contents |
|---------|---------|
| Stack | Local variables, function arguments & return values |
| (Free space) | — |
| Heap | Dynamically allocated variables |
| Data | Global & static data |
| Text | Compiled code (loaded from disk) |

### Attributes of a Process — PCB

All processes are tracked by the OS using a **Process Table**. Each entry is a **Process Control Block (PCB)** — a data structure storing information/attributes of a process.

| Field | Purpose |
|-------|---------|
| Process ID | Unique identifier |
| Program Counter (PC) | Next instruction address of the program |
| Process State | Stores current process state |
| Priority | Based on priority, a process gets CPU time |
| Registers | Saved when process is swapped out; restored when it runs again |
| List of Open Files | — |
| List of Open Devices | — |

**Registers in the PCB:** When a process's time slice expires, the current value of process-specific registers is stored in the PCB and the process is swapped out. When the process is scheduled to run again, the register values are read from the PCB and written to the CPU registers.

---

## 7. Different Process States

### Process States

| State | Description |
|-------|-------------|
| New | OS is about to pick the program and convert it into a process. The process is being created. |
| Ready | The process is in memory, waiting to be assigned to a processor |
| Running | Instructions are being executed; CPU is allocated |
| Waiting | Waiting for I/O or an event |
| Terminated | The process has finished execution. PCB entry removed from process table. |

### Process State Diagram

```
                    admitted                    interrupt              exit
  [ new ] ──────────────→ [ ready ] ←──────────────────── [ running ] ──────→ [ terminated ]
                               ↑         scheduler dispatch ↓
                               │                 ↓
                   I/O or      │           [ waiting ]
                event          └──────────────────↑
                completion           I/O or event wait
```

**Transitions:**
- new → ready: admitted
- ready → running: scheduler dispatch
- running → ready: interrupt
- running → waiting: I/O or event wait
- waiting → ready: I/O or event completion
- running → terminated: exit

---

## 8. Process Queues & Schedulers

### Process Queues

| Queue | Processes In | Location | Managed By |
|-------|-------------|----------|------------|
| Job Queue | New state processes | Secondary memory | Long Term Scheduler (LTS) / Job Scheduler |
| Ready Queue | Ready state processes | Main memory | Short Term Scheduler (STS) / CPU Scheduler |
| Waiting Queue | Wait state processes | Main memory | — |

### Schedulers

**Long Term Scheduler (LTS) / Job Scheduler**
Picks processes from the pool (secondary memory) and loads them into main memory for execution. Controls the degree of multi-programming.

**Short Term Scheduler (STS) / CPU Scheduler**
Picks a process from the ready queue and dispatches it to the CPU.

**Degree of Multi-programming**
The number of processes in memory at a given time. LTS controls the degree of multi-programming.

**Dispatcher**
The module of the OS that gives control of the CPU to a process selected by the STS.

---

## 9. Context Switching

Switching the CPU to another process requires performing a **state save** of the current process and a **state restore** of a different process.

- The kernel saves the context of the old process in its PCB and loads the saved context of the new process scheduled to run
- It is **pure overhead** — the system does no useful work while switching
- Speed varies from machine to machine, depending on memory speed and the number of registers that must be copied

---

## 10. Swapping

A time-sharing system may have a **Medium Term Scheduler (MTS)** that removes processes from memory to reduce the degree of multi-programming. These removed processes can be reintroduced into memory and their execution continued from where it left off. This is called **Swapping**.

- Swap-out and swap-in are done by the MTS
- Swapping is necessary to improve process mix or when memory requirements have overcommitted available memory
- A process can be swapped temporarily out of main memory to secondary storage (disk), making that memory available to other processes

### Swapping Flow

```
Partially executed                     
swapped-out processes ←──────────── Swap-out
        │
     Swap-in
        ↓
  [ Ready Queue ] ──────→ [ CPU ] ──→ end
        ↑
  [ I/O waiting queue ] ←── [ I/O ]
```

---

## 11. Orphan & Zombie Processes

### Orphan Process

- A process whose parent process has been terminated and it is still running
- Orphan processes are adopted by the **init process**
- Init is the first process of the OS

---

## 12. CPU Scheduling

### Why CPU Scheduling Exists

In a multiprogramming OS, many processes are kept in memory at the same time. However, the CPU can execute only one process at a given instant (assuming a single-core processor). If a running process needs to perform an I/O operation or if its allotted CPU time expires, the OS should not leave the CPU idle. Instead, it temporarily pauses the current process and gives the CPU to another ready process. This decision-making mechanism is called **CPU Scheduling**.

### CPU Scheduler (Short Term Scheduler)

The component responsible for making this decision is called the **CPU Scheduler** or **Short Term Scheduler (STS)**. Whenever the CPU becomes idle, the STS selects one process from the Ready Queue and dispatches it for execution.

### Goals of CPU Scheduling

- Maximize CPU utilization
- Reduce waiting time for processes
- Reduce turnaround time
- Improve system throughput
- Minimize response time so that users feel the system is responsive

### Important Scheduling Terms

| Term | Meaning |
|------|---------|
| Arrival Time (AT) | Time at which a process enters the Ready Queue |
| Burst Time (BT) | Amount of CPU time required by the process |
| Completion Time (CT) | Time at which the process finishes execution |
| Turnaround Time (TAT) | Total time from arrival to completion. **TAT = CT − AT** |
| Waiting Time (WT) | Time spent waiting in the Ready Queue. **WT = TAT − BT** |
| Response Time (RT) | Time taken for the process to get the CPU for the first time |
| Throughput | Number of processes completed per unit time |

---

## 13. CPU Scheduling Algorithms

### First Come First Serve (FCFS)

The simplest scheduling algorithm. Whichever process enters the Ready Queue first gets the CPU first — same as standing in a queue at a ticket counter.

**Advantages:**
- Very simple to implement
- Fair because it respects arrival order

**Disadvantages:**
- A long process at the front of the queue can delay many smaller processes
- Average waiting time can become very high

**Convoy Effect**

One long CPU-bound process gets the CPU first, forcing many short processes to wait behind it. Short jobs form a *convoy* behind the long one, resulting in poor resource utilization.

> Similar to a traffic jam near a toll gate — one slow truck creates a long queue of faster cars.

---

### Shortest Job First (SJF)

The process with the smallest **Burst Time (BT)** is selected for execution first. Complete shorter tasks first so that average waiting time decreases.

**Non-Preemptive SJF**

Once a process starts executing, it continues until it finishes or enters the waiting state. Even if a shorter process arrives, the CPU will not be taken away.

- Process with the least Burst Time gets the CPU first
- Burst Time of each process should be known or estimated beforehand
- Produces lower average waiting time than FCFS
- May lead to starvation if short jobs keep arriving

**Preemptive SJF — Shortest Remaining Time First (SRTF)**

If a new process arrives whose remaining Burst Time is smaller than the currently running process, the OS immediately preempts the current process.

- Better average waiting time
- Reduces the Convoy Effect
- More context switching overhead
- Burst Time estimation is difficult in practice

---

### Priority Scheduling

Each process is assigned a priority value. The CPU is allocated to the process with the **highest priority**.

**Non-Preemptive Priority Scheduling**
Once a process gets the CPU, it continues execution until completion, even if a higher-priority process arrives later.

**Preemptive Priority Scheduling**
If a newly arrived process has a higher priority than the currently running process, the OS immediately preempts the current process.

**Starvation**
A low-priority process may wait indefinitely if higher-priority processes keep arriving.

**Ageing**
To overcome starvation — the priority of a process gradually increases the longer it waits in the Ready Queue. Eventually, even a low-priority process gets a chance to execute.

---

### Round Robin (RR) Scheduling

Every process is given a fixed amount of CPU time called the **Time Quantum (TQ)**. If a process does not finish within its Time Quantum, it is preempted and moved to the end of the Ready Queue.

**Working:**
1. Processes enter the Ready Queue
2. The first process gets the CPU for one Time Quantum
3. If the process completes, it leaves the system; otherwise it is placed at the end of the queue
4. The cycle repeats

**Advantages:**
- Fair allocation of CPU time
- Very low chance of starvation
- Suitable for interactive systems
- Good responsiveness for users

**Disadvantages:**
- Too small a Time Quantum → increases context switching overhead
- Too large a Time Quantum → behaves almost like FCFS

---

### Comparing Scheduling Algorithms

| Algorithm | Preemptive | Convoy Effect | Starvation | Complexity |
|-----------|-----------|--------------|------------|-----------|
| FCFS | No | Yes | Low | Simple |
| SJF | No | Yes | Possible | Moderate |
| Preemptive SJF | Yes | No | Less | Complex |
| Priority | No | Yes | Possible | Moderate |
| Preemptive Priority | Yes | Possible | Possible | Complex |
| Round Robin | Yes | No | Very Low | Simple |

> There is no *perfect* scheduling algorithm. Every algorithm tries to optimize one thing but sacrifices another.

---

## 14. Multi-Level Queue (MLQ) and Multi-Level Feedback Queue (MLFQ)

### Multi-Level Queue Scheduling (MLQ)

The Ready Queue is divided into multiple sub-queues based on the type or priority of processes.

**Common categories:**
- **System Processes (SP):** Created by the OS. Highest priority.
- **Interactive Processes (IP):** Require user interaction.
- **Batch Processes (BP):** Run in the background without user input.

Each queue can use its own scheduling algorithm (e.g., System Queue → Round Robin; Batch Queue → FCFS). A process is **permanently assigned** to one queue and cannot move between queues.

**Limitation:** Lower-priority queues may suffer from starvation because higher-priority queues are always served first.

---

### Multi-Level Feedback Queue (MLFQ)

MLFQ improves MLQ by allowing processes to **move between queues**.

- A CPU-intensive process may gradually move to a lower-priority queue
- An interactive or I/O-bound process remains in a higher-priority queue
- A process waiting too long can be promoted to a higher-priority queue through Ageing

This flexibility reduces starvation and improves overall system responsiveness. Modern operating systems such as Windows and Linux use scheduling policies inspired by MLFQ.

---

## 15. Concurrency and Threads

### What is Concurrency?

Concurrency refers to the execution of multiple instruction sequences during the same period of time. Several processes and threads may appear to run simultaneously because the CPU rapidly switches between them. The goal of concurrency is to improve resource utilization and system responsiveness.

### What is a Thread?

A Thread is a single sequence of execution within a process. It is often called a **light-weight process** because creating and switching between threads is less expensive than creating and switching between separate processes. A process can contain multiple threads, all of which share the same memory and resources.

**Examples:**
- Multiple tabs in a web browser
- A text editor that performs typing, auto-saving, and spell checking simultaneously
- A music player that continues playback while downloading album artwork

### Thread Context Switching

When switching between threads of the same process:
- The OS saves the Program Counter, registers, and stack information
- Memory address space is **not** switched — all threads share the same process memory
- CPU cache is generally preserved
- Makes thread switching much **faster** than process switching

### Benefits of Multi-threading

| Benefit | Description |
|---------|-------------|
| Responsiveness | One thread can continue running while another waits for I/O |
| Resource Sharing | Threads share memory and resources, making communication easier |
| Economy | Creating a thread is cheaper than creating a new process |
| Multi-core Utilization | Different threads can execute simultaneously on different CPU cores |

---

## 16. Process Synchronization and Critical Section

### Why Process Synchronization is Needed

Running multiple processes or threads at the same time creates a challenge — it is not just about giving everyone CPU time, but also making sure they don't interfere with each other while sharing resources. **Process synchronization** is a collection of techniques used to maintain the consistency and correctness of shared data when multiple processes or threads execute concurrently.

### Critical Section

A **Critical Section (CS)** is the part of a program where shared resources are accessed or modified. Shared resources may include: shared variables, files, memory, databases, hardware devices.

**Example:** Two ATM machines connected to the same bank account. Both users try to withdraw money at the same time. If the balance update is not synchronized, both transactions may succeed even though the account has insufficient funds. The balance update operation is the critical section.

### Race Condition

A **Race Condition** occurs when two or more processes or threads access and modify shared data simultaneously, and the final result depends on the order in which they execute.

**Example:**
```
Shared variable: count = 10

Thread A reads count = 10
Thread B reads count = 10
Thread A increments → writes 11
Thread B increments → writes 11

Expected result: 12    Actual result: 11
```

### How to Prevent Race Conditions

| Technique | Description |
|-----------|-------------|
| Atomic Operations | Executes completely in one step without interruption |
| Mutual Exclusion (Mutex) | Only one process can enter the critical section at a time |
| Semaphores | Synchronization mechanism to coordinate access to shared resources |

### Peterson's Solution

One of the earliest software-based solutions to the critical section problem. Works correctly for only **two processes or two threads**. Both processes indicate their intention to enter the critical section; a shared variable called `turn` decides whose turn it is. Demonstrates that synchronization can be achieved purely through software.

### Mutex (Locks)

A **Mutex (Mutual Exclusion Lock)** — before entering the critical section, a process must acquire the lock. After completing its work, the process releases the lock.

**Advantages:**
- Prevents multiple processes from accessing shared data simultaneously
- Simple and widely used

**Limitations:**

| Limitation | Description |
|-----------|-------------|
| Busy Waiting | Other processes continuously wait, wasting CPU cycles |
| Deadlock | If a process acquires a lock but never releases it, others remain blocked forever |
| Debugging Difficulty | Synchronization bugs are often difficult to reproduce |
| Starvation | Low-priority threads may wait a very long time before obtaining the lock |

### Condition Variables

A **Condition Variable** allows a thread to sleep until a particular condition becomes true. Used together with a lock.

**Working:**
1. A thread acquires the lock
2. If the required condition is not satisfied, it enters the waiting state and automatically releases the lock
3. Another thread updates the shared resource and signals the waiting thread
4. The waiting thread wakes up, reacquires the lock, and continues execution

> Biggest advantage: avoids busy waiting.

---

## 17. Semaphores and Classical Synchronization Problems

### What is a Semaphore?

An integer variable used by the OS to coordinate access to shared resources. Can only be modified through two special **atomic** operations:

- `wait()` **(P operation)** → Requests access to a resource
- `signal()` **(V operation)** → Releases the resource and notifies waiting processes

### Types of Semaphores

| Type | Description |
|------|-------------|
| Counting Semaphore | Can take any non-negative integer value. Used when multiple identical resources are available (e.g., 5 printers → semaphore starts at 5) |
| Binary Semaphore (Mutex) | Values: 0 (unavailable) or 1 (available). Allows only one process to access the critical section at a time |

---

### Producer-Consumer Problem

A **Producer** generates items and places them into a shared buffer. A **Consumer** removes items from the same buffer.

**Conditions to avoid:**
- Producer should not insert an item if the buffer is already full
- Consumer should not remove an item if the buffer is empty

**Solution using Semaphores:**

| Semaphore | Purpose |
|-----------|---------|
| `empty` | Counts available empty buffer slots |
| `full` | Counts filled buffer slots |
| `mutex` | Ensures mutual exclusion while accessing the buffer |

---

### Reader-Writer Problem

Deals with a shared resource that can be read by multiple processes but written by only one process at a time.

- Multiple readers can read simultaneously
- Only one writer can write at any given time
- While a writer is writing, no reader is allowed to read

---

### Dining Philosophers Problem

Five philosophers sit around a circular table. Between every pair of philosophers lies one fork. Each philosopher needs two forks to eat. If every philosopher picks up the left fork first and waits for the right fork, no one can proceed — **deadlock**.

**Common Solutions:**
- Allow at most four philosophers to sit at the table simultaneously
- Allow a philosopher to pick up forks only if both are available
- Asymmetric strategy: odd-numbered philosophers pick left fork first; even-numbered pick right fork first

---

## 18. Deadlocks and Resource Allocation

### What is a Deadlock?

A situation where two or more processes are waiting for resources held by each other, and as a result, **none of them can continue execution**.

> Every process is waiting for another process to release a resource, but no one can move forward.

### How a Process Uses a Resource

1. **Request** — Process requests access. If free, OS allocates it; otherwise, the process waits.
2. **Use** — Process performs its task using the resource.
3. **Release** — Process releases the resource after completing the task.

### Necessary Conditions for Deadlock

All four conditions must hold simultaneously. Removing even one prevents deadlock.

| Condition | Description |
|-----------|-------------|
| Mutual Exclusion | At least one resource must be non-shareable; only one process can use it at a time |
| Hold and Wait | A process holds one resource while waiting to acquire another held by another process |
| No Preemption | Resources cannot be forcibly taken away; they can only be released voluntarily |
| Circular Wait | A circular chain of waiting processes: P1 → P2 → P3 → P1 |

### Methods for Handling Deadlocks

| Method | Description |
|--------|-------------|
| Deadlock Prevention | Ensure at least one of the four conditions never holds |
| Deadlock Avoidance | Check every resource request; grant only if the system remains in a safe state |
| Deadlock Detection & Recovery | Allow deadlocks to occur, detect them, then recover |

### Safe State vs Unsafe State

**Safe State:** A safe sequence exists in which all processes can complete their execution without causing a deadlock.

**Unsafe State:** The OS cannot guarantee that all processes will complete safely. An unsafe state does not necessarily mean the system is already deadlocked — but it has the *potential* to become deadlocked.

### Banker's Algorithm

A famous deadlock avoidance technique proposed by **Edsger Dijkstra**. Similar to how a bank manages loans — does not lend all available money at once to ensure it can satisfy future demands.

**Working:**
1. OS temporarily assumes the resources are allocated
2. Checks whether the resulting state remains safe
3. If a safe sequence exists → allocation is confirmed
4. Otherwise → process is forced to wait

### Deadlock Detection

**Single instance of each resource:** Use a **Wait-For Graph**. Nodes represent processes; a directed edge from P1 to P2 means P1 is waiting for a resource held by P2. A **cycle = deadlock**.

**Multiple instances of resources:** Algorithms similar to the Banker's Algorithm are used.

### Recovery from Deadlock

| Method | Description |
|--------|-------------|
| Process Termination | Abort all deadlocked processes, or abort one at a time until the cycle is broken |
| Resource Preemption | Temporarily take resources away from one process and allocate them to another until deadlock is resolved |

---

## 19. Memory Management

### Why Memory Management is Important

In a multiprogramming environment, the OS must decide:
- Where each process should be placed
- How much memory should be allocated
- How memory should be shared efficiently
- How to avoid wasting memory

### Logical Address vs Physical Address

| Type | Description |
|------|-------------|
| Logical Address (Virtual Address) | Generated by the CPU. Used by the process while executing. Does not directly represent an actual location in RAM. |
| Physical Address | Represents the actual location in main memory (RAM). Loaded into the Memory Address Register. Users cannot directly access physical addresses. |

### Memory Management Unit (MMU)

The conversion from logical address to physical address is performed by the **MMU** — a hardware component that acts like a translator between the CPU and main memory.

```
CPU → (Logical Address) → MMU → (Physical Address) → Main Memory (RAM)
```

### Memory Allocation

**Fixed Partitioning**
Main memory is divided into several fixed-size partitions before execution begins. Each partition holds only one process.
- Advantages: Simple to implement; easy allocation
- Limitation: Wastes memory if process size < partition size; limits number of processes

**Internal Fragmentation**
The unused space *inside* an allocated partition (e.g., partition = 100 MB, process = 70 MB → 30 MB wasted).

**Dynamic Partitioning**
Partition sizes are not fixed beforehand. Memory is allocated according to the actual size of the process.
- Advantages: Better utilization; no internal fragmentation; supports varying process sizes

**External Fragmentation**
Over time, free memory becomes divided into many small scattered blocks (holes). Even if total free memory is sufficient, there may not be one large continuous block available.

---

## 20. Free Space Management

### Why Free Space Management is Needed

As processes are created and terminated, free memory gets scattered into many small pieces. The OS must track free spaces and decide how to use them efficiently.

### Compaction (Defragmentation)

All occupied memory blocks are moved together and all scattered free spaces are combined into one large contiguous free block.

- **Advantage:** Reduces or eliminates external fragmentation
- **Disadvantage:** Moving processes in memory takes time; system performance temporarily decreases

### Free List

A linked list that stores information about all available free holes in memory.
- Process terminates → its memory block is added back to the Free List
- New process arrives → OS searches the Free List for a suitable block

### Memory Allocation Strategies

| Strategy | Description | Advantage | Disadvantage |
|----------|-------------|-----------|-------------|
| First Fit | Allocates the first hole large enough | Simple, fast, low search time | Small holes accumulate near the beginning |
| Next Fit | Starts searching from where the previous allocation ended | Faster than First Fit; distributes usage evenly | — |
| Best Fit | Allocates the smallest hole that is big enough | Smallest leftover block | Creates many tiny unusable holes; must scan entire list |
| Worst Fit | Allocates the largest available hole | Leaves larger remaining blocks | May waste large blocks; must scan entire list |

---

## 21. Paging and Segmentation

### Why Paging Was Introduced

Dynamic partitioning improved memory utilization, but external fragmentation remained a serious problem. Paging allows a process to be divided into smaller fixed-size pieces — **a process does not need to occupy one continuous block of physical memory**.

### Paging

- **Physical Memory** is divided into fixed-size blocks called **Frames**
- **Logical (Virtual) Memory** is divided into blocks of the same size called **Pages**
- Since pages and frames are of equal size, any page can be loaded into any available frame

**Page Table**
The OS maintains a Page Table that maps: `Logical Page Number → Physical Frame Number`

Whenever the CPU generates a logical address, the MMU consults the Page Table and converts it into the correct physical address.

**Advantages:**
- Eliminates external fragmentation
- Allows efficient use of available memory
- Processes do not require contiguous physical memory

**Limitation:** May still suffer from **Internal Fragmentation** — the last page of a process may not completely fill its assigned frame.

---

### Segmentation

Unlike paging, Segmentation divides a program according to the programmer's **logical view**. A program consists of different parts (main program, functions, stack, heap, data section) — each treated as a separate segment.

**Segment Table**
Each entry contains:
- **Base Address** — starting location
- **Limit** — size of the segment

Physical address = Base Address + Offset

---

### Paging vs Segmentation

| Feature | Paging | Segmentation |
|---------|--------|-------------|
| Division | Fixed-size blocks | Variable-size logical units |
| Memory Unit | Pages and Frames | Segments |
| Fragmentation | Internal | External |
| User View | Transparent to programmer | Visible to programmer |

---

## 22. Virtual Memory and Page Replacement

### What is Virtual Memory?

A memory management technique that allows a process to execute even if it is **not completely loaded into main memory**. The OS gives each process the illusion that it has access to a large continuous memory space, even though only a part of it is actually present in RAM.

### Demand Paging

Pages are loaded into memory **only when they are actually needed**. Unused pages remain stored on secondary storage (disk), improving memory utilization.

### Page Fault

Occurs when a process tries to access a page not currently present in physical memory.

1. The CPU generates a page fault interrupt
2. The OS pauses the process
3. The required page is loaded from disk into RAM
4. Execution resumes

> Excessive page faults reduce system performance.

### Page Replacement Algorithms

When memory is full and a new page must be loaded, the OS must decide which existing page to remove.

| Algorithm | Description | Limitation |
|-----------|-------------|-----------|
| FIFO | Removes the page that has been in memory the longest | May suffer from Belady's Anomaly |
| Optimal (OPT) | Replaces the page not needed for the longest time in the future | Cannot be implemented in practice (requires future knowledge) — used as benchmark |
| LRU | Replaces the page not used for the longest time in the past | Generally performs well; approximates optimal |
| LFU | Removes the page accessed the fewest number of times | May keep old heavily-used pages unnecessarily |

---

## 23. Thrashing

### What is Thrashing?

A process is said to be **thrashing** if it spends more time handling page faults and swapping pages than actually executing instructions. The CPU remains busy managing memory rather than doing useful work.

### Why Does Thrashing Occur?

The process does not have enough memory frames allocated to hold its actively used pages.

```
Page loaded → another page immediately removed
→ removed page needed again → another page fault
→ cycle repeats continuously
```

### Effects of Thrashing

- CPU utilization drops sharply
- Page fault rate becomes very high
- Overall system performance degrades
- OS may incorrectly assume CPU utilization is low and add more processes, making the problem worse

### Solutions to Thrashing

**Working Set Model**
The OS keeps track of the pages actively used by a process (its **Working Set**) and ensures enough frames are allocated for those pages.

**Page Fault Frequency (PFF)**

| Condition | Action |
|-----------|--------|
| Page faults too high | Allocate more frames to the process |
| Page faults very low | Take away some frames and assign them elsewhere |
