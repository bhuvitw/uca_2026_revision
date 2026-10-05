**Problem Statement**
Create a lightweight command-line tool named `auditlog` that allows users to append text messages to a log file and display the log file's contents with line numbers.

**Requirements**
Your program must implement a minimal CLI interface accepting two commands: **--add** and **--view**. You must only use the system calls `open`, `read`, `write` and `close`.

**Expected Usage**
```text
# 1. Add some entries
./auditlog --add "User Alice logged in."
./auditlog --add "Database backup completed successfully."

# 2. View the log file
./auditlog --view
```

**Expected Output for --view:**
```text
1: User Alice logged in.
2: Database backup completed successfully.
```

