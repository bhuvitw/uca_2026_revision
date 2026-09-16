## 1. The Critical Rendering Path (CRP)
**The Concept:** The browser's journey to turn code (HTML, CSS, JS) into pixels on teh screen. 

### Interview Talking Points: 
if asked explain CRP, reak it down into these exact steps: 
1. **DOM(Document Object Model):** Browser parses HTML to create the DOM tree
2. **CSSOM (CSS Object Model):** Browswer parses CSS to create the CSSOM tree. 
3. **Render Tree:** Combines the DOM and CSSOm to determine exactly what needs to e visible. (It ignores hidden elements like `display: none`).
4. **Layout (or Reflow):** Calculates the exact size and position of every element on the screen.
5. **Paint:** Fills in the pixels (colors, images, text).
> **Interview Tip:** Mention that Javascript can block this process. If the browser encounters a `<script>` tag, itpauses HTML parsing until the script is downloaded and executed. This leads right into the next topic. 

## 2. Optimizing Script Loading: `async` VS. `defer`
**The Concept:** Both attributes allow JavaScript files to download in the backgroudn withotu blocking the HTML parse, but they execute differntly
* `defer`: 
  * Downlaod in the background.
- * Executes only after HTML parsing is completely finished.
- * Guarantees execution order (if you have multiple deferred scrips, tehy execute in the order they appear).
* `async`:
- * Downlaods in the background.
- * Executes as soon as the download finishes, pausing the HTML parser momentarily to execute.
- * No guaranteed order (whichever downlaod first, executes first).
- * Use case: Independent third-party scripts like Goggle Analytics or ads.

## 3. Rendering Patterns: CSR vs. SSR 
**The Concept:** Where is the HTML generated-on the user's browser (Client) or the server? 
* **Client-Side Rendering (CSR):** The server sends a bare-bones HTML file (usually just `<div id="root"></div>`) and a massiv JavaScript bundle. The browser downlaods the JS, executes it, and then the page becomes visible and interactive at the same time. 
* **Server-Sice Rendering (SSR):** The server generates the fully populated HTML and sends it to the browser. The user sees teh page very quickly (Fast First Contentful Paint). However, the page is essentially "dead" at this point. It cannot respond to clicks until the browser downloads the JavaScript bundle and attaches event listeners to the HTML elements. This process is called Hydration 
> **The Interview Trap:** *The question focuses on teh gap between seeeing the page and interacting with it. Because SSR shows teh user a fully formed page immediately, there is a noticeable (Hydration). In CSR, you stare at a blank white screen until the JS executes, so visibility and interactivity happen simultaneously.*

## 4. HTML Conventions & Responsibilites
* **Default Entry Point:** Web servers automatically look for `index.html` when a user visits a root domain.
* **Responsibility:** HTL handles structure only. it never executes business logic (that is teh job of JavaScript).

## 5. Viewport Meta Tag(Mobile)
* `width=device-width`: Mathces teh page width to the physical device screen.
* `initial-scale=1.0`: Sets the default zoom level to exactly 100%.

