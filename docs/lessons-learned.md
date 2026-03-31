# Lessons Learned – Wazuh SOC Detection Lab

This document summarizes the practical lessons learned while building and validating this Wazuh-based SOC detection engineering lab.

This project was designed as a realistic Blue Team portfolio exercise focused on detection engineering, monitoring, and incident investigation across Linux and Windows endpoints.

---

# 1) Detection Engineering Requires Tuning, Not Just Default Alerts

One of the biggest takeaways from this project was that useful SOC detections require tuning and context.

Out-of-the-box detections are helpful, but custom rules significantly improve:

- Alert visibility
- Severity prioritization
- Investigation value
- Relevance to realistic attack behavior

Building custom Wazuh rules made the lab much more practical and portfolio-worthy.

---

# 2) Linux Monitoring Provides Strong Detection Opportunities

The Ubuntu endpoint demonstrated that Linux telemetry can be highly valuable for detection engineering.

Useful Linux detections in this lab included:

- SSH invalid-user authentication attempts
- Suspicious sudo privilege escalation
- Critical file modification alerts

This reinforced the importance of Linux log sources such as:

- `sshd`
- `sudo`
- File Integrity Monitoring (FIM)
- Journald / auth logs

---

# 3) File Integrity Monitoring Is High Value

The file modification alert was one of the strongest detections in the lab.

It showed how Wazuh can identify:

- Unauthorized file changes
- Permission modifications
- Hash changes
- Potential impact activity

This type of alert is especially valuable for:

- Critical configs
- Sensitive scripts
- Security tooling
- Operational files

---

# 4) Windows PowerShell Visibility Is Essential

The Windows portion of the lab reinforced how important PowerShell monitoring is in real SOC operations.

Even simple PowerShell execution provides meaningful triage value because PowerShell is commonly used for:

- Script-based execution
- Discovery
- Download behavior
- Post-compromise actions
- Living-off-the-land techniques

This was one of the most operationally relevant Windows detections in the project.

---

# 5) MITRE Mapping Makes Detections More Meaningful

Mapping detections to MITRE ATT&CK improved the project significantly.

It helped frame alerts in terms of:

- Attacker behavior
- Investigation relevance
- Detection engineering maturity
- Blue Team reporting value

This also made the project stronger from a recruiter and interview perspective.

---

# 6) Real Alert Evidence Makes a Portfolio Much Stronger

A major improvement in this project compared to generic lab writeups is that the detections are based on **real alerts generated in the environment**.

Using:

- actual JSON alerts
- actual rule IDs
- actual hostnames and IPs
- actual simulated attacker behavior

made the project feel much more credible and practical.

---

# 7) Documentation Is Part of Detection Engineering

A strong SOC or detection engineering project is not just about creating alerts.

It also requires documenting:

- what triggered
- why it matters
- how to investigate it
- what response actions make sense

This project reinforced the value of analyst-style documentation alongside technical implementation.

---

# 8) Multi-Platform Visibility Matters

This lab demonstrated stronger SOC value by covering both:

- **Linux**
- **Windows**

That made the project more realistic because real-world environments are mixed, and defenders need visibility across multiple operating systems.

---

# Final Reflection

This project improved practical skills in:

- Wazuh deployment and tuning
- Detection engineering
- Rule writing
- MITRE ATT&CK mapping
- Linux monitoring
- Windows monitoring
- Alert triage
- SOC-style investigation documentation

It also helped transform a home lab into a **professional cybersecurity portfolio project** that demonstrates realistic Blue Team capability.

---

# Related Files

- `README.md`
- `rules/local_rules.xml`
- `rules/custom-rule-notes.md`
- `detections/`
- `investigations/`
- `logs/`