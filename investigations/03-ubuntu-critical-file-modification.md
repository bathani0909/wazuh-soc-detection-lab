# Investigation 03 – Critical Sensitive File Modification (Ubuntu)

This investigation documents a **critical severity** File Integrity Monitoring (FIM) alert triggered by unauthorized modification of a monitored sensitive file on the Ubuntu endpoint.

This scenario demonstrates how Wazuh can detect integrity-impacting changes to critical files and support SOC investigation workflows.

---

# Alert Summary

- **Rule ID:** `100204`
- **Severity:** Critical
- **Agent:** `ubuntu-139`
- **Monitored File:** `/opt/wazuh-watch/critical_file.txt`
- **Log Source:** `syscheck`

---

# Alert Description

The alert was triggered when a monitored file was modified on the Ubuntu system.

This type of activity is important because it may indicate:

- Unauthorized file tampering
- Data manipulation
- Malicious system changes
- Potential impact activity

---

# Raw Log Evidence

```json
{"timestamp":"2026-03-31T10:29:14.141+0000","rule":{"level":15,"description":"Critical Severity - Sensitive monitored file modified on Ubuntu endpoint","id":"100204"},"agent":{"name":"ubuntu-139","ip":"192.168.101.139"},"syscheck":{"path":"/opt/wazuh-watch/critical_file.txt","event":"modified","changed_attributes":["size","permission","mtime","md5","sha1","sha256"]}}

Key Indicators
Monitored file changed:
/opt/wazuh-watch/critical_file.txt
Change type:
modified
Changed attributes:
Size
Permissions
Modification time
MD5
SHA1
SHA256
Investigation Steps
1) Identify the Modified File

The affected file was:

/opt/wazuh-watch/critical_file.txt

This file was intentionally monitored as a sensitive asset for FIM validation.

2) Review What Changed

Wazuh detected multiple integrity-impacting changes, including:

File content change
File size change
Permission change
Hash changes

These are strong indicators of file tampering or unauthorized modification.

3) Validate Whether Change Was Authorized

Analysts should determine:

Who modified the file
Whether the modification was expected
Whether there was a maintenance or admin task at that time
4) Review Preceding Activity

Correlate with:

SSH login attempts
Sudo activity
Shell history
Command execution logs
5) Review File Ownership and Permissions

Important checks include:

ls -l /opt/wazuh-watch/critical_file.txt
stat /opt/wazuh-watch/critical_file.txt

This helps determine whether the change also altered file access controls.

Analysis

This alert represents a high-confidence integrity event.

In a real environment, modification of a sensitive monitored file without change approval would require immediate triage because it may indicate:

Configuration tampering
Data manipulation
Privileged unauthorized access
Adversary impact activity

The fact that multiple file attributes changed increases the severity and investigative priority.

MITRE ATT&CK Mapping
T1565.001 – Stored Data Manipulation
Response Actions

Recommended SOC actions:

Confirm whether the file change was authorized
Identify the responsible user or process
Compare file contents before and after the change
Restore the original file if required
Increase monitoring on related sensitive paths
Outcome
File modification successfully detected
Wazuh FIM generated a critical alert as expected
Detection provided strong evidence for integrity monitoring use cases
Lessons Learned
File Integrity Monitoring is highly valuable for Linux security monitoring
Sensitive files should be monitored in real time where possible
Hash, permission, and timestamp changes provide strong forensic value
Related Files
logs/ubuntu-critical-file-modification.json
detections/ubuntu-detections.md
rules/local_rules.xml
rules/custom-rule-notes.md