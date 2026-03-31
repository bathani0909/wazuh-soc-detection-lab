# MITRE ATT&CK Mapping – Wazuh SOC Detection Lab

This document maps the detections used in this lab to the relevant **MITRE ATT&CK tactics and techniques**.

The purpose of this file is to show how the alerts generated in this project align with recognizable adversary behavior and SOC detection engineering practices.

---

# Why MITRE Mapping Matters

Mapping detections to MITRE ATT&CK helps demonstrate:

- Detection engineering maturity
- Threat-informed monitoring
- SOC investigation relevance
- Alignment between alerts and attacker behavior

This also makes the project more useful from a recruiter, analyst, and blue team portfolio perspective.

---

# Detection-to-MITRE Mapping

## Ubuntu Detections

### 1) SSH Invalid User Authentication Attempt

- **Rule ID:** `100201`
- **Platform:** Ubuntu / Linux
- **Severity:** High

#### MITRE ATT&CK Mapping

- **Tactic:** Credential Access
  - **Technique:** `T1110.001` – Password Guessing

- **Tactic:** Lateral Movement
  - **Technique:** `T1021.004` – SSH

#### Why this mapping fits

Repeated or invalid SSH login attempts commonly represent:

- Password guessing
- External access attempts
- Initial unauthorized access activity

---

### 2) Repeated SSH Invalid User Attempts

- **Rule ID:** `100202`
- **Platform:** Ubuntu / Linux
- **Severity:** High

#### MITRE ATT&CK Mapping

- **Tactic:** Credential Access
  - **Technique:** `T1110` – Brute Force

#### Why this mapping fits

Multiple failed attempts from the same source IP strongly align with brute-force behavior.

---

### 3) Suspicious Sudo Privilege Escalation

- **Rule ID:** `100203`
- **Platform:** Ubuntu / Linux
- **Severity:** High

#### MITRE ATT&CK Mapping

- **Tactic:** Privilege Escalation
  - **Technique:** `T1548.003` – Sudo and Sudo Caching

- **Tactic:** Defense Evasion
  - **Technique:** `T1548.003` – Sudo and Sudo Caching

#### Why this mapping fits

Abuse of `sudo` is a common Linux privilege escalation method and can also be used to bypass operational restrictions.

---

### 4) Critical Sensitive File Modification

- **Rule ID:** `100204`
- **Platform:** Ubuntu / Linux
- **Severity:** Critical

#### MITRE ATT&CK Mapping

- **Tactic:** Impact
  - **Technique:** `T1565.001` – Stored Data Manipulation

#### Why this mapping fits

Unexpected modification of a monitored sensitive file is consistent with unauthorized tampering or integrity compromise.

---

# Windows Detections

### 5) Windows Failed Logon

- **Rule ID:** `100301`
- **Platform:** Windows
- **Severity:** High

#### MITRE ATT&CK Mapping

- **Tactic:** Credential Access
  - **Technique:** `T1110` – Brute Force

#### Why this mapping fits

Failed authentication attempts are a common indicator of password spraying or brute-force activity.

---

### 6) Repeated Windows Failed Logons

- **Rule ID:** `100302`
- **Platform:** Windows
- **Severity:** High

#### MITRE ATT&CK Mapping

- **Tactic:** Credential Access
  - **Technique:** `T1110` – Brute Force

#### Why this mapping fits

Multiple failed login attempts in a short period indicate likely automated or repeated access attempts.

---

### 7) Windows Successful Logon (Investigation Trigger)

- **Rule ID:** `100303`
- **Platform:** Windows
- **Severity:** High

#### MITRE ATT&CK Mapping

- **Tactic:** Defense Evasion / Persistence / Privilege Escalation / Initial Access
  - **Technique:** `T1078` – Valid Accounts

#### Why this mapping fits

Successful authentication may be benign or malicious depending on context. This detection is valuable when correlated with suspicious preceding activity.

---

### 8) Suspicious PowerShell Execution

- **Rule ID:** `100304`
- **Platform:** Windows
- **Severity:** High

#### MITRE ATT&CK Mapping

- **Tactic:** Execution
  - **Technique:** `T1059.001` – PowerShell

#### Why this mapping fits

PowerShell is frequently used in attacker tradecraft for:

- Execution
- Discovery
- Download behavior
- Fileless techniques

---

# Summary Table

| Rule ID | Detection | Platform | Severity | MITRE Technique |
|---|---|---|---|---|
| `100201` | SSH Invalid User Authentication | Ubuntu | High | `T1110.001`, `T1021.004` |
| `100202` | Repeated SSH Attempts | Ubuntu | High | `T1110` |
| `100203` | Suspicious Sudo Privilege Escalation | Ubuntu | High | `T1548.003` |
| `100204` | Critical File Modification | Ubuntu | Critical | `T1565.001` |
| `100301` | Windows Failed Logon | Windows | High | `T1110` |
| `100302` | Repeated Windows Failed Logons | Windows | High | `T1110` |
| `100303` | Windows Successful Logon | Windows | High | `T1078` |
| `100304` | PowerShell Execution | Windows | High | `T1059.001` |

---

# SOC Value of This Mapping

This ATT&CK alignment helps position the project as more than a basic home lab by showing:

- Detection logic tied to attacker behavior
- Investigation relevance
- Threat-informed monitoring design
- Practical SOC documentation maturity

This improves the portfolio value of the project for roles involving:

- SOC analysis
- Detection engineering
- Blue team operations
- Threat detection and investigation

---

# Related Files

- `rules/local_rules.xml`
- `rules/custom-rule-notes.md`
- `detections/ubuntu-detections.md`
- `detections/windows-detections.md`
- `investigations/`