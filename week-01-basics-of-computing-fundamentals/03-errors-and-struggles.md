# Week 01 — Errors & Struggles

These are the real moments where I got stuck, confused, or completely
lost this week. I'm documenting everything honestly because struggling
is part of learning. If you're on the same journey this might help you.

---

## Struggle 1: I Thought Programming Was Just About Writing Code

### The Problem

When I started Week 1 I opened VS Code immediately.
I wanted to just start typing and figure things out.

Then CS50 Week 0 stopped me completely.

David Malan didn't open a code editor for the first hour.
He talked about THINKING. About decomposition. About abstraction.
I was frustrated. I thought — when do we actually code?

That frustration was my first struggle.
I was so focused on the destination I missed the foundation.

### My Debugging Process

I pushed through it and kept watching.
Then he showed the phone book example.

Linear Search — flip every page one by one.
Binary Search — open the middle, throw half away, repeat.

He tore the phone book in half on stage to prove the point.

That moment I paused the video and just sat there.

I went back and rewatched the entire decomposition section.
This time I applied it to something I understood — a cybersecurity attack.

Attack
│
├── Reconnaissance
├── Scanning
├── Exploitation
└── Persistence

Suddenly decomposition wasn't theory anymore.
It was exactly how a penetration tester thinks.

### The Fix

I stopped rushing toward code.
I spent an entire session just on computational thinking.
No code. Just thinking on paper.

That one decision made everything else in Week 1 easier.

**My Observation:**
If you skip computational thinking and jump straight to code
you will write working programs that solve the wrong problems.
Security professionals don't just find bugs — they think like attackers.
That thinking starts here.

---

## Struggle 2: Binary Search Confused Me Before It Clicked

### The Problem

I understood Linear Search immediately.
Start from the beginning. Check every element. Stop when found. Simple.

Then Binary Search came and I kept asking:
Why do we go to the middle? What if the answer is at the beginning?
What if the data isn't sorted? What happens at the edges?

I wrote the binary search function and it kept returning wrong indexes.

My broken code looked like this:

```c
int binary_search(int arr[], int size, int target) {
    int left = 0;
    int right = size;        // Bug was here
    while (left <= right) {
        int mid = (left + right) / 2;
        if (arr[mid] == target) return mid;
        else if (arr[mid] < target) left = mid;    // Bug was here too
        else right = mid;                          // And here
    }
    return -1;
}
```

It was running but giving wrong answers or getting stuck in infinite loops.

### My Debugging Process

I went back to the CS50 Week 3 notes and read the pseudocode carefully.

IF no elements left
Return Not Found
IF middle == target
Return Found
IF target < middle
Search Left Half
IF target > middle
Search Right Half

Then I traced through my code manually on paper with this array:

[2] [4] [6] [8] [10]
0   1   2   3    4

Target = 6

left = 0, right = 5   ← should be 4 not 5
mid = 2
arr[2] = 6 ← found but index was off

I spotted two problems:

Problem 1 — `right = size` should be `right = size - 1`
Because array index goes from 0 to size-1, not 0 to size.

Problem 2 — After comparing, I was setting `left = mid` and `right = mid`
instead of `left = mid + 1` and `right = mid - 1`.
This caused infinite loops because mid never moved.

I went to Visualgo and watched Binary Search animate live.
That visual made it click instantly.

### The Fix

```c
int binary_search(int arr[], int size, int target) {
    int left = 0;
    int right = size - 1;        // Fixed
    while (left <= right) {
        int mid = (left + right) / 2;
        if (arr[mid] == target) return mid;
        else if (arr[mid] < target) left = mid + 1;    // Fixed
        else right = mid - 1;                          // Fixed
    }
    return -1;
}
```

Tested with the same array. Worked perfectly.

**My Observation:**
Off-by-one errors are one of the most common bugs in C.
In cybersecurity this matters massively — buffer overflows happen
because a program writes one byte beyond the array boundary.
That one extra byte is how attackers take control of systems.
I understood buffer overflows better after fixing this bug.

---

## Struggle 3: Stack Overflow — I Didn't Handle Edge Cases

### The Problem

I wrote my push() function and it worked fine in testing.

```c
void push(int value) {
    if (top < MAX - 1)
        stack[++top] = value;
}
```

Then I pushed more elements than MAX allowed.
The function just silently did nothing.
No error. No warning. Just quietly failed.

