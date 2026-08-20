#  Antigravity-cli Security Framework

[![License](https://img.shields.io/badge/license-Apache--2.0-blue.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/platform-Linux%20%7C%20Windows%20%7C%20macOS-green.svg)]()
[![Antigravity](https://img.shields.io/badge/Antigravity%20CLI-Ready-purple.svg)]()

> **Complete Application Security (AppSec) Toolkit for Google Antigravity CLI & AI Agents.**  
> Includes 9 global security skills, 4 specialized security subagents (`sec-*`), 14 ready-to-use prompt templates, and cross-platform automated installers.

---

## Key Features

*  **9 Global Antigravity Skills:** Comprehensive workflows for threat modeling, access control analysis, CVE dependency triage, secret hygiene, GenAI review, input validation, and DAST probing.
*  **4 Specialized Security Subagents (`sec-*`):**
  * `sec-orchestrator`: Intake router that assesses requests and routes tasks to specialists.
  * `sec-analyst`: Read-only static analysis, vulnerability triage, and evidence-first reports.
  * `sec-architect`: Threat modeling (4Q methodology), guardrails, and Architecture Decision Records (ADRs) with Mermaid diagrams.
  * `sec-engineer`: Implements minimal secure fixes, regression tests, and security hardening.
*  **14 Security Prompts:** Battle-tested prompts for code audits, CSP design, auth flow reviews, and credential scans.
*  **One-Click Automated Installers:** Native scripts for Linux/macOS (`install.sh`), Windows (`install.ps1`, `install.bat`), and a universal Python script (`install.py`).

---

## Quick Start / Installation

###  Linux & macOS (Bash)
```bash
git clone https://github.com/SEU-USUARIO/antigravity-security-toolkit.git
cd antigravity-security-toolkit
chmod +x install.sh
./install.sh
```

**Non-interactive flags:**
* Install all (global skills + project prompts): `./install.sh --all`
* Install global skills only (`~/.gemini/config/skills`): `./install.sh --global-only`
* Install project assets only: `./install.sh --project-only /path/to/project`

---

###  Windows (PowerShell & Batch)
* **Option 1 (Double-Click):** Double-click `install.bat`.
* **Option 2 (PowerShell):**
```powershell
git clone https://github.com/SEU-USUARIO/antigravity-security-toolkit.git
cd antigravity-security-toolkit
.\install.ps1
```
*Parameters:* `.\install.ps1 -Mode all`, `.\install.ps1 -Mode global`, `.\install.ps1 -Mode project -ProjectPath "C:\my-project"`

---

###  Universal (Python 3 - Any OS)
No external dependencies required (uses standard library):
```bash
python3 install.py
```
*Parameters:* `python3 install.py --all`, `python3 install.py --global`, `python3 install.py --project .`

---

##  Included Skills

| Skill | Description | Location |
| :--- | :--- | :--- |
| **`access-control-review`** | Analyzes identity, authorization, and RBAC architecture with Mermaid diagrams. | `skills/access-control-review/` |
| **`dast-probe`** | Dynamic application security testing and dependency vulnerability scanning. | `skills/dast-probe/` |
| **`dependency-cve-triage`** | Triages known CVEs against dependencies and drafts remediation plans. | `skills/dependency-cve-triage/` |
| **`genai-acceptance-review`** | Prevents prompt injection, over-trust, and hallucinated assets in LLM workflows. | `skills/genai-acceptance-review/` |
| **`input-validation-hardening`** | Enforces typed schemas, strict DTOs, and input sanitization boundaries. | `skills/input-validation-hardening/` |
| **`secrets-and-logging-hygiene`** | Scans for hardcoded credentials and establishes PII redaction defaults. | `skills/secrets-and-logging-hygiene/` |
| **`secure-code-review`** | End-to-end security code review based on OWASP Top 10 guidelines. | `skills/secure-code-review/` |
| **`secure-fix-validation`** | Standard validation and regression checklist to verify security fixes. | `skills/secure-fix-validation/` |
| **`threat-model`** | Full 4Q threat modeling workflow with CLI-friendly Mermaid diagrams. | `skills/threat-model/` |

---

##  Security Subagents

| Subagent Name | Role | Capabilities |
| :--- | :--- | :---: |
| **`sec-orchestrator`** | **Entry-Point Router**: Standardizes intake and coordinates specialists. | Subagents + Write + Tools |
| **`sec-analyst`** | **Security Analyst**: Read-only triage and evidence-first vulnerability reports. | Read-Only |
| **`sec-architect`** | **Security Architect**: Threat models, architecture reviews, and ADRs. | Read + Write Docs |
| **`sec-engineer`** | **Security Engineer**: Ships minimal, verified fixes and regression tests. | Read + Write + Execute |

---

##  Prompt Catalogue

Located under `prompts/` (copied to `.github/prompts/` in consuming projects):
* `access-control-review.prompt.md`
* `add-content-security-policy.prompt.md`
* `assess-logging.prompt.md`
* `business-logic-review.prompt.md`
* `check-access-controls.prompt.md`
* `check-for-secrets.prompt.md`
* `check-for-unvalidated-genai-acceptances.prompt.md`
* `csp-review.prompt.md`
* `dependency-cve-triage.prompt.md`
* `review-auth-flows.prompt.md`
* `scan-for-insecure-apis.prompt.md`
* `secure-code-review.prompt.md`
* `threat-model.prompt.md`
* `validate-input-handling.prompt.md`

---

##  Attribution & License

This project is licensed under the **[Apache License 2.0](LICENSE)**.

### Acknowledgements & Upstream Attribution
This toolkit incorporates and adapts prompt designs, agent guidelines, and security workflows originally developed by **Robotti Tech Services** in the open-source project [**Robotti-io/copilot-security-instructions**](https://github.com/Robotti-io/copilot-security-instructions), customized and expanded with native support, installers, and subagents for the Google Antigravity CLI ecosystem.

See [NOTICE](NOTICE) for full attribution details.
