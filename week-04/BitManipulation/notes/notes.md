`&` → KEEP/FILTER

Think: 
> "I only want bits that are 1 in both."

This is why AND is useful for **masking/checking bits**. 

`|` → SET / TURN ON 

Think: 
> "If either side has a 1, the result gets a 1."

`^` → DIFFER/TOGGLE

`~` → FLIP EVERYTHING

![alt text](image.png)

![alt text](image-1.png)

```text
n-bit signed:

minimum = -2^(n-1)
maximum =  2^(n-1) - 1
```

```text
1000 0000

unsigned → 128
signed   → -128
```

`>>`    -> Right shift
`<<`    -> Left Shift

```text
x << n ≈ x × 2ⁿ
```

Right Shift
1. Arthematic Right Shift: preserves sign bit 
2. Logical Right Shift: fill with 0

---
Bit Masking

1. Setting a Bit
![alt text](image-2.png)

2. Clearing a Bit
![alt text](image-3.png)

3. Flipping a Bit
![alt text](image-4.png)

4. Checking a Bit
![alt text](image-5.png)

Logical vs Bitwise thinking

`~n + 1 = -n`

![alt text](image-6.png)


