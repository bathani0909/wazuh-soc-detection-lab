# Custom Rule Notes – Wazuh SOC Detection Lab

This document explains the logic, purpose, and SOC relevance of the custom Wazuh rules used in this lab.

These rules were designed based on **real attack simulations and alerts generated in the lab environment**, not theoretical use cases.

---

# Rule Design Philosophy

The rules in this lab follow these principles:

- Focus on **high-signal detections** (reduce noise)
- Align with **real SOC investigation scenarios**
- Map to **MITRE ATT&CK techniques**
- Prioritize:
  - Authentication abuse
  - Privilege escalation
  - File integrity violations
  - Script-based execution (PowerShell)

---

# Ubuntu Detection Rules

## Rule: 100201 – SSH Invalid User Authentication

### Purpose
Detect unauthorized SSH access attempts using invalid usernames.

### Why it matters
This is a common indicator of:
- Brute-force attacks
- Credential stuffing
- External reconnaissance

### Trigger Source
- Based on Wazuh rule `5710` (sshd failed login)

### Key Indicators
- Invalid user attempts
- Source IP (attacker system – Kali)
- Repeated authentication failures

### SOC Context
This alert should trigger:
- Source IP investigation
- Geo-location checks
- Correlation with brute-force patterns

### MITRE Mapping
- T1110.001 – Password Guessing
- T1021.004 – SSH

---

## Rule: 100202 – Repeated SSH Attempts (Brute Force)

### Purpose
Detect multiple failed SSH attempts from the same IP within a short time window.

### Logic
- Frequency: 5 events
- Timeframe: 120 seconds
- Same source IP required

### Why it matters
Indicates automated brute-force behavior.

### SOC Action
- Block IP (if confirmed malicious)
- Check for successful login attempts afterward
- Correlate with other alerts

### MITRE Mapping
- T1110 – Brute Force

---

## Rule: 100203 – Suspicious Sudo Privilege Escalation

### Purpose
Detect suspicious or unexpected use of `sudo`.

### Trigger Source
- Based on Wazuh rule `5402`

### Why it matters
Privilege escalation is a critical step in most attacks.

### Indicators
- Execution of commands as root
- Unusual command paths
- Repeated sudo attempts

### SOC Context
Analysts should:
- Verify user legitimacy
- Review command history
- Check for persistence mechanisms

### MITRE Mapping
- T1548.003 – Sudo and Sudo Caching

---

## Rule: 100204 – Critical File Modification

### Purpose
Detect modification of a sensitive monitored file.

### Monitored File
/opt/wazuh-watch/critical_file.txt


### Why it matters
File Integrity Monitoring (FIM) alerts indicate:
- Possible tampering
- Data manipulation
- Unauthorized access

### Alert Characteristics
- Hash changes (MD5, SHA1, SHA256)
- Permission changes
- Timestamp changes

### SOC Action
- Validate if change was authorized
- Check user activity
- Investigate preceding alerts

### MITRE Mapping
- T1565.001 – Stored Data Manipulation

---

# Windows Detection Rules

## Rule: 100301 – Failed Logon

### Purpose
Detect failed Windows authentication attempts.

### Indicator
- Event ID: 4625

### SOC Relevance
- Early sign of brute-force attempts
- Potential credential abuse

---

## Rule: 100302 – Repeated Failed Logons

### Purpose
Identify brute-force behavior on Windows systems.

### Logic
- Multiple failed logons within a short timeframe

### SOC Action
- Investigate source host
- Check account lockouts
- Correlate with successful logins

---

## Rule: 100303 – Successful Logon (Investigation Trigger)

### Purpose
Highlight successful logons for investigation.

### Why it matters
Attackers often succeed after multiple failed attempts.

### SOC Context
- Correlate with:
  - Previous failed logons
  - Privileged accounts
  - Lateral movement

### MITRE Mapping
- T1078 – Valid Accounts

---

## Rule: 100304 – PowerShell Execution Detection

### Purpose
Detect PowerShell activity on Windows endpoints.

### Why it matters
PowerShell is heavily used in:
- Fileless malware
- Post-exploitation
- Living-off-the-land techniques

### Detection Logic
- Matches PowerShell execution logs

### SOC Action
- Review executed commands
- Check parent process
- Investigate for encoded or obfuscated scripts

### MITRE Mapping
- T1059.001 – PowerShell

---

# Key Takeaways

- These rules simulate **real SOC detection use cases**
- Alerts are designed for **investigation, not just detection**
- Each rule supports:
  - Threat visibility
  - Analyst workflow
  - Incident response readiness

---

# Future Improvements

- Add correlation rules across hosts
- Integrate threat intelligence feeds
- Enhance anomaly-based detection
- Add Sigma rule equivalents