# Wazuh SOC Detection Lab

A practical SOC / Blue Team detection engineering project built with **Wazuh**, **Ubuntu**, **Windows Server**, and **Kali Linux** to simulate realistic security alerts, investigate high-severity detections, and document analyst workflows.

This repository demonstrates how a SOC analyst can:

- onboard and monitor Linux and Windows endpoints
- create realistic security detections in Wazuh
- simulate suspicious activity from an attacker system
- investigate alerts using logs and telemetry
- map detections to **MITRE ATT&CK**
- document findings in a portfolio-ready incident workflow

---

## Project Goal

The purpose of this lab is to simulate a **small real-world SOC monitoring environment** where:

- **Ubuntu endpoint** is monitored by Wazuh
- **Windows Server endpoint** is monitored by Wazuh
- **Kali Linux** is used to simulate attacker activity
- **Wazuh Manager** collects, analyzes, and alerts on suspicious events

This project is designed to reflect the type of work expected in:

- SOC Analyst (L1 / L2)
- Blue Team Analyst
- Detection Engineering Intern / Junior Analyst
- Security Monitoring / SIEM roles

---

## Lab Environment

| System | Role | IP Address |
|--------|------|------------|
| Wazuh Server | SIEM / Detection Platform | `192.168.101.136` |
| Ubuntu 24.04.4 LTS | Linux Monitored Endpoint | `192.168.101.139` |
| Windows Server 2025 | Windows Monitored Endpoint | `192.168.101.133` |
| Kali Linux | Attack / Simulation Machine | `192.168.101.128` |

---

## Key Technologies Used

- **Wazuh 4.14.2**
- **Ubuntu 24.04.4 LTS**
- **Windows Server 2025**
- **Kali Linux**
- **Sysmon (Windows)**
- **Suricata IDS (Ubuntu)**
- **Custom Wazuh Rules**
- **PowerShell**
- **Bash**
- **MITRE ATT&CK Mapping**

---

## Project Scope

This lab focuses on **high-value SOC-relevant detections** rather than generic theory notes.

### Ubuntu detections:
- SSH invalid user authentication attempts
- Repeated SSH brute-force style activity
- Suspicious sudo / privilege escalation activity
- Critical file integrity monitoring (FIM) change detection

### Windows detections:
- Failed logon attempts
- Repeated failed authentication attempts
- Suspicious PowerShell execution
- Discovery / enumeration behavior
- Registry-based persistence simulation
- PowerShell web request / download behavior

---

## Detection Engineering Highlights

This repository includes:

- custom Wazuh rules for Linux and Windows detections
- attacker simulation scripts for Kali Linux
- endpoint-side event generation scripts
- structured alert investigation notes
- mapped MITRE ATT&CK techniques
- sample alert logs for portfolio review

---

## Screenshots

### Wazuh Overview Dashboard
_Add your screenshot here_

### Endpoint Enrollment
_Add Ubuntu and Windows agent screenshots here_

### High / Critical Severity Alerts
_Add alert screenshots here_

---

## Repository Structure

```text
wazuh-soc-detection-lab/
├── README.md
├── .gitignore
├── architecture/
├── rules/
├── simulations/
├── investigations/
├── detections/
├── logs/
├── screenshots/
└── docs/