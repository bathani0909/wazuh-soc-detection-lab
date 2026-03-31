# Ubuntu Detections – Wazuh SOC Detection Lab

This document summarizes the Ubuntu-based detections implemented and validated in this Wazuh SOC lab.

The detections in this section are based on **real alert activity generated in the lab** and represent practical Linux monitoring and investigation use cases relevant to SOC operations.

---

# Ubuntu Endpoint Overview

- **Hostname:** `ubuntu`
- **Operating System:** `Ubuntu 24.04.4 LTS`
- **IP Address:** `192.168.101.139`
- **Wazuh Agent:** Installed and active
- **Suricata:** Installed and active

This endpoint was used to validate Linux-focused detections related to:

- SSH abuse
- Privilege escalation
- File integrity monitoring
- Suspicious system activity

---

# Detection 1 – SSH Invalid User Authentication Attempt

## Detection Summary

This detection identifies invalid SSH login attempts made against the Ubuntu endpoint.

It is intended to capture suspicious access attempts commonly associated with:

- Brute-force attacks
- Unauthorized remote access attempts
- Username enumeration
- External reconnaissance

## Rule Details

- **Rule ID:** `100201`
- **Severity:** High
- **Agent:** `ubuntu-139`

## Detection Logic

This rule is triggered when the Ubuntu system logs an SSH authentication failure involving an invalid user.

It is built on top of Wazuh’s native SSH failed-authentication logic and tuned for higher SOC visibility.

## Observed Lab Activity

- **Attacker System:** Kali Linux
- **Source IP:** `192.168.101.128`
- **Observed Username:** `fakeuser`

## SOC Investigation Value

This detection helps identify:

- External attack attempts
- Repeated authentication failures
- Potential early-stage access attempts

## MITRE ATT&CK Mapping

- `T1110.001` – Password Guessing
- `T1021.004` – SSH

---

# Detection 2 – Suspicious Sudo Privilege Escalation

## Detection Summary

This detection identifies suspicious use of `sudo` on the Ubuntu endpoint.

It is intended to highlight privilege escalation activity and potentially unauthorized elevated command execution.

## Rule Details

- **Rule ID:** `100203`
- **Severity:** High
- **Agent:** `ubuntu-139`

## Detection Logic

This rule is triggered from elevated command execution events recorded by the system and processed by Wazuh.

The alert is useful for identifying:

- Unexpected privileged actions
- Elevated command usage
- Potential attacker post-compromise behavior

## Observed Lab Activity

The test activity generated privileged command execution under root context and triggered the custom detection successfully.

## SOC Investigation Value

This detection helps analysts investigate:

- Whether privilege escalation was legitimate
- Which command was executed
- Whether the behavior aligns with approved administrative activity

## MITRE ATT&CK Mapping

- `T1548.003` – Sudo and Sudo Caching

---

# Detection 3 – Critical Sensitive File Modification

## Detection Summary

This detection identifies changes to a monitored sensitive file on the Ubuntu endpoint.

This is a **critical severity** alert and represents a file integrity monitoring (FIM) use case.

## Rule Details

- **Rule ID:** `100204`
- **Severity:** Critical
- **Agent:** `ubuntu-139`
- **Monitored File:** `/opt/wazuh-watch/critical_file.txt`

## Detection Logic

The rule triggers when the monitored file is modified and Wazuh detects changes such as:

- File size changes
- Permission changes
- Timestamp changes
- Hash value changes

## Observed Lab Activity

The monitored file was deliberately modified during testing and successfully triggered a critical alert.

## SOC Investigation Value

This detection is valuable for identifying:

- Unauthorized file tampering
- Sensitive file manipulation
- Potential impact or sabotage activity

## MITRE ATT&CK Mapping

- `T1565.001` – Stored Data Manipulation

---

# Ubuntu Detection Coverage Summary

The Ubuntu portion of this lab demonstrates monitoring coverage across multiple phases of attacker behavior:

| Detection | Rule ID | Severity | MITRE Technique |
|---|---:|---|---|
| SSH Invalid User Authentication | `100201` | High | `T1110.001`, `T1021.004` |
| Suspicious Sudo Privilege Escalation | `100203` | High | `T1548.003` |
| Critical Sensitive File Modification | `100204` | Critical | `T1565.001` |

---

# Operational Relevance

These Ubuntu detections reflect realistic SOC use cases for Linux endpoint monitoring, including:

- External access attempts
- Privilege misuse
- File tampering
- Host-based detection engineering

This makes the Ubuntu endpoint a practical demonstration of Wazuh-based Linux detection and investigation capability.

---

# Related Files

- `rules/local_rules.xml`
- `rules/custom-rule-notes.md`
- `simulations/ubuntu-high-alert-generator.sh`
- `simulations/kali-ubuntu-attack-sim.sh`
- `investigations/01-ubuntu-ssh-invalid-user.md`
- `investigations/02-ubuntu-sudo-privilege-escalation.md`
- `investigations/03-ubuntu-critical-file-modification.md`