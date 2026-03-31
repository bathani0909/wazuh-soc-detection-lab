# Simulation Scripts

This folder contains the scripts used to generate controlled alert activity in the Wazuh SOC Detection Lab.

These scripts were used to trigger realistic security-relevant events across Ubuntu, Windows, and Kali systems for validation of custom Wazuh detections.

---

# Included Scripts

## `ubuntu-high-alert-generator.sh`

Used on the Ubuntu endpoint to simulate:

- Suspicious `sudo` activity
- Sensitive file modification
- Suspicious syslog markers

---

## `kali-ubuntu-attack-sim.sh`

Used from the Kali attacker system to simulate:

- SSH invalid user attempts
- Brute-force style SSH activity
- Port scanning
- Aggressive reconnaissance scanning

---

## `windows-high-critical-alerts.ps1`

Used on the Windows endpoint to simulate:

- Suspicious PowerShell execution
- Discovery / enumeration commands
- Registry autorun persistence
- PowerShell download behavior

---

# Operational Purpose

These scripts support the project by demonstrating:

- Hands-on alert generation
- Detection validation
- Repeatable testing workflows
- Practical detection engineering methodology

---

# Safety Note

These scripts were created for use in a **contained lab environment only** and should not be executed in production systems.

---

# Related Files

- `../rules/local_rules.xml`
- `../detections/ubuntu-detections.md`
- `../detections/windows-detections.md`
- `../investigations/`
- `../logs/`