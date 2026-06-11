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

### Thread Scheduling

Threads are scheduled for execution based on their priority. Even though threads are executing within the runtime, all threads are assigned processor time slices by the operating system.

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

### Example — mkdir laks

- `mkdir` indirectly calls kernel and asks the file management module to create a new directory
- `mkdir` is just a wrapper of actual system calls
- `mkdir` interacts with kernel using system calls

### Example — Creating a Process

1. User executes a process (User Space)
2. Gets system call (User Space)
3. Exec system call to create a process (Kernel Space)
4. Return to User Space

**Transitions from User Space (US) to Kernel Space (KS) are done by software interrupts.**

System calls are implemented in C.

### What is a System Call?

A mechanism using which a user program can request a service from the kernel which it does not have the permission to perform. User programs typically do not have permission to perform operations like accessing I/O devices or communicating with other programs.

**System Calls are the only way through which a process can go into kernel mode from user mode.**

### System Architecture Diagram

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

### Types of System Calls

**1. Process Control**
- end, abort
- load, execute
- create process, terminate process
- get/set process attributes
- wait for time
- wait event, signal event
- allocate and free memory

**2. File Management**
- create file, delete file
- open, close
- read, write, reposition
- get/set file attributes

**3. Device Management**
- request device, release device
- read, write, reposition
- get/set device attributes
- logically attach or detach devices

**4. Information Maintenance**
- get/set time or date
- get/set system data
- get/set process, file, or device attributes

**5. Communication Management**
- create, delete communication connection
- send, receive messages
- transfer status information
- attach or detach remote devices

### Windows vs Unix System Calls — Examples

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
All calculations take place in registers. Larger registers allow larger calculations at the same time. A 32-bit processor can execute 4 bytes of data in 1 instruction cycle while a 64-bit processor can execute 8 bytes per instruction cycle. (In 1 second, there could be thousands to billions of instruction cycles depending on processor design.)

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

a. Load the program & static data into memory
b. Allocate runtime stack
c. Heap memory allocation
d. I/O tasks
e. OS hands off control to main()

### Architecture of a Process (Memory Layout)

| Section | Contents |
|---------|---------|
| Stack | Local variables, function arguments & return values |
| (Free space) | — |
| Heap | Dynamically allocated variables |
| Data | Global & static data |
| Text | Compiled code (loaded from disk) |

### Attributes of a Process

- Feature that allows identifying a process uniquely
- **Process Table** → All processes are tracked by OS using a table-like data structure. Each entry in that table is a Process Control Block (PCB)
- **PCB** → Stores info/attributes of a process. Data structure used for each process, storing information such as process id, program counter, process state, priority, etc.

### PCB Structure

| Field | Purpose |
|-------|---------|
| Process ID | Unique identifier |
| Program Counter (PC) | Next instruction address of the program |
| Process State | Stores process state |
| Priority | Based on priority a process gets CPU time |
| Registers | — |
| List of Open Files | — |

---

Here are the additional notes from these 4 images, continuing from where we left off yesterday:

---

### PCB — Registers Field 

**Registers in the PCB** is a data structure. When a process is running and its time slice expires, the current value of process-specific registers is stored in the PCB and the process is swapped out. When the process is scheduled to run again, the register values are read from the PCB and written to the CPU registers. This is the main purpose of the registers in the PCB.

### Full PCB Structure

| Field | Purpose |
|-------|---------|
| Process ID | Unique identifier |
| Program Counter (PC) | Next instruction address of the program |
| Process State | Stores process state |
| Priority | Based on priority, a process gets CPU time |
| Registers | Saved when process is swapped out; restored when it runs again |
| List of Open Files | — |
| List of Open Devices | — |

---

## 7. Different Process States

### Process States

As a process executes, it changes state. Each process may be in one of the following states:

| State | Description |
|-------|-------------|
| New | OS is about to pick the program and convert it into a process. The process is being created. |
| Ready | The process is in memory, waiting to be assigned to a processor |
| Running | Instructions are being executed; CPU is allocated |
| Waiting | Waiting for I/O or an event |
| Terminated | The process has finished execution. PCB entry removed from process table. |

### Process State Diagram

