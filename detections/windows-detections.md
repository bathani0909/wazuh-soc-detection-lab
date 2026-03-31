# Windows Detections – Wazuh SOC Detection Lab

This document summarizes the Windows-based detections implemented and validated in this Wazuh SOC lab.

The detections here are based on **real alert activity generated in the lab** and reflect practical SOC monitoring scenarios for Windows environments.

---

# Windows Endpoint Overview

- **Hostname:** `WS-25`
- **Operating System:** `Windows Server 2025 Datacenter Evaluation`
- **IP Address:** `192.168.101.133`
- **Wazuh Agent:** Installed and active
- **Sysmon:** Installed and active

This endpoint was used to simulate and detect:

- Authentication failures
- Brute-force patterns
- Privileged logons
- PowerShell-based activity

---

# Detection 1 – Windows Failed Logon

## Detection Summary

This detection identifies failed login attempts on the Windows system.

It is useful for detecting:

- Incorrect password attempts
- Unauthorized access attempts
- Early brute-force indicators

## Rule Details

- **Rule ID:** `100301`
- **Severity:** High

## Detection Logic

This rule is triggered when Windows logs **Event ID 4625**, which indicates a failed login attempt.

## SOC Investigation Value

This detection helps analysts:

- Identify suspicious login attempts
- Monitor user account abuse
- Detect potential credential attacks

## MITRE ATT&CK Mapping

- `T1110` – Brute Force

---

# Detection 2 – Repeated Failed Logons (Brute Force)

## Detection Summary

This detection identifies multiple failed login attempts within a short timeframe.

It is designed to detect brute-force behavior targeting Windows accounts.

## Rule Details

- **Rule ID:** `100302`
- **Severity:** High

## Detection Logic

- Triggered after multiple failed logon events
- Correlates repeated authentication failures

## SOC Investigation Value

This detection enables analysts to:

- Identify brute-force attempts
- Investigate attacker persistence
- Correlate with successful logins

## MITRE ATT&CK Mapping

- `T1110` – Brute Force

---

# Detection 3 – Successful Logon (Investigation Trigger)

## Detection Summary

This detection highlights successful logon events that may require investigation.

It is especially useful when correlated with previous failed attempts.

## Rule Details

- **Rule ID:** `100303`
- **Severity:** Medium–High

## Detection Logic

Triggered on successful authentication events that match defined criteria.

## SOC Investigation Value

This detection supports:

- Identifying compromised accounts
- Detecting lateral movement
- Validating suspicious login patterns

## MITRE ATT&CK Mapping

- `T1078` – Valid Accounts

---

# Detection 4 – Suspicious PowerShell Execution

## Detection Summary

This detection identifies PowerShell execution activity on the Windows endpoint.

PowerShell is widely used in modern attacks due to its flexibility and ability to operate without dropping files.

## Rule Details

- **Rule ID:** `100304`
- **Severity:** High

## Detection Logic

This rule matches logs containing PowerShell execution activity and is designed to surface potentially suspicious command execution.

## Observed Lab Activity

The lab simulation executed PowerShell commands using:

- ExecutionPolicy bypass
- Standard system commands

This activity successfully triggered the detection rule.

## SOC Investigation Value

This detection helps analysts:

- Identify script-based execution
- Detect fileless malware behavior
- Investigate suspicious command usage

## MITRE ATT&CK Mapping

- `T1059.001` – PowerShell

---

# Windows Detection Coverage Summary

| Detection | Rule ID | Severity | MITRE Technique |
|---|---:|---|---|
| Failed Logon | `100301` | High | `T1110` |
| Repeated Failed Logons | `100302` | High | `T1110` |
| Successful Logon (Investigation) | `100303` | Medium–High | `T1078` |
| PowerShell Execution | `100304` | High | `T1059.001` |

---

# Operational Relevance

These Windows detections demonstrate practical SOC monitoring capabilities for:

- Identity-based attacks
- Credential abuse
- Execution techniques
- Post-compromise behavior

This provides a realistic example of how Wazuh can be used for Windows endpoint detection engineering and incident investigation.

---

# Related Files

- `rules/local_rules.xml`
- `rules/custom-rule-notes.md`
- `simulations/windows-high-critical-alerts.ps1`
- `investigations/04-windows-powershell-execution.md`
- `logs/windows-powershell-execution.json`