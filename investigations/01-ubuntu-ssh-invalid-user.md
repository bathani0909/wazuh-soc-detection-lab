# Investigation 01 – SSH Invalid User Authentication Attempt (Ubuntu)

This investigation documents a high-severity alert triggered by suspicious SSH authentication attempts on the Ubuntu endpoint.

This scenario simulates a real-world brute-force or reconnaissance attempt originating from an attacker system.

---

# Alert Summary

- **Rule ID:** `100201`
- **Severity:** High
- **Agent:** `ubuntu-139`
- **Source IP:** `192.168.101.128` (Kali Linux attacker)
- **Log Source:** `sshd`

---

# Alert Description

The alert was triggered due to an SSH login attempt using an **invalid username**.

This behavior is commonly associated with:

- Brute-force attacks
- Username enumeration
- Unauthorized remote access attempts

---

# Raw Log Evidence

```json
{"timestamp":"2026-03-31T10:15:21.718+0000","rule":{"level":13,"description":"High Severity - Suspicious SSH invalid-user authentication attempt detected on Ubuntu","id":"100201"},"agent":{"name":"ubuntu-139","ip":"192.168.101.139"},"full_log":"Invalid user fakeuser from 192.168.101.128 port 38836"}

Key Indicators
Invalid username: fakeuser
Source IP: 192.168.101.128
Protocol: SSH
Repeated attempts observed (fired multiple times)
Investigation Steps
1) Validate Source IP
Confirm whether the source IP is internal or external
In this lab:
Source IP belongs to Kali attacker machine
2) Check Frequency of Attempts
Multiple authentication failures observed
Indicates automated or scripted activity
3) Review Username Patterns
Invalid or uncommon usernames used
Suggests enumeration attempt
4) Correlate with Other Alerts
Look for:
Rule 100202 (brute-force escalation)
Any successful login attempts after failures
5) Review System Logs
Inspect:
/var/log/auth.log
journald logs via Wazuh
Analysis

This activity is consistent with SSH brute-force or reconnaissance behavior.

The attacker is attempting to:

Identify valid usernames
Gain unauthorized access to the system

No successful authentication was observed in this scenario.

MITRE ATT&CK Mapping
T1110.001 – Password Guessing
T1021.004 – SSH
Response Actions

Recommended SOC actions:

Block or monitor the source IP
Enable rate limiting for SSH
Implement fail2ban or similar controls
Enforce strong authentication policies
Consider disabling password-based SSH login
Outcome
Attack successfully detected
No compromise observed
Detection rule functioned as expected
Lessons Learned
SSH services are a primary attack surface
Early detection of invalid login attempts is critical
Correlation with repeated attempts improves detection confidence
Related Files
logs/ubuntu-ssh-invalid-user.json
detections/ubuntu-detections.md
rules/local_rules.xml
rules/custom-rule-notes.md