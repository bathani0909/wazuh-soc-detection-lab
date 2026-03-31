# Detection Architecture

This document explains how alerts are generated, collected, processed, and investigated within the Wazuh SOC Detection Lab.

The architecture was designed to simulate a **small SOC monitoring workflow** with both Linux and Windows telemetry sources.

---

## High-Level Detection Flow

```text
Kali Linux / Local Endpoint Activity
                ↓
     Security-Relevant Events Occur
                ↓
 Ubuntu / Windows Wazuh Agents Collect Logs
                ↓
        Events Sent to Wazuh Server
                ↓
   Built-in + Custom Rules Are Applied
                ↓
      Alerts Generated in Wazuh Dashboard
                ↓
 Analyst Reviews, Investigates, Documents


 Core Detection Components
1) Endpoint Telemetry Sources

The lab uses two monitored endpoints:

Ubuntu Endpoint

Primary telemetry sources:

/var/log/auth.log
syslog entries
sudo activity
File Integrity Monitoring (FIM) events
Suricata-related activity (supporting visibility)
Windows Server Endpoint

Primary telemetry sources:

Windows Security Event Log
PowerShell-related logs
Sysmon event telemetry
registry / process execution-related visibility
2) Wazuh Agents

Each monitored system has a Wazuh agent installed and actively sending events to the Wazuh server.

Agent coverage:
Linux authentication logs
Windows event logs
FIM telemetry
process and command-related activity
event forwarding to centralized detection logic
3) Wazuh Server

The Wazuh server acts as the central detection engine and analysis platform.

Its responsibilities include:

receiving endpoint telemetry
decoding and normalizing events
applying detection rules
assigning severity levels
presenting alerts in the Wazuh dashboard
Detection Logic Design

This project uses both:

Wazuh built-in detections
Custom local rules

The custom rules were added to make the project more portfolio-relevant by ensuring that specific simulated attack behaviors generated meaningful alerts.

Custom Detection Categories
Ubuntu Detection Categories
Authentication Abuse

Used to detect:

invalid user SSH attempts
repeated login attempts
brute-force style behavior
Privilege Escalation

Used to detect:

suspicious sudo execution attempts
privilege misuse indicators
File Integrity Monitoring (Critical)

Used to detect:

modification of a monitored sensitive file:
/opt/wazuh-watch/critical_file.txt
Windows Detection Categories
Authentication Monitoring

Used to detect:

failed Windows logons
repeated authentication failures
PowerShell Execution

Used to detect:

suspicious or investigation-worthy PowerShell activity
Discovery / Enumeration

Used to detect:

administrative or discovery-style commands
local system/user/group enumeration
Persistence Simulation

Used to detect:

registry autorun persistence behavior
Severity Design

The project was intentionally designed around SOC-friendly severity levels.

High Severity

Used for alerts that may indicate:

brute-force activity
suspicious authentication attempts
PowerShell execution
privilege escalation behavior
repeated failed logons
Critical Severity

Used for alerts that may indicate:

sensitive monitored file tampering
persistence behavior on monitored endpoints

This makes the project more realistic for analyst documentation and triage exercises.

Alert Validation Approach

Each alert was validated using one or more of the following:

Wazuh dashboard alert review
endpoint-side log generation
known simulation script execution
repeated event generation to confirm rule matching
custom rule tuning where required

This helped ensure that detections were not just theoretical, but actually triggered in the lab.

SOC Investigation Workflow

After an alert was triggered, the following workflow was used:

Confirm alert appeared in Wazuh
Identify source host and source IP
Review event details and relevant fields
Determine if the activity was expected or suspicious
Map the activity to attacker behavior
Document findings in a case note

This mirrors how a junior SOC analyst would approach basic SIEM triage.

Detection Engineering Value

This project demonstrates practical detection engineering concepts such as:

event-driven rule logic
severity-based detection design
custom alert creation
cross-platform monitoring
realistic alert simulation
detection validation and tuning
Summary

The detection architecture in this lab was designed to be:

simple enough to explain clearly
realistic enough for SOC portfolio value
practical enough to demonstrate hands-on detection work

It shows the full path from event generation → alerting → investigation → documentation.