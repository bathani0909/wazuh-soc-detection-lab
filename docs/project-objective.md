# Project Objective

The objective of this project is to build a **practical Wazuh-based SOC detection lab** that demonstrates realistic security monitoring, alert generation, and incident investigation across Linux and Windows systems.

This lab was created to simulate the type of day-to-day work performed by a **SOC Analyst / Blue Team Analyst**, including:

- monitoring endpoint telemetry
- detecting suspicious authentication activity
- identifying privilege escalation behavior
- analyzing PowerShell execution
- reviewing file integrity monitoring alerts
- documenting security investigations
- mapping detections to MITRE ATT&CK

---

## Why This Project Was Built

Many cybersecurity portfolios contain only notes, screenshots, or tool installation guides.

This project was intentionally designed to go beyond theory by showing:

- actual monitored systems
- real Wazuh agent onboarding
- custom detection rule creation
- attacker simulation activity
- alert investigation and documentation
- security-relevant event analysis

The goal was to create a repository that reflects **hands-on SOC workflow**, not just lab setup.

---

## What This Project Demonstrates

This repository demonstrates the ability to:

### 1. Build and manage a small SIEM lab
The lab includes:

- a Wazuh server
- an Ubuntu monitored endpoint
- a Windows Server monitored endpoint
- a Kali Linux attacker/simulation machine

### 2. Generate realistic detection scenarios
Custom simulations were used to create alerts related to:

- SSH authentication failures
- brute-force style login activity
- suspicious sudo usage
- monitored file changes
- Windows failed logons
- PowerShell activity
- Windows discovery behavior
- persistence-related behavior

### 3. Investigate alerts like a SOC analyst
Each major alert type is documented as an investigation case, including:

- alert context
- log evidence
- triage reasoning
- MITRE ATT&CK mapping
- analyst conclusion
- recommended response action

### 4. Showcase detection engineering fundamentals
This project includes:

- Wazuh custom rules
- alert tuning logic
- severity-focused detection design
- Windows and Linux telemetry use cases

---

## Portfolio Value

This project is intended to support applications for roles such as:

- SOC Analyst
- Security Analyst
- SIEM Analyst
- Blue Team Analyst
- Detection Engineering Intern / Junior Analyst

It is structured to show both **technical setup ability** and **security analysis ability**.

---

## Final Goal

The final goal of this project is to present a **clean, recruiter-friendly, practical cybersecurity portfolio repository** that clearly demonstrates:

- tool usage
- detection logic
- investigation thinking
- security documentation discipline

This repository is part of a larger SOC / SIEM portfolio project series.