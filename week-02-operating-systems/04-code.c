```c
#include <stdio.h>
#include <stdlib.h>

// ============================================
// Week 02 — Operating Systems
// Author: Durga Madhav Chandra
// ============================================

// ============================================
// 1. WHAT IS AN OPERATING SYSTEM?
// ============================================

// I used to think the OS was just the desktop screen.
// Then I learned it is actually the manager between
// hardware and software. It schedules CPU time,
// allocates memory and handles input/output.

void operatingSystemDemo() {
    printf("OS: Managing CPU, Memory and Devices.\n");
}

// ============================================
// 2. MULTITASKING VS MULTITHREADING
// ============================================

// Multitasking = multiple independent programs.
// Multithreading = multiple execution paths
// inside the same process.

void multitaskingDemo() {
    printf("Running Browser and Music Player simultaneously.\n");
}

void multithreadingDemo() {
    printf("Browser: UI Thread + Download Thread.\n");
}

// ============================================
// 3. SYSTEM CALLS
// ============================================

// Applications cannot directly access hardware.
// They request OS services using system calls.

void systemCallDemo() {
    printf("Example System Calls: open(), read(), write(), close().\n");
}

// ============================================
// 4. HOW AN OS BOOTS UP
// ============================================

// I thought pressing the power button directly
// started Windows. Actually BIOS/UEFI loads the
// bootloader, which loads the kernel.

void bootProcessDemo() {
    printf("\nBoot Process:\n");
    printf("Power ON -> BIOS/UEFI -> Bootloader -> Kernel -> Login Screen\n");
}

// ============================================
// 5. 32-BIT VS 64-BIT
// ============================================

// The easiest way to observe this is by checking
// the pointer size on the current machine.

void pointerSizeDemo() {
    printf("\nPointer Size: %zu bytes\n", sizeof(void*));

    if (sizeof(void*) == 4)
        printf("Running on a 32-bit environment.\n");
    else
        printf("Running on a 64-bit environment.\n");
}

// ============================================
// 6. STORAGE DEVICES
// ============================================

void storageDeviceDemo() {
    printf("\nStorage Comparison:\n");
    printf("HDD  -> Mechanical, Slower, Cheaper\n");
    printf("SSD  -> Flash Memory, Faster, More Expensive\n");
}

// ============================================
// 7. PROCESS CREATION
// ============================================

// Every new application gets a unique Process ID.

int nextPID = 1001;

void createProcess(char name[]) {
    printf("Created Process: %s (PID: %d)\n", name, nextPID++);
}

// ============================================
// 8. PROCESS STATES
// ============================================

enum ProcessState {
    NEW,
    READY,
    RUNNING,
    WAITING,
    TERMINATED
};

void printProcessStates() {
    printf("NEW -> READY -> RUNNING -> WAITING -> READY -> TERMINATED\n");
}

// ============================================
// 9. CONTEXT SWITCHING
// ============================================

// CPU saves one process state and loads another.

void contextSwitch(int current, int next) {
    printf("Switching CPU from Process %d to Process %d\n",
           current, next);
}

// ============================================
// 10. FCFS CPU SCHEDULING
// ============================================

void fcfs(int burst[], int n) {
    int waiting[10];
    waiting[0] = 0;

    for(int i = 1; i < n; i++)
        waiting[i] = waiting[i-1] + burst[i-1];

    printf("\nFCFS Waiting Times:\n");
    for(int i = 0; i < n; i++)
        printf("P%d : %d\n", i+1, waiting[i]);
}

// ============================================
// 11. SHORTEST JOB FIRST (NON-PREEMPTIVE)
// ============================================

void sjf(int burst[], int n) {
    int temp[10];

    for(int i = 0; i < n; i++)
        temp[i] = burst[i];

    for(int i = 0; i < n-1; i++) {
        for(int j = 0; j < n-i-1; j++) {
            if(temp[j] > temp[j+1]) {
                int t = temp[j];
                temp[j] = temp[j+1];
                temp[j+1] = t;
            }
        }
    }

    printf("\nSJF Execution Order:\n");
    for(int i = 0; i < n; i++)
        printf("%d ", temp[i]);
    printf("\n");
}

// ============================================
// 12. ROUND ROBIN SCHEDULING
// ============================================

void roundRobin(int burst[], int n, int quantum) {
    int rem[10];
    for(int i = 0; i < n; i++)
        rem[i] = burst[i];

    printf("\nRound Robin Execution:\n");

    while(1) {
        int done = 1;
        for(int i = 0; i < n; i++) {
            if(rem[i] > 0) {
                done = 0;
                if(rem[i] > quantum) {
                    printf("P%d executes for %d units\n", i+1, quantum);
                    rem[i] -= quantum;
                } else {
                    printf("P%d executes for %d units (Finished)\n",
                           i+1, rem[i]);
                    rem[i] = 0;
                }
            }
        }
        if(done) break;
    }
}

// ============================================
// 13. CRITICAL SECTION
// ============================================

// Only one process should access shared data
// at a time.

int sharedCounter = 0;

void criticalSection() {
    sharedCounter++;
    printf("Shared Counter = %d\n", sharedCounter);
}

// ============================================
// 14. SEMAPHORE (SIMULATION)
// ============================================

int semaphore = 1;

void waitOperation() {
    semaphore--;
    printf("wait() -> Semaphore = %d\n", semaphore);
}

void signalOperation() {
    semaphore++;
    printf("signal() -> Semaphore = %d\n", semaphore);
}

// ============================================
// 15. DEADLOCK CONDITIONS
// ============================================

void deadlockConditions() {
    printf("1. Mutual Exclusion\n");
    printf("2. Hold and Wait\n");
    printf("3. No Preemption\n");
    printf("4. Circular Wait\n");
}

// ============================================
// 16. PAGING
// ============================================

void paging(int logicalAddress, int pageSize) {
    int pageNumber = logicalAddress / pageSize;
    int offset = logicalAddress % pageSize;

    printf("Logical Address: %d\n", logicalAddress);
    printf("Page Number: %d\n", pageNumber);
    printf("Offset: %d\n", offset);
}

// ============================================
// 17. VIRTUAL MEMORY
// ============================================

void virtualMemoryDemo() {
    int logicalAddress = 1025;
    int pageSize = 256;

    int pageNumber = logicalAddress / pageSize;
    int offset = logicalAddress % pageSize;

    printf("\nVirtual Memory Translation:\n");
    printf("Logical Address : %d\n", logicalAddress);
    printf("Page Number     : %d\n", pageNumber);
    printf("Offset          : %d\n", offset);
}

// ============================================
// 18. PAGE REPLACEMENT (FIFO)
// ============================================

void fifoPageReplacement(int pages[], int n, int frames) {
    int frame[10];
    int index = 0, faults = 0;

    for(int i = 0; i < frames; i++)
        frame[i] = -1;

    for(int i = 0; i < n; i++) {
        int found = 0;

        for(int j = 0; j < frames; j++) {
            if(frame[j] == pages[i])
                found = 1;
        }

        if(!found) {
            frame[index] = pages[i];
            index = (index + 1) % frames;
            faults++;
        }
    }

    printf("FIFO Page Faults: %d\n", faults);
}

// ============================================
// MAIN
// ============================================

int main() {

    // 1. OS Basics
    operatingSystemDemo();

    // 2. Multitasking vs Multithreading
    multitaskingDemo();
    multithreadingDemo();

    // 3. System Calls
    systemCallDemo();

    // 4. Boot Process
    bootProcessDemo();

    // 5. 32-bit vs 64-bit
    pointerSizeDemo();

    // 6. Storage Devices
    storageDeviceDemo();

    // 7. Process Creation
    printf("\nProcess Creation:\n");
    createProcess("Browser");
    createProcess("Music Player");
    createProcess("Code Editor");

    // 8. Process States
    printf("\nProcess States:\n");
    printProcessStates();

    // 9. Context Switching
    printf("\nContext Switching:\n");
    contextSwitch(1, 2);

    // 10-12. CPU Scheduling
    int burst[] = {5, 3, 8, 6};
    fcfs(burst, 4);
    sjf(burst, 4);
    roundRobin(burst, 4, 2);

    // 13-14. Critical Section & Semaphore
    printf("\nCritical Section:\n");
    criticalSection();

    printf("\nSemaphore Operations:\n");
    waitOperation();
    signalOperation();

    // 15. Deadlock
    printf("\nDeadlock Necessary Conditions:\n");
    deadlockConditions();

    // 16. Paging
    printf("\nPaging Example:\n");
    paging(1456, 256);

    // 17. Virtual Memory
    virtualMemoryDemo();

    // 18. FIFO Page Replacement
    int pages[] = {1, 2, 3, 1, 4, 5};
    printf("\nFIFO Page Replacement:\n");
    fifoPageReplacement(pages, 6, 3);

    return 0;
}
```