In a real program this kind of silent failure is dangerous.
You think something was saved. It wasn't.

### My Debugging Process

I added a printf to check what was happening:

```c
void push(int value) {
    printf("top = %d, MAX = %d\n", top, MAX);
    if (top < MAX - 1)
        stack[++top] = value;
}
```

Output showed:

top = 4, MAX = 5
top = 4, MAX = 5
top = 4, MAX = 5

The condition `top < MAX - 1` was preventing the push
but telling nobody about it.

I checked the CS50 manual pages for proper error handling patterns.
Then I looked at how real programs handle stack overflow situations.

The answer was simple — tell the user what went wrong.

### The Fix

```c
void push(int value) {
    if (top == MAX - 1) {
        printf("Stack Overflow — cannot push %d\n", value);
        return;
    }
    stack[++top] = value;
}
```

Now if the stack is full the program tells you exactly what happened.

**My Observation:**
Silent failures are one of the most dangerous things in programming.
In cybersecurity silent failures are how breaches go undetected for months.
A system that fails without logging anything gives attackers the perfect cover.
This small bug taught me why error handling and logging matter so much in security.

---

## Struggle 4: I Mixed Up Queue and Stack Three Times

### The Problem

FIFO and LIFO kept switching in my head.

I would write enqueue thinking it was push.
I would call dequeue thinking it removed from the back.
Every time I thought I had it, I mixed them up again.

### My Debugging Process

I stopped trying to memorize the terms.
Instead I connected them to real things I already knew.

I thought about a cybersecurity operations center:

Queue = Alert triage queue

Alert 1 came in first → gets investigated first
Alert 2 came in second → gets investigated second
First in, first out

Stack = Browser history

You visit Page A, then B, then C
Press back → C disappears first
Last in, first out

Then I drew this on paper:

QUEUE               STACK
→ [1][2][3] →      [3]  ← top
in    out         [2]
front back        [1]

### The Fix

Once I had the visual connected to something real it never confused me again.

**My Observation:**
In a SOC — Security Operations Center — alerts are processed as a queue.
Critical alerts from the same time period are handled in order of arrival.
If a SOC used a stack instead the newest alerts would always get attention
and older alerts would sit at the bottom forever.
That's how real incidents get missed. Data structure choice has real consequences.

---

## Struggle 5: C Felt Like Driving Without Power Steering

### The Problem

Coming from watching Python examples in CS50 the jump to C was rough.

No automatic memory management.
No built-in string functions.
Curly braces everywhere.
Semicolons I kept forgetting.

My first C program had 4 compilation errors before it printed hello world.

error: expected ';' after return statement
error: implicit declaration of function 'get_string'
warning: format '%s' expects argument of type 'char *'

### My Debugging Process

Error 1 — Missing semicolon. Simple fix once I saw it.

Error 2 — I forgot `#include <cs50.h>` at the top.
CS50's get_string function lives in their library.
Without the include the compiler doesn't know it exists.

Error 3 — I used `string` type without understanding it's a CS50 typedef.
In standard C it's `char *` not `string`.

I went through the CS50 Week 1 notes line by line.
Compared my code against the working examples.
Found each mistake one at a time.

Fixed version:

```c
#include <stdio.h>
#include <cs50.h>

int main(void)
{
    string name = get_string("What is your name? ");
    printf("Hello, %s\n", name);
    return 0;
}
```

### The Fix

Three rules I now follow every time I write C:

1. Always write includes first before anything else
2. End every statement with a semicolon
3. Check the CS50 manual before using any function

**My Observation:**
Most real-world vulnerabilities are written in C.
Buffer overflows, format string attacks, use-after-free bugs —
all C problems. The frustration I felt learning C this week
is the same frustration attackers exploit when developers rush
and forget edge cases. Slow and careful wins in C.

---

## Week 1 Reflection on Struggles

Looking back at this week my biggest struggle wasn't any specific error.
It was slowing down enough to think before coding.

Every struggle this week had the same root cause —
I assumed I understood something before I actually did.

The fix was always the same too —
go back to basics, trace through manually, visualize it.

That pattern — assume, fail, trace, fix — is exactly how
penetration testers work. They assume a system is secure,
find where it fails, trace the vulnerability, then exploit it.

I didn't just learn computing fundamentals this week.
I learned how to debug my own thinking. 🔐

