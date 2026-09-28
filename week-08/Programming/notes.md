# Comparator & Comparable in Java


```text
★★★★★ Comparable vs Comparator

★★★★★ compareTo()
★★★★★ compare()

★★★★★ Comparator.comparing()
★★★★★ reversed()
★★★★★ thenComparing()

★★★★ streams
★★★★ filter()
★★★★ sorted()
★★★★ method references
```

```txt
Comparable:
compareTo(T other)

Comparator:
compare(T o1, T o2)

Ascending:
Comparator.comparing(...)

Descending:
Comparator.comparing(...).reversed()

Multiple keys:
Comparator.comparing(...)
    .thenComparing(...)

Stream:
stream()
.filter()
.sorted()
.collect()
```

1. Comparable
-> Comparable = the object knows it natural/default ordering

```txt
Comparable
    ↓
implemented BY the class
    ↓
compareTo()
    ↓
defines natural/default ordering
    ↓
ONE natural ordering
```
return value
```java
a.compareTo(b)
```
negative -> a before b          -> `< 0`
0        -> a == b in ordering  -> `= 0`
postive  -> a after b           -> `> 0`

2. Comparator
-> Comparator = an external rule for comparing objects

```java 
Comparator<Employee> bySalary = 
    (e1, e2) -> Double.compare(e1.getSalary(), e2.getSalary()); 
```

```java
Comparator.comparing(Employee::getSalary)
```

```text
Comparable
    ↓
implemented BY the class
    ↓
compareTo()
    ↓
defines natural/default ordering
    ↓
ONE natural ordering
```

3. The most important comparison

| Comparable                                       | Comparator               |
| ------------------------------------------------ | ------------------------ |
| Implemented by class                             | Separate object/function |
| `compareTo()`                                    | `compare()`              |
| Natural/default ordering                         | Custom ordering          |
| Generally one natural order                      | Can have many            |
| `class Employee implements Comparable<Employee>` | `Comparator<Employee>`   |

4. Comparator.comapring()

```java
Comparator.comparing(EMployee::getSalary)
```
Reat it as
> "Create a  comparator based on salary"

Then: 
```java
employees.sort(
    Comparator.comparing(Employee::getSalary)
);
```
means: 
> Sort employees by salary acending

5. reversed()

```java 
Comparator.comparing(Employee::getSalary)
    .reversed()
```
means

```text
salary ascending
        ↓
reversed()
        ↓
salary descending
```
6. thenComparing()

```Java
Comparator.comparing(Employee::getDepartment)
    .thenComparing(Employee::getName)
```
Think: 
```text
FIRST -> department

If department is differnt: 
    department decide

If departmnet is SAME: 
    name decides
```

So: 
```text
Primary sorting key
       ↓
department
       ↓
tie?
       ↓
name
```
7. Streams

```Java
employees.stream()
    .filter(...)
    .sorted(...)
    .collect(Collectors.toList());
```
Mental mode: 
```text
List
 ↓
stream()
 ↓
filter
 ↓
sorted
 ↓
collect
 ↓
List
```

For example: 
```java
employees.stream()
    .filter(e -> e.getSalary() > 100000)
    .sorted(Comparator.comparing(Employee::getSalary))
    .collect(Collectors.toList());
```
