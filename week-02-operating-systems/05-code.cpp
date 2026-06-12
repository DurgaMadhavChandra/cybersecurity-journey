//1114_print_in_order.cpp #include <mutex> #include <condition_variable> using namespace std;

class Foo {
private:
    mutex mtx;
    condition_variable cv;
    int stage;

public:
    Foo() {
    stage = 1;
    }

    void first(function<void()> printFirst) {
    unique_lock<mutex> lock(mtx);
    printFirst();
    stage = 2;
    cv.notify_all();
    }

    void second(function<void()> printSecond) {
    unique_lock<mutex> lock(mtx);
    cv.wait(lock, [&]() { return stage == 2; });
    printSecond();
    stage = 3;
    cv.notify_all();
    }

    void third(function<void()> printThird) {
    unique_lock<mutex> lock(mtx);
    cv.wait(lock, [&]() { return stage == 3; });
    printThird();
    }
};


//1115_print_foobar_alternately.cpp

#include <semaphore.h>
using namespace std;

class FooBar {
private:
    int n;
    sem_t fooSem, barSem;

public:
    FooBar(int n) {
    this->n = n;
    sem_init(&fooSem, 0, 1);
    sem_init(&barSem, 0, 0);
    }

    void foo(function<void()> printFoo) {
    for (int i = 0; i < n; i++) {
    sem_wait(&fooSem);
    printFoo();
    sem_post(&barSem);
    }
    }

    void bar(function<void()> printBar) {
    for (int i = 0; i < n; i++) {
    sem_wait(&barSem);
    printBar();
    sem_post(&fooSem);
    }
    }
};

//1116_print_zero_even_odd.cpp

#include <semaphore.h>
using namespace std;

class ZeroEvenOdd {
private:
    int n;
    sem_t zeroSem, evenSem, oddSem;

public:
    ZeroEvenOdd(int n) {
    this->n = n;
    sem_init(&zeroSem, 0, 1);
    sem_init(&evenSem, 0, 0);
    sem_init(&oddSem, 0, 0);
    }

    void zero(function<void(int)> printNumber) {
    for (int i = 1; i <= n; i++) {
    sem_wait(&zeroSem);
    printNumber(0);

    if (i % 2)
    sem_post(&oddSem);
    else
    sem_post(&evenSem);
    }
    }

    void even(function<void(int)> printNumber) {
    for (int i = 2; i <= n; i += 2) {
    sem_wait(&evenSem);
    printNumber(i);
    sem_post(&zeroSem);
    }
    }

    void odd(function<void(int)> printNumber) {
    for (int i = 1; i <= n; i += 2) {
    sem_wait(&oddSem);
    printNumber(i);
    sem_post(&zeroSem);
    }
    }
};

//1117_building_h2o.cpp

#include <semaphore.h>
#include <mutex>
using namespace std;

class **H2O** {
private:
    sem_t hydrogenSem;
    sem_t oxygenSem;
    int hydrogenCount;
    mutex mtx;

public:
    **H2O**() {
    sem_init(&hydrogenSem, 0, 2);
    sem_init(&oxygenSem, 0, 0);
    hydrogenCount = 0;
    }

    void hydrogen(function<void()> releaseHydrogen) {
    sem_wait(&hydrogenSem);
    releaseHydrogen();

    lock_guard<mutex> lock(mtx);
    hydrogenCount++;

    if (hydrogenCount == 2)
    sem_post(&oxygenSem);
    }

    void oxygen(function<void()> releaseOxygen) {
    sem_wait(&oxygenSem);
    releaseOxygen();

    hydrogenCount = 0;
    sem_post(&hydrogenSem);
    sem_post(&hydrogenSem);
    }
};


//1195_fizz_buzz_multithreaded.cpp


#include <mutex>
#include <condition_variable>
using namespace std;

class FizzBuzz {
private:
    int n;
    int current;
    mutex mtx;
    condition_variable cv;

public:
    FizzBuzz(int n) {
    this->n = n;
    current = 1;
    }

    void fizz(function<void()> printFizz) {
    while (true) {
    unique_lock<mutex> lock(mtx);
    cv.wait(lock, [&]() {
    return current > n ||
    (current % 3 == 0 && current % 5 != 0);
    });

            if (current > n) break;

    printFizz();
    current++;
    cv.notify_all();
    }
    }

    void buzz(function<void()> printBuzz) {
    while (true) {
    unique_lock<mutex> lock(mtx);
    cv.wait(lock, [&]() {
    return current > n ||
    (current % 5 == 0 && current % 3 != 0);
    });

            if (current > n) break;

    printBuzz();
    current++;
    cv.notify_all();
    }
    }

    void fizzbuzz(function<void()> printFizzBuzz) {
    while (true) {
    unique_lock<mutex> lock(mtx);
    cv.wait(lock, [&]() {
    return current > n ||
    (current % 15 == 0);
    });

            if (current > n) break;

    printFizzBuzz();
    current++;
    cv.notify_all();
    }
    }

    void number(function<void(int)> printNumber) {
    while (true) {
    unique_lock<mutex> lock(mtx);
    cv.wait(lock, [&]() {
    return current > n ||
    (current % 3 != 0 && current % 5 != 0);
    });

            if (current > n) break;

    printNumber(current++);
    cv.notify_all();
    }
    }
};

//1226_dining_philosophers.cpp

  #include <mutex>
using namespace std;

class DiningPhilosophers {
private:
    mutex forks[5];

public:
    DiningPhilosophers() {}

    void wantsToEat(
    int philosopher,
    function<void()> pickLeftFork,
    function<void()> pickRightFork,
    function<void()> eat,
    function<void()> putLeftFork,
    function<void()> putRightFork) {

    int left = philosopher;
    int right = (philosopher + 1) % 5;

        lock(forks[min(left, right)], forks[max(left, right)]);

    lock_guard<mutex> leftLock(
    forks[min(left, right)], adopt_lock);

    lock_guard<mutex> rightLock(
    forks[max(left, right)], adopt_lock);

    pickLeftFork();
    pickRightFork();

        eat();

    putLeftFork();
    putRightFork();
    }
};
