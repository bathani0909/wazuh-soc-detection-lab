# Investigation 04 – Suspicious PowerShell Execution (Windows)

This investigation documents a high-severity alert triggered by PowerShell execution activity on the Windows endpoint.

This scenario demonstrates how Wazuh can detect script-based execution behavior commonly seen in attacker tradecraft and post-compromise activity.

---

# Alert Summary

- **Rule ID:** `100304`
- **Severity:** High
- **Agent:** `window-server-2025`
- **Endpoint:** `WS-25`
- **Log Source:** Windows / Sysmon / EventChannel

---

# Alert Description

The alert was triggered due to PowerShell execution-related activity on the Windows endpoint.

PowerShell is widely used by attackers because it can be leveraged for:

- Execution
- Discovery
- Persistence
- Remote administration
- Download behavior
- Fileless malware techniques

---

# Investigation Context

The alert was intentionally triggered in the lab using a controlled simulation script to validate Wazuh visibility into suspicious Windows command execution behavior.

The following type of PowerShell activity was used during testing:

```powershell
powershell -ExecutionPolicy Bypass -Command "Get-Process"

This was used as a safe execution simulation to validate alerting behavior.

Key Indicators
PowerShell execution observed
Use of:
powershell.exe
Execution style:
ExecutionPolicy Bypass
Activity category:
Script-based command execution
Investigation Steps
1) Confirm the Executed Process

Validate whether the process observed was:

powershell.exe
launched interactively or by another process
expected for the user or host role
2) Review Command Line Activity

Analysts should inspect:

Full PowerShell command line
Parent process
User context
Timestamp of execution
3) Review Additional Script Activity

Check whether the same host also showed signs of:

Discovery commands
Encoded PowerShell
Registry persistence
Network-based script execution
4) Correlate with Sysmon / Windows Logs

Review related logs for:

Process creation
PowerShell operational logs
Script block logging (if enabled)
Network connections initiated by PowerShell
5) Validate Whether Activity Was Legitimate

PowerShell is heavily used by administrators, so analyst validation is required to distinguish:

Normal administration
Lab simulation
Suspicious execution
Analysis

This alert represents a strong execution-phase investigation point.

In enterprise environments, PowerShell activity deserves careful review because it is frequently abused for:

Living-off-the-land execution
Fileless malware delivery
Host discovery
Credential access support
Lateral movement preparation

The use of ExecutionPolicy Bypass increases investigative value because it is commonly seen in offensive tooling and suspicious script execution.

MITRE ATT&CK Mapping
T1059.001 – PowerShell
Response Actions

Recommended SOC actions:

Review the full PowerShell command line
Validate the user and parent process
Check for encoded or obfuscated commands
Inspect for follow-on persistence or download behavior
Determine whether the execution aligns with approved administrative activity
Outcome
PowerShell activity successfully detected
Wazuh generated the expected high-severity alert
Detection provided practical Windows execution monitoring value
Lessons Learned
PowerShell remains one of the most important Windows detection surfaces
Even simple command execution can provide strong triage value
Visibility improves significantly when combined with Sysmon and process telemetry
Related Files
logs/windows-powershell-execution.json
detections/windows-detections.md
rules/local_rules.xml
rules/custom-rule-notes.md
simulations/windows-high-critical-alerts.ps1