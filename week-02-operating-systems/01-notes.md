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

