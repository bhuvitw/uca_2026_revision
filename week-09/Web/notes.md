```text
ROOT 1
Promise state
→ resolve/reject
→ first settlement wins

ROOT 2
Sync vs async
→ executor sync
→ then/catch async

ROOT 3
Fetch
→ Promise<Response>
→ response.json() → Promise<data>
→ body = ReadableStream

ROOT 4
Promise composition
→ chaining
→ Promise.all
→ AbortController
```


Promise: 
    created, pending, fulfilled -> resolve(value), rejected -> reject(error)

Promise: 
    .then() -> success
    .catch() -> failure

> `.then()` and `.catch()` HANDLE the result. They don't change the original Promise's state.

| Function    | Job                |
| ----------- | ------------------ |
| `resolve()` | Fulfill Promise    |
| `reject()`  | Reject Promise     |
| `.then()`   | Handle fulfillment |
| `.catch()`  | Handle rejection   |

```text
MyPromise
│
├── state
│     ├── pending
│     ├── fulfilled
│     └── rejected
│
├── value
│
├── error
│
├── resolve()
├── reject()
├── then()
└── catch()
```

```text
new Promise(executor)
        ↓
executor → SYNCHRONOUS

.then(callback)
        ↓
callback → ASYNCHRONOUS
```

```text
fetch()
  ↓
Promise
  ↓
Response object
  ↓
response.body
  ↓
ReadableStream
```

RULE 1: who changes Promise State? only executer's(resolve, reject)
RULE 2: Promise settles only once
RULE 3: Promise executor's are synchornous
RULE 4: Fetch gives you a Response, not the actual JSON
RULE 5: Promises are for asynchronous operations
RULE 6: AbortControllwer cancels fetch
RULE 7: Promise.all = wait for ALL