#include <stdio.h>
#include <stdbool.h>

// ============================================
// Week 01 — Computing Fundamentals
// Author: Durga Madhav Chandra
// ============================================


// ============================================
// 1. COMPUTATIONAL THINKING
// ============================================

// When I first saw Linear Search I thought it was fine.
// Then I realized with 1000 elements it checks every single one.
// Binary Search blew my mind — same 1000 elements, only ~10 checks.
// The trick is it throws away half the array every single step.

int linear_search(int arr[], int size, int target) {
    for (int i = 0; i < size; i++) {
        if (arr[i] == target) return i;
    }
    return -1;
}

int binary_search(int arr[], int size, int target) {
    int left = 0;
    int right = size - 1;
    while (left <= right) {
        int mid = (left + right) / 2;
        if (arr[mid] == target) return mid;
        else if (arr[mid] < target) left = mid + 1;
        else right = mid - 1;
    }
    return -1;
}

void greet(char name[]) {
    printf("Hello, %s\n", name);
}


// ============================================
// 2. ALGORITHMS
// ============================================

// Bubble Sort and Selection Sort both have O(n²).
// Merge Sort blew both of them away with O(n log n).
// The difference matters massively at scale.

void bubble_sort(int arr[], int size) {
    for (int i = 0; i < size - 1; i++) {
        for (int j = 0; j < size - i - 1; j++) {
            if (arr[j] > arr[j + 1]) {
                int temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
            }
        }
    }
}

void selection_sort(int arr[], int size) {
    for (int i = 0; i < size - 1; i++) {
        int min = i;
        for (int j = i + 1; j < size; j++) {
            if (arr[j] < arr[min]) min = j;
        }
        int temp = arr[min];
        arr[min] = arr[i];
        arr[i] = temp;
    }
}


// ============================================
// 3. DATA STRUCTURES
// ============================================

// LIFO confused me at first.
// Then I thought of a stack of plates — you always grab the top one.
// Last in, first out. Simple once I visualized it.
//
// I also noticed my push() had no protection if stack got full.
// So I added an overflow check — learned this the hard way.

#define MAX 5
int stack[MAX];
int top = -1;

void push(int value) {
    if (top == MAX - 1) {
        printf("Stack Overflow\n");
        return;
    }
    stack[++top] = value;
}

int pop() {
    if (top >= 0) return stack[top--];
    return -1;
}

// Queue = standing in line. First person in, first person served.
int queue[MAX];
int front = 0, rear = 0;

void enqueue(int value) {
    if (rear < MAX) queue[rear++] = value;
}

int dequeue() {
    if (front < rear) return queue[front++];
    return -1;
}


// ============================================
// 4. C LANGUAGE
// ============================================

// I almost skipped input validation.
// Then I realized every real program needs to handle bad input.
// Users will always break things.

int get_positive_int() {
    int n;
    do {
        printf("Enter a positive number: ");
        scanf("%d", &n);
    } while (n < 0);
    return n;
}

// Nested loops clicked for me with this mario grid example.
void print_grid(int size) {
    for (int i = 0; i < size; i++) {
        for (int j = 0; j < size; j++) {
            printf("#");
        }
        printf("\n");
    }
}


// ============================================
// MAIN
// ============================================

int main() {

    // 1. COMPUTATIONAL THINKING
    greet("Madhav");
    int numbers[] = {2, 4, 6, 8, 10};
    printf("Linear Search: index %d\n", linear_search(numbers, 5, 6));
    printf("Binary Search: index %d\n", binary_search(numbers, 5, 6));

    // 2. ALGORITHMS
    int arr1[] = {64, 25, 12, 22, 11};
    bubble_sort(arr1, 5);
    printf("Bubble Sort: ");
    for (int i = 0; i < 5; i++) printf("%d ", arr1[i]);
    printf("\n");

    int arr2[] = {64, 25, 12, 22, 11};
    selection_sort(arr2, 5);
    printf("Selection Sort: ");
    for (int i = 0; i < 5; i++) printf("%d ", arr2[i]);
    printf("\n");

    // 3. DATA STRUCTURES
    push(10); push(20); push(30);
    printf("Stack Pop: %d\n", pop());

    enqueue(1); enqueue(2); enqueue(3);
    printf("Queue Dequeue: %d\n", dequeue());

    // 4. C LANGUAGE
    print_grid(3);

    return 0;
}