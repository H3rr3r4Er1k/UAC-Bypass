# 🛡️ UAC Bypass Techniques (Educational Purposes Only)

This project demonstrates **three different techniques** to bypass User Account Control (UAC) restrictions in Windows. It is intended for **educational and ethical testing** only.

> ⚠️ DISCLAIMER: This repository is for learning purposes. Do not use these techniques on systems you do not own or have explicit permission to test.

---

## 🧪 1. Customized Brute Force (UCE Edition)

A brute-force tool designed to attempt user account passwords in a controlled test environment.

### ▶️ How to Use

1. Run `userbruteforce.bat`.
2. Press `1` to scan and choose your target.
3. Press `2` and enter the username.
4. Enter your password list (`passlist.txt` by default).
5. Wait for the result.

### ⚠️ Note

If the process freezes, it's likely the password contains special characters such as: `! > < | ^`. Remove the problematic line from your wordlist and retry.

---

## 🎭 2. Fake UAC Prompt

This technique simulates a UAC prompt to trick a user into granting admin rights.

### ▶️ How to Use

1. Close any open `cmd.exe` windows.
2. Run `main.vbs`.
3. Hide the folder to avoid suspicion.
4. Ask an admin (e.g., parent/teacher) to "help" by entering credentials.
5. A command window with elevated privileges will open.

---

## 🔓 3. UAC Shielded Installer Bypass

This method uses legitimate installers with UAC to elevate privileges.

### ▶️ How to Use

1. Download a `.exe` installer that shows a UAC shield on its icon.
2. Drag the installer over `bypass.bat`.
3. If the script is blocked by antivirus, use `newbypass.bat` instead.
4. Installer runs with elevated permissions.

---

## 🧼 Antivirus Detection Tip

If `bypass.bat` is flagged by antivirus software:
- Use `newbypass.bat`, a slightly altered version to avoid static detection.

---

### 📎 Educational Use Only

These techniques are meant to understand how attackers might exploit weak UAC configurations and to help developers and administrators **harden their systems against these tactics**.

---
