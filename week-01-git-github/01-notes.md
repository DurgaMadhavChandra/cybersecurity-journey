# Week 01 — Computing Fundamentals Notes

---

## 1. Computational Thinking

### What is it?
A problem-solving approach used before writing any code.
Every program follows: **Input → Process → Output**

### The 4 Pillars
| Pillar | Definition | Example |
|--------|-----------|---------|
| Decomposition | Break big problem into small parts | Shopping site → Login, Cart, Payment |
| Pattern Recognition | Find repeated structures | 2,4,6,8 → +2 every time |
| Abstraction | Focus on important details only | Google Maps hides GPS complexity |
| Algorithm Design | Step-by-step solution | Recipe for making tea |

### Algorithms
- **Linear Search** → Check every item → O(n)
- **Binary Search** → Split in half each time → O(log n)
- 1000 pages: Linear = 1000 checks, Binary = ~10 checks

### Pseudocode
Human-readable plan written before actual code.
Helps reduce mistakes and plan logic clearly.

### Key Programming Concepts
- **Function** → performs a specific task → `print()`
- **Variable** → stores information → `name = "Madhav"`
- **Conditional** → makes decisions → `if marks >= 40`
- **Loop** → repeats actions → `for i in range(3)`
- **Boolean** → True or False only

### How Computers Represent Data
- **Numbers** → Binary (0s and 1s) → 101 = 5
- **Text** → ASCII (A=65, B=66) and Unicode (supports emojis)
- **Images** → Pixels with RGB values → R=72, G=73, B=33

### Why It Matters for Cybersecurity
- Analyze attacks step by step (Recon → Scan → Exploit)
- Detect patterns in suspicious logins or malware
- Build tools like port scanners and log analyzers
- Automate monitoring and incident response

### Key Takeaway
> Programming is not about memorizing syntax.
> It is about learning how to think and solve problems.

---

## 2. Algorithms

### What is an Algorithm?
A step-by-step set of instructions to solve a problem.
Every program follows: **Input → Process → Output**

### Searching Algorithms
| Algorithm | How it works | Data needs sorting? | Worst Case |
|-----------|-------------|---------------------|------------|
| Linear Search | Check every element one by one | No | O(n) |
| Binary Search | Split in half each time | Yes | O(log n) |

**Example — 1000 elements:**
- Linear Search = 1000 checks
- Binary Search = ~10 checks

### Sorting Algorithms
| Algorithm | Idea | Worst Case | Best Case |
|-----------|------|------------|-----------|
| Selection Sort | Find smallest, place at beginning | O(n²) | Ω(n²) |
| Bubble Sort | Swap adjacent elements until sorted | O(n²) | Ω(n) |
| Merge Sort | Split, sort, merge (uses recursion) | O(n log n) | Ω(n log n) |

### Big O Notation
Measures how an algorithm performs as data grows.

Slowest → O(n²) → O(n log n) → O(n) → O(log n) → O(1) ← Fastest

### Recursion
A function that calls itself to solve smaller versions of the same problem.
- **Base Case** → stops the recursion
- **Recursive Case** → calls itself with smaller input

### Why It Matters for Cybersecurity
- Threat detection → analyze logs, find patterns
- Malware analysis → classify safe vs malicious files
- Password security → hashing and encryption algorithms
- Network monitoring → detect anomalies and intrusions

### Key Takeaway
> Great programmers design efficient algorithms before writing code.

---


## 3. Data Structures
*(Add notes here after studying)*

---

## 4. C Language
*(Add notes here after studying)*