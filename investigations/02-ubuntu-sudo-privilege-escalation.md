# Investigation 02 – Suspicious Sudo Privilege Escalation (Ubuntu)

This investigation documents a high-severity alert triggered by suspicious `sudo` activity on the Ubuntu endpoint.

This scenario simulates privilege escalation behavior and demonstrates how Wazuh can be used to detect elevated command execution on Linux systems.

---

# Alert Summary

- **Rule ID:** `100203`
- **Severity:** High
- **Agent:** `ubuntu-139`
- **Log Source:** `sudo`

---

# Alert Description

The alert was triggered when elevated command execution was recorded through `sudo`.

This behavior is relevant because privilege escalation is a common post-compromise activity used by attackers to:

- Gain administrative control
- Access protected files
- Modify system configurations
- Establish persistence

---

# Raw Log Evidence

```json
{"timestamp":"2026-03-31T10:30:28.527+0000","rule":{"level":13,"description":"High Severity - Suspicious sudo privilege escalation activity detected on Ubuntu","id":"100203"},"agent":{"name":"ubuntu-139","ip":"192.168.101.139"},"full_log":"Mar 31 10:30:27 ubuntu sudo[63584]:     root : TTY=pts/1 ; PWD=/root/script ; USER=root ; COMMAND=/usr/bin/cat /var/ossec/etc/ossec.conf"}

Key Indicators

Command executed with elevated privileges
Target file accessed:
/var/ossec/etc/ossec.conf
Execution context:
USER=root
Working directory:
/root/script
Investigation Steps
1) Review Executed Command

Observed command:

/usr/bin/cat /var/ossec/etc/ossec.conf
``` id="kw2vdr"

This indicates access to a sensitive Wazuh configuration file.

## 2) Validate User Context

- Review which user initiated the command
- Confirm whether the activity was expected administrative behavior

## 3) Check for Follow-on Actions

Investigate whether the elevated access was followed by:

- Configuration changes
- Service restarts
- Log tampering
- Additional privileged commands

## 4) Review Shell and Authentication History

Check:

- `.bash_history`
- `auth.log`
- `sudo` logs
- Wazuh event timeline

## 5) Correlate with Other Alerts

Look for related activity such as:

- SSH login attempts
- File modification alerts
- Suspicious process execution

---

# Analysis

This activity represents a **privilege escalation investigation point**.

In a real SOC environment, this alert would need contextual validation because:

- It may represent legitimate administrative activity
- It may also indicate post-access escalation or configuration discovery by an attacker

The fact that the command accessed Wazuh configuration makes it operationally significant.

---

# MITRE ATT&CK Mapping

- `T1548.003` – Sudo and Sudo Caching

---

# Response Actions

Recommended analyst actions:

- Confirm whether the command was authorized
- Review all recent root-level commands
- Restrict unnecessary sudo access
- Monitor sensitive configuration files
- Investigate user account activity around the same time

---

# Outcome

- Privileged activity successfully detected
- Alert provided strong investigation value
- Detection rule functioned as intended

---

# Lessons Learned

- Privilege escalation visibility is essential in Linux monitoring
- Not all elevated commands are malicious, but they should be reviewable
- Context and correlation are critical for triage accuracy

---

# Related Files

- `logs/ubuntu-sudo-privilege-escalation.json`
- `detections/ubuntu-detections.md`
- `rules/local_rules.xml`
- `rules/custom-rule-notes.md`