object + prototypes + classes

JAVASCRIPT
────────────────────────────

Object.assign(target, source)
= copies properties into target
= returns target

Object.assign()
= SHALLOW COPY

Nested object
= reference is shared

Object.create(proto)
= creates object with specified prototype
= doesn't copy properties

prototype
= object used for property/method lookup

class
= cleaner syntax for prototype-based behavior

new Class()
= creates instance

Class()
= ❌ error

hasOwnProperty()
= checks ONLY object's own properties

Class methods
= stored/accessed through prototype



1. Object.assign()

```js
const target = {}

Object.assign(target, {
    name: "John"
});
```
it copies properties into target 

Important: 

```js
const result = Object.assign(targt, source); 

result == target
```

is: 

```text
true
```
Because `Object.assign()` returns the target object

1. Object.assign() modigies the target

```js
const user = {
    name: "John"
};

Object.assign(user, {
    age: 20
});
```
Now: 

```js
true
```

is: 

```js
{
    name: "John"
    age: 20
}
```

It doesn't replace teh object - it adds/ overwrites properties.

🔥 Shallow Copy

This is probably the most important JS trap here

```js
const source = {
    address: {
        city: "Chandigarh"
    }
};

const target = Object.assign({}, source);
```

This: 
```js
target.address === source.address
```
is: 
```js
true
```
Why? 
Because `Object.assign() performs a shalow copy

Think: 

```text
source
  |
  └── address ─────┐
                   ↓
                 object

target
  |
  └── address ─────┘
```

Both point to the same nested object

Therfore: 

```js
target.address.city = "Mumbai";
```

also changes: 

```js
source.address.city
```

to Mumbai


**Memorize**
> `Object.assign()` = shallow copy

3. Object.create()

Different purpose.

```js
const person = {
    name: "John"
};

const user = Object.create(person)
```

This means: 
> Create `user` whose prototype is `person`

It does not copy the properties. 

so:

```js
user.name
```
works because JS loops up

```text
user
 ↓
prototype → person
 ↓
name
```
But: 
```js
user.hadOwnProperty("name")
```
is: 
```js
false
```
because `name` belongs to the prototype, not `user` itself

4. Classes + Prototypes

The big picture: 

```text
JavaScript is prototype based.

class = cleaner syntax built around prototypes
```

Both clssses and constructor functions participate in prototype-based inhertiance

Example: 

```js
class Student {
    constructor(name) {
        this.name = name; 
    }

    greet() {
        console.log("Hello"); 
    }
}
```

When you do: 

```js
const s1 = new Student("Rishi"); 
const s2 = new Student("Aman"); 
```

`greet()` isn't separately created for every object. 

It's on: 

```txt
Student.prototype
```

So both instances can access it.

---
`new` is mandatory for class

```js
const s = Studnet("Rishi"); 
```

❌ Error.

```js
cons s = new Studnet("Rishi");
```

✅ Correct.