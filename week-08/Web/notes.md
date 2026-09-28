```text
★★★★★ arrow vs normal functions
★★★★★ this
★★★★★ arguments

★★★★★ implicit return
★★★★★ returning objects

★★★★ prototype
★★★★ constructors

★★★★ static vs instance

★★★ private fields

★★★ Promise states
```

# Part 1 - JavaScript

1. Arrow function

```js
const add = (a, b) => {
    return a + b; 
};
```

then

```js
const add = (a,b) => a + b; 
```

Learn: 
```text
{ } body
   ↓
usually explicit return

no { }
   ↓
implicit return
```
2. Returning an object from arrow function 

correct
```js
const getObject = () => ({
    name: "John"
});
```
```text
Arrow implicit object return

() => ({ ... })
       ↑
   parentheses
```
3. `this` in arrow functions

Normal function: 
```js
const user = {
    age: 20,

    getDetails: function () {
        console.log(this.age); 
    }
}
```
Calling: 
```js
user.getDetails();
```
`this` refers to
```text
user
```

But Arrow functions: 
```js
getDetails: () => {
    console.log(this.age);
}
```
does not get it's own `this`
instead
```text
arrow function
      ↓
inherits this
from surrounding lexical scope
```

4. Arrow functions don't have their own `arguments`

Normal function: 
```js
function test() {
    console.log(arguments.length); 
}
```
has its own: 
```js
arguments
```

Arrow function
```js
const test = () => {
    console.log(arguments.length);
};
```
doesn;t

Your mental model 

```text
Normal function
→ own this
→ own arguments
→ prototype
→ can be constructor

Arrow function
→ lexical this
→ no own arguments
→ no prototype
→ cannot be constructor
```

5. Prototype

know this basic fact: 
```js
const arrowFn = () => {}; 
console.log(arrowFun.prototype);
```
Arrow functions don't have a `prototype` property

Normal functions do: 
```js
function normalFn() {}
console.log(normalFn.prototype); 
```

6. Constructor functions

Understand: 
```js
function User() {}
```

can be used with 

```js
new User(); 
```

But: 

```js
const User = () => {}; 
```
cannot be used as a constructor. 

So remember 
```text
normal function -> constructor possible
arrow function -> constructor impossible
```

# Part 2 - JavaScript Classes

1. Private fields

```js
class User {
    #password = "secret";
}
```

means

```text
#password
    ↓
private field
    ↓
only accessible inside class
```

And access inside a method should be: 

```js
this.#password
```

2. static

```js
class User{
    static count = 10;
}
```

means: 

```text
count belonds to User CLASS
not each User OBJECT
```

Therefore

```
User.count
```
works

But: 

```js
count user = new User();

user.count
```
is not the same property

**Static vs instance**

| Static              | Instance          |
| ------------------- | ----------------- |
| `User.count`        | `user.count`      |
| Belongs to class    | Belongs to object |
| `static count = 10` | `this.count = 20` |

Then understand this

```js
class User {
    static count = 10;

    constructor() {
        this.count = 20;
    }
}
```

Now: 

```js
User.count
```

and

```js
user.count
```

are tewo different properties

# Part 3 - Promises

```text
pending
   ↓
fulfilled

or

pending
   ↓
rejected
```

states -. pending, fulfilled, rejected
