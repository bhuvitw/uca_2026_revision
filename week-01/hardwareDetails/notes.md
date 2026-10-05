**Problem Statement**
You are building an automated hardware inventory script for a cloud infrastructure provider. The script needs to gather CPU details from various Linux servers and output them in a standardized format.

Your task is to write a bash script or a one-liner command that parses the output of `lscpu` to extract specific metrics.

**Requirements**
Your script must extract the following three metrics from the lscpu command:

1. **Architecture** (e.g., x86_64, aarch64)
2. **Total number of CPU cores** (Note: Multiply Core(s) per socket by Socket(s), or target the total CPU count, taking into account threads if necessary—specify how you calculate this).
3. **CPU Model Name** (e.g., Intel(R) Xeon(R) Gold 6138 CPU @ 2.00GHz)

**Output**
Output the data as a clean, comma-separated string exactly like this: `Architecture: x86_64, Cores: 8, Model: Intel Xeon...`

