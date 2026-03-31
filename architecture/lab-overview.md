# Lab Overview

This project was built as a **small SOC / SIEM monitoring lab** using Wazuh to collect, analyze, and investigate security-relevant activity from both Linux and Windows endpoints.

The lab was intentionally designed to simulate a realistic analyst workflow where monitored systems generate alerts, those alerts are reviewed inside the SIEM, and the resulting investigations are documented.

---

## Lab Purpose

The purpose of this environment is to demonstrate:

- endpoint onboarding into Wazuh
- cross-platform security monitoring
- custom detection engineering
- alert triage and investigation
- attacker simulation from a separate host
- portfolio-ready incident documentation

This lab reflects a **defensive security / Blue Team workflow** rather than a general IT lab.

---

## Lab Systems

### 1) Wazuh Server
**Role:** Central SIEM / log analysis / alerting platform

- **Host:** Wazuh Server
- **IP Address:** `192.168.101.136`
- **Purpose:**  
  Receives events from monitored endpoints, applies detection rules, generates alerts, and provides analyst visibility through the Wazuh dashboard.

---

### 2) Ubuntu Endpoint
**Role:** Linux monitored endpoint

- **Hostname:** `ubuntu`
- **Operating System:** Ubuntu 24.04.4 LTS
- **IP Address:** `192.168.101.139`
- **Wazuh Agent:** Installed and active
- **Additional Security Tooling:** Suricata IDS

**Purpose in lab:**
- simulate Linux authentication abuse
- generate sudo / privilege escalation-related alerts
- trigger file integrity monitoring alerts
- monitor Linux host activity

---

### 3) Windows Server Endpoint
**Role:** Windows monitored endpoint

- **Hostname:** `WS-25`
- **Operating System:** Microsoft Windows Server 2025 Datacenter Evaluation
- **IP Address:** `192.168.101.133`
- **Wazuh Agent:** Installed and active
- **Sysmon:** Installed and active

**Purpose in lab:**
- generate Windows authentication events
- simulate PowerShell execution activity
- simulate discovery and persistence behavior
- provide Windows event telemetry for Wazuh detection

---

### 4) Kali Linux Attacker System
**Role:** Attack simulation / adversary emulation host

- **Hostname:** `kali`
- **Operating System:** Kali GNU/Linux Rolling
- **IP Address:** `192.168.101.128`

**Purpose in lab:**
- simulate attacker activity against Ubuntu and Windows systems
- generate SSH and reconnaissance-style alerts
- support realistic security event generation

---

## Monitoring Design

The Wazuh server is used as the central analysis point.

### Data flow:
- Ubuntu endpoint sends logs and telemetry to Wazuh
- Windows endpoint sends Windows event logs and Sysmon data to Wazuh
- Kali Linux is used to generate suspicious traffic / activity
- Wazuh applies built-in and custom rules
- Alerts are reviewed and investigated

---

## Detection Focus Areas

This lab focuses on practical, analyst-relevant detections.

### Linux detections:
- SSH invalid user attempts
- repeated SSH authentication failures
- suspicious sudo behavior
- critical file integrity monitoring events

### Windows detections:
- failed logons
- repeated failed logons
- PowerShell activity
- discovery / enumeration commands
- persistence-related registry activity

---

## Investigation Workflow

For each significant alert, the investigation process followed this structure:

1. Trigger suspicious activity
2. Confirm Wazuh alert generation
3. Review raw event / log details
4. Identify source system and event context
5. Determine severity and probable intent
6. Map to MITRE ATT&CK where relevant
7. Document analyst findings

This makes the project suitable for demonstrating **SOC analyst methodology**.

---

## Why This Lab Matters

This environment was built to show more than just tool installation.

It demonstrates the ability to:

- build a usable detection lab
- understand endpoint telemetry
- generate realistic alerts
- investigate security-relevant activity
- document findings like a junior SOC analyst

That makes it useful as a **portfolio project for cybersecurity job applications**.