```
                    admitted          interrupt            exit
  [ new ] ──────────────→ [ ready ] ←──────── [ running ] ──────→ [ terminated ]
                              ↑     scheduler dispatch ↓
                              │          ↓
                    I/O or    │      [ waiting ]
                 event        └──────────↑
                 completion      I/O or event wait
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

**Long Term Scheduler (LTS) / Job Scheduler:**
Picks processes from the pool (secondary memory) and loads them into main memory for execution. Controls the degree of multi-programming.

**Short Term Scheduler (STS) / CPU Scheduler:**
Picks a process from the ready queue and dispatches it to the CPU.

### Degree of Multi-programming
The number of processes in memory at a given time. LTS controls the degree of multi-programming.

### Dispatcher
The module of the OS that gives control of the CPU to a process selected by the STS.

---

## 9. Context Switching

### What is Context Switching?

Switching the CPU to another process requires performing a state save of the current process and a state restore of a different process.

- When this occurs, the kernel saves the context of the old process in its PCB and loads the saved context of the new process scheduled to run
- It is pure overhead — the system does no useful work while switching
- Speed varies from machine to machine, depending on memory speed and the number of registers that must be copied

---

## 10. Swapping

### What is Swapping?

A time-sharing system may have a Medium Term Scheduler (MTS) that removes processes from memory to reduce the degree of multi-programming. These removed processes can be reintroduced into memory and their execution can be continued from where it left off. This is called **Swapping**.

- Swap-out and swap-in are done by the MTS
- Swapping is necessary to improve process mix or when a change in memory requirements has overcommitted available memory, requiring memory to be freed up
- Swapping is a mechanism in which a process can be swapped temporarily out of main memory to secondary storage (disk), making that memory available to other processes. At some later time, the system swaps the process back from secondary storage to main memory

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
- Orphan processes are adopted by the init process
- Init is the first process of the OS

---

## CPU Scheduling

Why **CPU** Scheduling Exists

In a multiprogramming operating system, many processes are kept in memory at the same time. However, the **CPU** can execute only one process at a given instant (assuming a single-core processor). If a running process needs to perform an I/O operation or if its allotted **CPU** time expires, the operating system should not leave the **CPU** idle.

Instead, it temporarily pauses the current process and gives the **CPU** to another ready process. This decision-making mechanism is called **CPU** Scheduling.

In simple words, **CPU** scheduling is the operating system's way of deciding:

*Which process should run next?*

This is one of the main reasons why modern operating systems can run multiple applications smoothly at the same time.

**CPU** Scheduler (Short Term Scheduler)

The component responsible for making this decision is called the **CPU** Scheduler or Short Term Scheduler (**STS**).

Whenever the **CPU** becomes idle, the **STS** selects one process from the Ready Queue and dispatches it for execution.

Goals of **CPU** Scheduling

A good scheduling algorithm tries to:

Maximize **CPU** utilization.
Reduce waiting time for processes.
Reduce turnaround time.
Improve system throughput.
Minimize response time so that users feel the system is responsive.
### Important Scheduling Terms
Term	Meaning
Arrival Time (AT)	Time at which a process enters the Ready Queue.
Burst Time (BT)	Amount of **CPU** time required by the process.
Completion Time (CT)	Time at which the process finishes execution.
Turnaround Time (**TAT**)	Total time from arrival to completion. **TAT** = CT - AT
Waiting Time (WT)	Time spent waiting in the Ready Queue. WT = **TAT** - BT
Response Time (RT)	Time taken for the process to get the **CPU** for the first time.
Throughput	Number of processes completed per unit time.
### My Understanding

Initially, I memorized formulas like **TAT** = CT - AT and WT = **TAT** - BT, but they did not make much sense. What helped me was thinking about a hospital.

Arrival Time → When a patient enters the hospital. Burst Time → Time the doctor needs to treat the patient. Waiting Time → Time the patient spends waiting outside. Completion Time → When the patient leaves after treatment. Turnaround Time → Total time spent in the hospital.

Thinking of the Ready Queue as a waiting room made these concepts much easier to understand.

Real-World Connection

Every time I open Chrome, VS Code, Spotify, and a browser tab with YouTube together, all of these applications appear to run simultaneously. In reality, the operating system is rapidly switching the **CPU** between hundreds of different processes and threads using scheduling algorithms.

Without **CPU** scheduling, one application could easily occupy the **CPU** while every other application waits.

## CPU Scheduling Algorithms

First Come First Serve (**FCFS**)

The simplest scheduling algorithm is First Come First Serve (**FCFS**). As the name suggests, whichever process enters the Ready Queue first gets the **CPU** first.

It follows the same principle as standing in a queue at a ticket counter—people are served in the order they arrive.

Advantages:

Very simple to implement. Fair because it respects arrival order.

Disadvantages:

A long process at the front of the queue can delay many smaller processes. Average waiting time can become very high. ### Convoy Effect

One interesting concept I learned this week is the Convoy Effect.

It happens when one long **CPU**-bound process gets the **CPU** first, forcing many short processes to wait behind it. The short jobs form a *convoy* behind the long one.

This results in poor resource utilization because while short tasks are waiting, devices like I/O systems may remain underutilized.

### My Observation

When I first read about the Convoy Effect, it reminded me of traffic jams near a toll gate. One overloaded truck moving slowly can create a long line of cars behind it, even though the cars themselves could have moved much faster. **FCFS** behaves in a very similar way.

What I Learned Beyond the Definitions

One thing I noticed while studying this week is that Operating Systems are less about memorizing algorithms and more about solving resource management problems.

Almost every topic I covered had the same hidden objective:

**CPU** Scheduling → Share **CPU** fairly. Threads → Share work efficiently. Synchronization → Share data safely. Deadlocks → Avoid resource conflicts. Memory Management → Share memory effectively.

The entire subject feels like learning how a city is managed, where the **CPU**, memory, files, and devices are all limited resources that need proper coordination.

### Weekly Reflection

This week changed the way I look at a computer. Before learning Operating Systems, I thought programs simply *run.* Now I realize there is an entire layer working behind the scenes—deciding which process gets **CPU** time, managing memory, preventing conflicts between threads, and ensuring that hundreds of tasks can happen together without crashing the system.

I also found that connecting concepts to everyday examples—like hospital queues, traffic signals, or people waiting in line—made the subject much easier to understand than simply memorizing definitions.

My goal for next week is to go deeper into these concepts by solving scheduling and synchronization problems, because I feel that implementing them is the best way to truly understand how an operating system works.

## CPU Scheduling Algorithms (Continued)

Shortest Job First (**SJF**)

While **FCFS** is simple, it is not always efficient. Imagine a very large process arrives before several tiny processes. The small tasks would have to wait unnecessarily. To solve this problem, the Shortest Job First (**SJF**) scheduling algorithm was introduced.

In **SJF**, the process with the smallest **CPU** Burst Time (BT) is selected for execution first.

The main idea behind **SJF** is simple:

Complete the shorter tasks first so that the average waiting time of all processes decreases.

Non-Preemptive **SJF**

In the non-preemptive version, once a process starts executing, it continues until it finishes or enters the waiting state. Even if a shorter process arrives while it is running, the **CPU** will not be taken away.

Characteristics:

Process with the least Burst Time gets the **CPU** first. Burst Time of each process should be known or estimated beforehand. Produces lower average waiting time than **FCFS**. May lead to starvation if short jobs keep arriving. Preemptive **SJF** (Shortest Remaining Time First)

The preemptive version of **SJF** is also called Shortest Remaining Time First (**SRTF**).

If a new process arrives whose remaining Burst Time is smaller than the currently running process, the OS immediately preempts the current process and gives the **CPU** to the new one.

Advantages:

Better average waiting time. Reduces the Convoy Effect. More responsive to shorter jobs.

Disadvantages:

More context switching overhead. Burst Time estimation is difficult in practice. ### My Understanding

At first, I wondered why an operating system would care about short jobs. Then I thought about a supermarket billing counter. If one customer with a full cart blocks the counter while ten customers with only one item each wait behind, the average waiting time becomes unnecessarily high. **SJF** solves this by quickly serving the smaller tasks first.

Real-World Connection

Many modern systems use ideas similar to **SJF**. For example, cloud servers often prioritize small and quick requests to improve overall responsiveness for users.

### Priority Scheduling

Sometimes, the importance of a task matters more than its execution time. For example, an emergency system process should run before a background update process. This is where Priority Scheduling is useful.

In this algorithm, each process is assigned a priority value. The **CPU** is allocated to the process with the highest priority.

Non-Preemptive Priority Scheduling

Once a process gets the **CPU**, it continues execution until completion, even if a higher-priority process arrives later.

### Preemptive Priority Scheduling

In the preemptive version, if a newly arrived process has a higher priority than the currently running process, the operating system interrupts the current process and immediately allocates the **CPU** to the higher-priority one.

Starvation in Priority Scheduling

A major problem with Priority Scheduling is Starvation. A low-priority process may wait indefinitely if higher-priority processes continue to arrive.

Ageing

To overcome starvation, operating systems use a technique called Ageing.

In ageing, the priority of a process gradually increases the longer it waits in the Ready Queue. Eventually, even a low-priority process gets a chance to execute.

### My Understanding

Ageing felt like a very fair solution to me. It's similar to standing in a queue where people who have waited for a very long time are allowed to move ahead, ensuring nobody waits forever.

Real-World Connection

Hospitals use a similar idea. Critical patients are treated first, but a patient waiting for a very long time will not be ignored forever. Some balancing mechanism always exists.

Round Robin (RR) Scheduling

Round Robin is one of the most widely used **CPU** scheduling algorithms, especially in time-sharing systems.

Instead of allowing one process to use the **CPU** until completion, every process is given a fixed amount of **CPU** time called the Time Quantum (TQ).

If a process does not finish within its allocated Time Quantum, it is preempted and moved to the end of the Ready Queue. The **CPU** is then allocated to the next process.

Working of Round Robin Processes enter the Ready Queue. The first process gets the **CPU** for one Time Quantum. If the process completes, it leaves the system. Otherwise, it is placed at the end of the queue. The cycle repeats. Advantages Fair allocation of **CPU** time. Very low chance of starvation. Suitable for interactive systems. Good responsiveness for users. Disadvantages Too small a Time Quantum increases context switching overhead. Too large a Time Quantum makes it behave almost like **FCFS**. ### My Understanding

Round Robin reminded me of a teacher conducting viva examinations. Instead of allowing one student to answer for 30 minutes, the teacher gives each student a few minutes and then moves to the next. Everyone gets a fair opportunity.

Real-World Connection

Modern desktop operating systems use scheduling strategies inspired by Round Robin because users expect all applications to remain responsive.

### Comparing Scheduling Algorithms

Algorithm	Preemptive	Convoy Effect	Starvation	Complexity
**FCFS**	No	Yes	Low	Simple
**SJF**	No	Yes	Possible	Moderate
Preemptive **SJF**	Yes	No	Less	Complex
Priority	No	Yes	Possible	Moderate
Preemptive Priority	Yes	Possible	Possible	Complex
Round Robin	Yes	No	Very Low	Simple
### My Observation

While comparing these algorithms, I noticed that there is no *perfect* scheduling algorithm. Every algorithm tries to optimize one thing but sacrifices another. Operating system design is often about making practical trade-offs rather than finding a perfect solution.

## Multi-Level Queue (MLQ) and Multi-Level Feedback Queue (MLFQ)

As the number of processes in a system grows, a single Ready Queue may not be enough. Different kinds of processes have different requirements. For example, an interactive application like a browser should get **CPU** time before a background task like a file backup.

Multi-Level Queue Scheduling (**MLQ**)

In **MLQ** Scheduling, the Ready Queue is divided into multiple sub-queues based on the type or priority of the processes.

Common categories include:

System Processes (SP): Created by the OS. Highest priority. Interactive Processes (IP): Require user interaction. Batch Processes (BP): Run in the background without user input.

Each queue can use its own scheduling algorithm. For example:

System Queue → Round Robin. Interactive Queue → Round Robin. Batch Queue → **FCFS**.

A process is permanently assigned to one queue and cannot move between queues.

Limitation of **MLQ**

Lower-priority queues may suffer from starvation because higher-priority queues are always served first.

Multi-Level Feedback Queue (**MLFQ**)

**MLFQ** improves **MLQ** by allowing processes to move between queues.

A **CPU**-intensive process may gradually move to a lower-priority queue. An interactive or I/O-bound process remains in a higher-priority queue. A process waiting for too long can be promoted to a higher-priority queue through Ageing.

This flexibility reduces starvation and improves overall system responsiveness.

### My Understanding

I think of **MLQ** as students permanently assigned to different classrooms, while **MLFQ** is like a school where students can move to different sections depending on their performance and participation.

Real-World Connection

Modern operating systems such as Windows and Linux use scheduling policies inspired by Multi-Level Feedback Queues because different applications have different **CPU** requirements.

## Concurrency and Threads

What is Concurrency?

Concurrency refers to the execution of multiple instruction sequences during the same period of time. In an operating system, several processes and threads may appear to run simultaneously because the **CPU** rapidly switches between them.

The goal of concurrency is to improve resource utilization and system responsiveness.

What is a Thread?

A Thread is a single sequence of execution within a process. It is often called a light-weight process because creating and switching between threads is less expensive than creating and switching between separate processes.

A process can contain multiple threads, all of which share the same memory and resources.

Examples of Threads Multiple tabs in a web browser. A text editor that performs typing, auto-saving, and spell checking simultaneously. A music player that continues playback while downloading album artwork. ### Thread Scheduling

Threads are scheduled by the operating system based on their priority. Even though threads belong to the same process, each thread gets its own processor time slice.

### Thread Context Switching

When switching between threads of the same process:

The OS saves the Program Counter, registers, and stack information. Memory address space is not switched, because all threads share the same process memory. **CPU** cache is generally preserved.

This makes thread switching much faster than process switching.

Benefits of Multi-threading ## Responsiveness

One thread can continue running while another waits for an I/O operation, making applications feel more responsive.

## Resource Sharing

Threads belonging to the same process share memory and resources, making communication easier.

## Economy

Creating a thread is cheaper than creating a completely new process.

## Better Utilization of Multi-Core Processors

Different threads can execute simultaneously on different **CPU** cores, improving performance.

### My Understanding

Initially, I thought multitasking and multithreading were basically the same thing. But after studying this topic, I realized that multitasking is about multiple processes, while multithreading is about multiple paths of execution inside a single process.

A process is like a project, and threads are different team members working on different parts of that project.

Real-World Connection

A web browser is probably the best real-world example I encountered this week. While I watch a YouTube video, another thread is loading comments, another manages network requests, and another handles the user interface. Everything appears to happen together because of multithreading.

### My Observation So Far

One thing that stood out to me this week is that almost every Operating System concept revolves around efficient sharing of limited resources.

**CPU** Scheduling → Sharing **CPU** time. Threads → Sharing work inside a process. Multi-Level Queues → Organizing different types of work. Context Switching → Efficiently moving between tasks.

I used to think the Operating System was just software that helps a computer boot. After learning these concepts, I see it more like a traffic controller that constantly manages thousands of tiny decisions every second so that users experience a smooth and responsive system.

## Process Synchronization and Critical Section

Why Process Synchronization is Needed

As I moved from **CPU** scheduling to concurrency, I realized that running multiple processes or threads at the same time creates a new challenge. It's not just about giving everyone a chance to use the **CPU**—it is also about making sure they don't interfere with each other while sharing resources.

Many processes may need access to the same file, variable, memory location, or hardware device. If they all try to modify shared data at the same time, the final result may become incorrect. To prevent this, operating systems use Process Synchronization.

In simple words, process synchronization is a collection of techniques used to maintain the consistency and correctness of shared data when multiple processes or threads execute concurrently.

### Critical Section

A Critical Section (CS) is the part of a program where shared resources are accessed or modified.

These shared resources may include:

Shared variables. Shared files. Shared memory. Databases. Hardware devices.

Since multiple threads may execute simultaneously, any thread can be interrupted while it is inside the critical section. If another thread enters the same section at the same time, both may try to update the same data, leading to unexpected results.

Example

Imagine two **ATM** machines connected to the same bank account. Both users try to withdraw money at exactly the same time. If the balance update is not synchronized, both transactions may succeed even though the account contains insufficient funds.

The balance update operation is the critical section.

### Race Condition

A Race Condition occurs when two or more processes or threads access and modify shared data simultaneously, and the final result depends on the order in which they execute.

The operating system can switch between threads at any moment. Since we cannot predict the exact scheduling order, different executions may produce different outputs.

Example

Suppose a shared variable count = 10.

Thread A reads count = 10. Thread B also reads count = 10. Thread A increments and writes 11. Thread B increments and also writes 11.

The expected result was 12, but the final result becomes 11. Both threads were *racing* to update the same variable.

How Can We Prevent Race Conditions?

There are several methods used by operating systems to solve the race condition problem.

## Atomic Operations

An Atomic Operation is an operation that executes completely in one step without interruption.

No other process or thread can access the shared resource until the atomic operation finishes.

## Mutual Exclusion (Mutex)

Mutual Exclusion ensures that only one process or thread can enter the critical section at a time. Other processes must wait until the current process leaves the critical section.

## Semaphores

Semaphores are synchronization mechanisms that help coordinate multiple processes and prevent simultaneous unsafe access to shared resources.

Can a Simple Flag Variable Solve Race Conditions?

Initially, I thought using a simple boolean variable like busy = true would be enough to prevent multiple threads from entering the critical section.

However, this approach does not work because checking and updating the flag itself is not atomic. Two threads may read the flag at exactly the same moment before either one changes it.

So, a simple flag variable alone cannot guarantee mutual exclusion.

Peterson's Solution

One of the earliest software-based solutions to the critical section problem is Peterson's Solution.

It works correctly for only two processes or two threads.

The idea is simple:

Both processes indicate their intention to enter the critical section. A shared variable called turn decides whose turn it is to enter. One process waits while the other completes its work.

Although Peterson's Solution is not commonly used in modern operating systems, it is important because it demonstrates that synchronization can be achieved purely through software.

Mutex (Locks)

A Mutex (Mutual Exclusion Lock) is one of the most common synchronization mechanisms used in modern operating systems.

Before entering the critical section, a process must acquire the lock. If another process already holds the lock, all other processes must wait.

After completing its work, the process releases the lock so that another waiting process can enter.

Advantages Prevents multiple processes from accessing shared data simultaneously. Simple and widely used. Helps eliminate race conditions. Limitations of Locks ## Busy Waiting (Contention)

If one process acquires the lock, all other processes continuously wait until it is released. This waiting wastes **CPU** cycles.

## Deadlock

If a process acquires a lock but never releases it, other waiting processes may remain blocked forever.

## Debugging Difficulty

Synchronization bugs involving multiple threads are often difficult to reproduce and debug.

## Starvation

Some threads, especially lower-priority ones, may have to wait for a very long time before obtaining the lock.

### Condition Variables

A Condition Variable is a synchronization primitive that allows a thread to sleep until a particular condition becomes true.

It is usually used together with a lock.

Working A thread acquires the lock. If the required condition is not satisfied, it enters the waiting state. While waiting, it automatically releases the lock. Another thread updates the shared resource and signals the waiting thread. The waiting thread wakes up, reacquires the lock, and continues execution. Why Use Condition Variables?

The biggest advantage is that they avoid busy waiting. Instead of continuously checking whether a condition is satisfied, the thread simply sleeps and waits for a notification.

### My Understanding

This was one of the most interesting topics for me because I realized that concurrency is not only about running multiple things together—it's also about making sure they don't break each other's work.

Initially, race conditions sounded like a purely theoretical concept. But after looking at examples like **ATM** withdrawals, ticket booking systems, and online shopping inventories, I understood how a tiny synchronization mistake can create major real-world problems.

I also noticed that almost every synchronization technique follows one basic rule:

Only one person should edit the shared resource at a time.

Real-World Connection

I like to think of the Critical Section as a shared whiteboard in a classroom. If five students try to erase and write on it simultaneously, the final content becomes unreadable. The teacher solves this by allowing only one student to use the board at a time. That *permission* acts exactly like a mutex lock.

## Semaphores and Classical Synchronization Problems

What is a Semaphore?

A Semaphore is an integer variable used by the operating system to coordinate access to shared resources and solve the critical section problem.

Unlike a simple variable, a semaphore can only be modified through two special atomic operations:

wait() (P operation) → Requests access to a resource. signal() (V operation) → Releases the resource and notifies waiting processes.

Since these operations are atomic, race conditions are avoided.

Types of Semaphores ### Counting Semaphore

A Counting Semaphore can take any non-negative integer value. It is generally used when multiple identical resources are available.

For example, if there are five printers connected to a network, the semaphore value may initially be 5. Every process using a printer decreases the count by one, and releasing the printer increases the count.

Binary Semaphore (Mutex)

A Binary Semaphore can have only two values:

0 → Resource unavailable. 1 → Resource available.

It behaves similarly to a mutex lock and allows only one process to access the critical section at a time.

Producer-Consumer Problem

The Producer-Consumer Problem is one of the most famous synchronization problems in operating systems.

### The Scenario

A Producer generates items and places them into a shared buffer. A Consumer removes items from the same buffer. ### The Challenge

Two situations must be avoided:

The producer should not insert an item if the buffer is already full. The consumer should not remove an item if the buffer is empty. ### Solution Using Semaphores

Three semaphores are commonly used:

Semaphore	Purpose
empty	Counts available empty buffer slots.
full	Counts filled buffer slots.
mutex	Ensures mutual exclusion while accessing the buffer.

The producer waits for an empty slot before producing, and the consumer waits for a full slot before consuming.

Reader-Writer Problem

The Reader-Writer Problem deals with a shared resource that can be read by multiple processes but written by only one process at a time.

Rules Multiple readers can read simultaneously. Only one writer can write at any given time. While a writer is writing, no reader is allowed to read. Solution

Semaphores or mutex locks are used to:

Allow concurrent reading. Guarantee exclusive writing access. ### Dining Philosophers Problem

This is another classic synchronization problem used to explain deadlocks and resource allocation.

### Problem Statement

Imagine five philosophers sitting around a circular table. Between every pair of philosophers lies one fork. Each philosopher needs two forks to eat.

If every philosopher picks up the left fork first and waits for the right fork, no one can proceed. Every philosopher waits forever.

This situation creates a deadlock.

### Common Solutions

Allow at most four philosophers to sit at the table simultaneously. Allow a philosopher to pick up forks only if both are available. Use an asymmetric strategy: Odd-numbered philosophers pick the left fork first. Even-numbered philosophers pick the right fork first.

These strategies break the circular waiting condition and prevent deadlock.

### My Understanding

The synchronization problems initially looked like puzzles created only for exams. But after reading more carefully, I realized that they model real-world systems.

The Producer-Consumer problem is similar to:

YouTube generating video packets and my device consuming them. A restaurant kitchen preparing food while waiters serve customers.

The Reader-Writer problem is similar to:

Many students reading a library book at different times. Only the librarian being allowed to edit the official record. ### My Observation

One thing I found fascinating this week is that many operating system concepts are inspired by everyday coordination problems. The computer is basically trying to organize limited resources just like people organize queues, libraries, roads, and workplaces.

The more I study Operating Systems, the more I feel it is not just about computers—it is about efficient coordination and conflict management.

What I Learned from This Part of the Week

Before this week, I thought concurrency simply meant *doing many things at once.* Now I understand that concurrency also creates risks. Whenever multiple processes share data, the operating system must guarantee correctness before it can guarantee speed.

I also learned that synchronization is a balance:

Too little synchronization → race conditions and data corruption. Too much synchronization → unnecessary waiting and reduced performance.

Finding the right balance is what makes operating system design both challenging and interesting.

## Deadlocks and Resource Allocation

What is a Deadlock?

As I continued learning about synchronization, I came across a problem that seemed almost unavoidable when multiple processes compete for limited resources—Deadlock.

A Deadlock is a situation where two or more processes are waiting for resources that are being held by each other, and as a result, none of them can continue execution.

In simple words:

A deadlock happens when every process is waiting for another process to release a resource, but no one can move forward.

In a multiprogramming operating system, many processes compete for resources such as **CPU** time, memory, files, locks, printers, and I/O devices. If resource allocation is not handled carefully, the entire system can get stuck.

### Understanding Resources

Before understanding deadlocks, I realized it is important to understand what an operating system considers a resource.

Some common resources are:

**CPU** cycles. Main memory. Files. Printers and other I/O devices. Network sockets. Locks and semaphores.

A resource may have:

Single Instance: Only one copy exists (e.g., one printer). Multiple Instances: More than one copy exists (e.g., multiple **CPU** cores or printers). How a Process Uses a Resource

Whenever a process needs a resource, it usually follows three steps:

## Request

The process requests access to a resource. If the resource is free, the OS allocates it; otherwise, the process waits.

2. Use

The process performs its required task using that resource.

## Release

After completing the task, the process releases the resource so that other waiting processes can use it.

Problems begin when a process holds one resource while waiting for another.

Necessary Conditions for Deadlock

A deadlock can occur only if all four of the following conditions hold simultaneously. If even one condition is removed, deadlock cannot happen.

## Mutual Exclusion

At least one resource must be non-shareable. Only one process can use that resource at a time, while other requesting processes must wait.

Example: A printer cannot print two different documents simultaneously.

## Hold and Wait

A process is already holding one resource while waiting to acquire another resource currently held by another process.

Example: A process holds a file lock and waits for access to a printer.

## No Preemption

Resources cannot be forcibly taken away from a process. A resource can only be released voluntarily after the process completes its task.

## Circular Wait

A circular chain of waiting processes exists.

For example:

Process P1 waits for a resource held by P2. Process P2 waits for a resource held by P3. Process P3 waits for a resource held by P1.

This circular dependency means no process can proceed.

### Visualizing Circular Wait

P1 → waiting for → Resource B ↑                    ↓ Resource A ← held by P2

In larger systems, this chain can involve many processes and resources, but the idea remains the same—everyone is waiting for someone else.

Methods for Handling Deadlocks

While studying this topic, I found it interesting that operating systems do not always try to completely eliminate deadlocks. Instead, there are different strategies depending on the system requirements.

## Deadlock Prevention

The operating system ensures that at least one of the four necessary conditions never holds.

For example:

Allow resource sharing whenever possible. Do not allow processes to hold one resource while requesting another. ## Deadlock Avoidance

Instead of permanently preventing deadlocks, the OS carefully checks every resource request and grants it only if the system remains in a safe state.

## Deadlock Detection and Recovery

Some operating systems allow deadlocks to occur, detect them later, and then recover by terminating processes or taking resources away.

### Deadlock Avoidance

Deadlock avoidance requires the operating system to know in advance how many resources each process may request during its lifetime.

Whenever a process requests a resource, the OS checks whether granting the request would leave the system in a safe state.

If the answer is yes, the resource is allocated.

If the answer is no, the process must wait.

Safe State and Unsafe State ### Safe State

A system is in a Safe State if there exists at least one order (called a Safe Sequence) in which all processes can complete their execution without causing a deadlock.

### Unsafe State

A system is in an Unsafe State if the operating system cannot guarantee that all processes will complete safely.

An important point I learned is:

An unsafe state does not necessarily mean the system is already deadlocked, but it has the potential to become deadlocked.

Banker's Algorithm

One of the most famous deadlock avoidance techniques is the Banker's Algorithm, proposed by Edsger Dijkstra.

The idea is similar to how a bank manages loans.

A bank does not lend all of its available money to customers at once because it must ensure it can satisfy future demands. Similarly, the operating system grants resource requests only if enough resources remain available to satisfy the maximum future requirements of other processes.

### Working Principle

When a process requests resources:

The OS temporarily assumes the resources are allocated. It checks whether the resulting system state remains safe. If a safe sequence exists, the allocation is confirmed. Otherwise, the process is forced to wait.

Although the Banker's Algorithm is mostly studied for understanding deadlocks, it demonstrates the importance of planning resource allocation before making decisions.

### Deadlock Detection

Some systems do not implement prevention or avoidance because these methods can be expensive.

Instead, they allow deadlocks to happen and periodically check whether one exists.

Single Instance of Each Resource

If every resource type has only one instance, a Wait-For Graph can be used.

Each node represents a process. A directed edge from P1 to P2 means P1 is waiting for a resource currently held by P2.

If the graph contains a cycle, a deadlock exists.

Multiple Instances of Resources

When resources have multiple instances, algorithms similar to the Banker's Algorithm can be used to detect deadlocks.

Recovery from Deadlock

Once a deadlock is detected, the operating system must recover from it.

## Process Termination

The simplest solution is to terminate one or more processes involved in the deadlock.

This can be done by:

Aborting all deadlocked processes. Aborting one process at a time until the cycle is broken. ## Resource Preemption

The operating system can temporarily take resources away from one process and allocate them to another process until the deadlock is resolved.

However, this approach can be complex because the interrupted process may need to be rolled back to a previous safe state.

### My Understanding

Deadlock was one of the easiest topics for me to visualize because I could immediately connect it with everyday situations.

Imagine four friends sitting around a table:

Each friend already has one spoon. Each needs one more spoon to eat. Nobody is willing to give up the spoon they already have.

As a result, everyone waits forever.

That is exactly what happens in a deadlock.

Real-World Connection

Traffic intersections provide a great example of deadlocks.

Imagine four cars arrive at a four-way intersection at the same time. Every driver moves slightly forward and blocks the next car, while waiting for another car to move first. Since nobody can proceed, the entire intersection becomes blocked.

Traffic police or traffic signals act like the operating system—they enforce rules that prevent this deadlock from occurring.

### My Observation

One thing I found interesting is that deadlocks are not always caused by hardware limitations. They are often caused by poor coordination.

Many synchronization problems I studied earlier, like the Dining Philosophers Problem, are actually simplified models used to understand deadlocks.

This helped me realize that Operating Systems are not just about managing hardware—they are also about designing rules that allow many independent tasks to cooperate safely.

## Memory Management

Why Memory Management is Important

So far, I had learned how the operating system manages **CPU** time and synchronizes processes. The next natural question was:

"If many processes are running together, where are they all stored?"

The answer lies in Memory Management.

In a multiprogramming environment, several processes are loaded into the main memory simultaneously. The operating system must decide:

Where each process should be placed. How much memory should be allocated. How memory should be shared efficiently. How to avoid wasting memory.

Memory Management is the component of the operating system responsible for handling all these tasks.

Logical Address Space vs Physical Address Space

One of the first concepts that confused me was the difference between logical and physical addresses.

Logical Address (Virtual Address) Generated by the **CPU**. Used by the process while executing. The user program works only with logical addresses. It does not directly represent an actual location in **RAM**.

Because it is an abstract address generated during execution, it is also called a Virtual Address.

### Physical Address

Represents the actual location in main memory (**RAM**). Loaded into the Memory Address Register. Users cannot directly access physical addresses.

The operating system and hardware work together to convert logical addresses into physical addresses.

Memory Management Unit (**MMU**)

The conversion from logical address to physical address is performed by a hardware component called the Memory Management Unit (**MMU**).

The **MMU** acts like a translator between the **CPU** and main memory.

### Simple View

**CPU** │ │  Logical Address ▼ Memory Management Unit (**MMU**) │ │  Physical Address ▼ Main Memory (**RAM**)

The **CPU** never directly deals with physical memory. It simply generates logical addresses, and the **MMU** handles the translation automatically.

### Memory Allocation

The operating system uses different strategies to allocate memory to processes.

### Fixed Partitioning

In this method, the main memory is divided into several fixed-size partitions before execution begins.

Each partition can hold only one process.

Advantages Simple to implement. Easy memory allocation. Limitations Wastes memory if the process size is smaller than the partition. Limits the number of processes that can stay in memory. ### Internal Fragmentation

The unused space inside an allocated partition is called Internal Fragmentation.

For example, if a partition has **100** MB but the process requires only 70 MB, the remaining 30 MB cannot be used by other processes.

### Dynamic Partitioning

To reduce wasted memory, operating systems introduced Dynamic Partitioning.

In this approach:

Partition sizes are not fixed beforehand. Memory is allocated according to the actual size of the process. Advantages Better memory utilization. No internal fragmentation. Supports larger and varying process sizes. ### External Fragmentation

Although dynamic partitioning solves internal fragmentation, it introduces External Fragmentation.

Over time, free memory becomes divided into many small scattered blocks called holes. Even if the total free memory is sufficient, there may not be one large continuous block available for a new process.

### My Understanding

I think of memory allocation like arranging books on a shelf.

Fixed Partitioning: The shelf is divided into fixed boxes. Small books waste space, and very large books may not fit. Dynamic Partitioning: The shelf is adjusted according to the size of each book, reducing wasted space but leaving small gaps between books over time.

These small gaps are exactly like external fragmentation.

Real-World Connection

This topic reminded me of parking lots.

A parking area divided into fixed-size slots works like fixed partitioning. If a motorcycle occupies a slot designed for a bus, much of the space is wasted.

A flexible parking arrangement can use space more efficiently, but after many vehicles enter and leave, small unusable gaps may appear between parked vehicles. This is similar to external fragmentation.

### My Observation

At first, I assumed memory management was simply *storing programs in **RAM**.* But after studying these concepts, I realized it is actually a complex optimization problem.

The operating system is constantly trying to balance:

Maximum memory utilization. Fast allocation and deallocation. Minimum fragmentation. Support for multiple running processes.

In many ways, memory management feels just as important as **CPU** scheduling because even the best scheduling algorithm is useless if processes cannot be placed efficiently in memory.

## Free Space Management

Why Free Space Management is Needed

While learning about dynamic partitioning, I noticed that memory does not remain neatly organized forever. As processes are created and terminated, some memory blocks become free while others remain occupied. Over time, the free memory gets scattered into many small pieces.

The operating system must therefore keep track of these free spaces and decide how to use them efficiently. This responsibility is known as Free Space Management.

Compaction (Defragmentation)

One major problem with dynamic partitioning is External Fragmentation. Although enough free memory may exist, it is often divided into many small blocks, making it difficult to allocate a large process.

To solve this problem, the operating system can perform Compaction (also called Defragmentation).

What Happens During Compaction? All occupied memory blocks are moved together. All scattered free spaces are combined into one large contiguous free block. New processes can then be allocated easily. Advantage Reduces or eliminates external fragmentation. Creates a larger continuous block of free memory. Disadvantage Moving processes in memory takes time. During compaction, system performance may temporarily decrease because the OS spends time rearranging memory rather than executing user programs. ### Free List

The operating system keeps track of available memory spaces using a data structure called the Free List.

A Free List is simply a linked list that stores information about all available free holes in memory.

Whenever:

A process terminates → its memory block is added back to the Free List. A new process arrives → the OS searches the Free List to find a suitable memory block. ### Memory Allocation Strategies

The operating system uses different algorithms to decide which free hole should be allocated to a new process.

## First Fit

In First Fit, the OS scans the Free List from the beginning and allocates the first memory hole that is large enough.

Advantages:

Simple to implement. Fast allocation. Lower search time.

Disadvantages:

Small unusable holes may accumulate near the beginning of memory. ## Next Fit

Next Fit is a variation of First Fit.

Instead of always searching from the beginning, the OS starts searching from the location where the previous allocation ended.

Advantages:

Faster than repeatedly scanning from the beginning. Distributes memory usage more evenly. ## Best Fit

In Best Fit, the operating system searches the entire Free List and allocates the smallest hole that is big enough to satisfy the request.

Advantages:

Produces the smallest leftover memory block. Attempts to reduce wasted space.

Disadvantages:

Requires searching the entire Free List. Creates many tiny unusable holes over time. ## Worst Fit

In Worst Fit, the OS allocates the largest available hole.

The idea is that after allocation, a reasonably large free block still remains.

Advantages:

Leaves larger remaining free blocks. Reduces the creation of very small fragments.

Disadvantages:

Requires searching the entire list. Often wastes large blocks that could have been used for bigger processes later. ### My Understanding

At first, these allocation algorithms looked like simple memory tricks, but I realized they are actually different strategies for solving the same problem:

*Where should I place this new process?*

It reminded me of assigning seats in a classroom:

First Fit: Sit in the first empty seat you find. Next Fit: Start looking from where the previous student sat. Best Fit: Choose the smallest row with enough empty seats. Worst Fit: Choose the largest available row.

Each strategy works, but each comes with different trade-offs.

Real-World Connection

I connected this topic to apartment allocation. Suppose there are apartments of different sizes:

First Fit rents the first apartment that is big enough. Best Fit gives you the smallest apartment that meets your needs. Worst Fit gives you the largest apartment available.

Different landlords may choose different policies depending on what they want to optimize.

## Paging and Segmentation

### Why Paging Was Introduced

Dynamic partitioning improved memory utilization, but external fragmentation remained a serious problem.

To overcome this issue, operating systems introduced a new memory management technique called Paging.

The main idea behind paging is simple:

A process does not need to occupy one continuous block of physical memory.

Instead, it can be divided into smaller fixed-size pieces.

Paging

Paging is a memory management scheme that allows physical memory to be allocated in non-contiguous blocks.

### Basic Idea

Physical Memory is divided into fixed-size blocks called Frames. Logical (Virtual) Memory is divided into blocks of the same size called Pages.

Since pages and frames are of equal size, any page can be loaded into any available frame.

### Page Table

To keep track of where each page is stored, the operating system maintains a Page Table.

The Page Table maps:

Logical Page Number → Physical Frame Number.

Whenever the **CPU** generates a logical address, the **MMU** consults the Page Table and converts it into the correct physical address.

Advantages of Paging Eliminates external fragmentation. Allows efficient use of available memory. Processes do not require contiguous physical memory. Limitation

Paging may still suffer from Internal Fragmentation, because the last page of a process may not completely fill its assigned frame.

Segmentation

Unlike paging, which divides memory into equal-sized pieces, Segmentation divides a program according to the programmer's logical view.

A program naturally consists of different parts:

Main program. Functions. Procedures. Stack. Heap. Data section.

Each of these can be treated as a separate segment.

### Segment Table

Just as paging uses a Page Table, segmentation uses a Segment Table.

Each segment entry contains:

Base Address (starting location). Limit (size of the segment).

The physical address is obtained by adding the offset to the base address.

Paging vs Segmentation
Feature	Paging	Segmentation
Division	Fixed-size blocks	Variable-size logical units
Memory Unit	Pages and Frames	Segments
Fragmentation	Internal	External
User View	Transparent to programmer	Visible to programmer
### My Understanding

I found the difference between paging and segmentation easier to understand using a book analogy.

Paging: Divide a book into equal-sized pages, regardless of chapter boundaries. Segmentation: Divide the book according to chapters, where each chapter may have a different length.

Both methods organize information, but they do so in different ways.

Real-World Connection

Cloud computing and modern operating systems heavily rely on paging because it allows efficient use of **RAM** without requiring continuous blocks of memory. It is one of the key ideas that makes multitasking practical.

## Virtual Memory and Page Replacement

What is Virtual Memory?

As programs became larger, I wondered what would happen if a program needed more memory than the available physical **RAM**.

The solution is Virtual Memory.

Virtual Memory is a memory management technique that allows a process to execute even if it is not completely loaded into main memory.

In other words, the operating system gives each process the illusion that it has access to a large continuous memory space, even though only a part of it is actually present in **RAM**.

### Demand Paging

Virtual Memory is commonly implemented using Demand Paging.

In Demand Paging:

Pages are loaded into memory only when they are actually needed. Unused pages remain stored on secondary storage (disk).

This improves memory utilization because unnecessary pages are not loaded.

### Page Fault

A Page Fault occurs when a process tries to access a page that is not currently present in physical memory.

When this happens:

The **CPU** generates a page fault interrupt. The OS pauses the process. The required page is loaded from disk into **RAM**. Execution resumes.

Although page faults are normal, excessive page faults reduce system performance.

### Page Replacement Algorithms

When memory is full and a new page must be loaded, the OS must decide which existing page should be removed. This decision is made using Page Replacement Algorithms.

**FIFO** (First In First Out)

**FIFO** removes the page that has been in memory for the longest time.

Advantages:

Very simple to implement. Low overhead.

Limitation:

May suffer from Belady's Anomaly, where increasing the number of available frames unexpectedly increases the number of page faults. Optimal (**OPT**) Page Replacement

The Optimal algorithm replaces the page that will not be used for the longest period in the future.

This algorithm gives the minimum possible number of page faults.

However, it cannot be implemented in practice because it requires future knowledge of memory accesses.

It is mainly used as a benchmark to compare other algorithms.

Least Recently Used (**LRU**)

**LRU** replaces the page that has not been used for the longest time in the past.

The assumption is that pages used recently are likely to be used again soon.

**LRU** generally performs well and is widely studied because it approximates optimal behavior.

Least Frequently Used (**LFU**)

**LFU** removes the page that has been accessed the fewest number of times.

The algorithm assumes that pages frequently used in the past are more likely to be useful again.

One limitation is that a page heavily used long ago may remain in memory even if it is no longer needed.

### My Understanding

I understood page replacement algorithms by thinking about my study desk.

Suppose my desk can hold only four books. Whenever I need a fifth book, I must remove one.

**FIFO**: Remove the book that has been on the desk the longest. **LRU**: Remove the book I haven't touched for the longest time. **LFU**: Remove the book I use the least. **OPT**: Magically know which book I won't need for the longest time in the future.

Of course, in real life I cannot predict the future, which is why the Optimal algorithm is impossible to implement exactly.

## Thrashing

What is Thrashing?

While studying virtual memory, I discovered that loading and replacing pages too frequently can create another performance issue called Thrashing.

A process is said to be thrashing if it spends more time handling page faults and swapping pages than actually executing instructions.

In this situation, the **CPU** remains busy managing memory rather than doing useful work.

Why Does Thrashing Occur?

The main reason for thrashing is that the process does not have enough memory frames allocated to hold its actively used pages.

As a result:

A page is loaded. Another page is immediately removed. The removed page is needed again shortly after. Another page fault occurs.

This cycle repeats continuously.

Effects of Thrashing **CPU** utilization drops sharply. Page fault rate becomes very high. Overall system performance degrades. The operating system may incorrectly assume that **CPU** utilization is low because more processes are needed, making the problem even worse. Solutions to Thrashing ### Working Set Model

The operating system keeps track of the pages actively used by a process (its Working Set) and ensures that enough frames are allocated for those pages.

Page Fault Frequency (**PFF**)

The OS monitors the page fault rate:

If page faults are too high → allocate more frames. If page faults are very low → some frames may be taken away and assigned elsewhere. ### My Observation

One thing I found interesting is that sometimes trying to do too many things at once actually reduces performance. Thrashing is a perfect example of this. Instead of improving **CPU** utilization by running more processes, the system spends all its time moving pages in and out of memory.
