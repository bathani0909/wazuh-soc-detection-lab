# Wazuh SOC Detection Lab

> **SOC Detection Engineering & Incident Investigation with Wazuh**  
> A hands-on Blue Team lab focused on **SIEM monitoring, custom detection engineering, attacker simulation, and incident investigation** across **Linux and Windows** systems.

![Platform](https://img.shields.io/badge/Platform-Wazuh-blue)
![Focus](https://img.shields.io/badge/Focus-SOC%20Detection%20Engineering-green)
![OS](https://img.shields.io/badge/Endpoints-Windows%20%7C%20Ubuntu-orange)
![Status](https://img.shields.io/badge/Status-Completed-success)

---

## Project Summary

This repository documents a **real Wazuh-based SOC lab** built to simulate and investigate security activity in a controlled environment.

The lab was designed to practice core Blue Team workflows including:

- **SIEM alert monitoring**
- **Detection engineering**
- **Custom Wazuh rule creation**
- **Windows and Linux telemetry analysis**
- **Incident investigation**
- **MITRE ATT&CK mapping**
- **Attacker activity simulation**

This project reflects the type of workflow expected in a **junior SOC analyst / Blue Team / detection engineering** environment.

---

## Key Skills Demonstrated

- Wazuh deployment and configuration
- SIEM alert analysis
- Custom rule development
- Windows log analysis with Sysmon
- Linux log analysis and privilege escalation monitoring
- Security event triage
- Incident documentation
- Threat detection validation
- ATT&CK-aligned investigation workflows

---

## Lab Architecture

### Core Infrastructure

| System | Role | OS | IP Address |
|--------|------|----|------------|
| Wazuh Server | SIEM / Detection Platform | Amazon Linux 2023 | `192.168.101.136` |
| Ubuntu Endpoint | Linux Monitored Host | Ubuntu 24.04.4 LTS | `192.168.101.139` |
| Windows Endpoint | Windows Monitored Host | Windows Server 2025 Datacenter Evaluation | `192.168.101.133` |
| Kali Linux | Attacker Simulation Host | Kali GNU/Linux Rolling | `192.168.101.128` |

### Installed Security Components

#### Wazuh Server
- Wazuh Manager
- Wazuh Indexer
- Wazuh Dashboard

#### Ubuntu Endpoint
- Wazuh Agent
- Suricata

#### Windows Endpoint
- Wazuh Agent
- Sysmon

#### Virtualization
- VMware

---

## Detection Coverage

This lab includes **working detections validated in the environment**.

### Linux Detections (Ubuntu)

#### 1) SSH Invalid User Authentication Attempt
- **Rule ID:** `100201`
- **Severity:** High
- **MITRE ATT&CK:** `T1110.001` (Password Guessing), `T1021.004` (SSH)

**Detection Goal:**  
Identify failed SSH login attempts using invalid usernames, which may indicate brute-force or reconnaissance activity.

---

#### 2) Suspicious Sudo Privilege Escalation
- **Rule ID:** `100203`
- **Severity:** High
- **MITRE ATT&CK:** `T1548.003` (Sudo and Sudo Caching)

**Detection Goal:**  
Detect potentially suspicious privilege escalation attempts using `sudo`.

---

#### 3) Critical Sensitive File Modification
- **Rule ID:** `100204`
- **Severity:** Critical
- **MITRE ATT&CK:** `T1565.001` (Stored Data Manipulation)

**Detection Goal:**  
Detect unauthorized or high-risk modifications to sensitive files.

---

### Windows Detections (WS-25)

#### 4) Suspicious PowerShell Execution
- **Rule ID:** `100304`
- **Severity:** High
- **MITRE ATT&CK:** `T1059.001` (PowerShell)

**Detection Goal:**  
Identify suspicious or attacker-like PowerShell activity captured via Sysmon and ingested into Wazuh.

---

## Investigation Scenarios

This repository includes SOC-style investigations for validated detection scenarios.

### Included Investigation Workflows
- Linux authentication anomaly review
- Linux privilege escalation analysis
- Linux file integrity alert investigation
- Windows PowerShell execution triage

Each investigation focuses on:
- alert context
- event evidence
- analyst interpretation
- detection logic
- MITRE ATT&CK mapping
- triage outcome

---

## Repository Structure

```text
wazuh-soc-detection-lab/
├── README.md
├── screenshots/
├── detections/
├── investigations/
├── rules/
├── configs/
└── notes/
