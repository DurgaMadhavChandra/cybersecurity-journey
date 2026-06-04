# ============================================
# Week 01 — Computational Thinking
# Practicing core programming concepts
# ============================================

# 1. INPUT → PROCESS → OUTPUT
name = input("Enter your name: ")
greeting = "Hello, " + name
print(greeting)

# ============================================

# 2. VARIABLES
student_name = "Madhav"
marks = 85
is_pass = True

# ============================================

# 3. CONDITIONALS
if marks >= 40:
    print("Pass")
else:
    print("Fail")

# ============================================

# 4. LOOPS
for i in range(3):
    print("Hello")

# ============================================

# 5. FUNCTIONS
def greet(name):
    print("Hello, " + name)

greet("Madhav")

# ============================================

# 6. LINEAR SEARCH
def linear_search(arr, target):
    for i in range(len(arr)):
        if arr[i] == target:
            return i
    return -1

numbers = [2, 4, 6, 8, 10]
print(linear_search(numbers, 6))

# ============================================

# 7. BINARY SEARCH
def binary_search(arr, target):
    left = 0
    right = len(arr) - 1
    while left <= right:
        mid = (left + right) // 2
        if arr[mid] == target:
            return mid
        elif arr[mid] < target:
            left = mid + 1
        else:
            right = mid - 1
    return -1

numbers = [2, 4, 6, 8, 10]
print(binary_search(numbers, 6))