# Lab 06: Continuous Integration Pipeline Implementation

**Repository:** `hadia-anjum/27-FYP-226`  
**Author:** Areeba Tariq  
**Status:** Completed & Verified  

---

## 1. Executive Summary
This lab focused on setting up an automated Continuous Integration (CI) pipeline using GitHub Actions, enforcing strict Quality Gates via Branch Protection Rulesets, and testing test failure scenarios to ensure main branch stability.

---

## 2. Task Breakdown & Execution

### Task 1: Clean Clone Verification
- Verified that running a fresh clone in a separate workspace (`~/devops/fresh-check`) builds and tests cleanly.
- Resolved local Windows/WSL UNC path execution issues by integrating `test/build.test.js` directly into `main`.

### Task 2: GitHub Actions CI Workflow Setup
- Created `.github/workflows/ci.yml` targeting `ubuntu-24.04` and Node.js v22.
- Configured automated triggers on `push` to `main` and all `pull_request` events executing `make ci`.

### Task 3: Build Failure Testing
- Created a feature branch (`break-build-test`) with a failing assertion to test pipeline failure handling.
- Verified that GitHub Actions caught the error and reported a failed status check (`CI / build-and-test`).

### Task 4: Branch Protection & Quality Gate
- Active ruleset configured on `main` branch requiring status check `build-and-test` to pass before merging.
- Confirmed that Pull Requests with failing tests have the **Merge** button permanently disabled.

---

## 3. Verification & Evidence Log

1. **Working Build:** Main branch PR merged successfully by Areeba Tariq (`1 check passed`).
2. **Blocked Merge:** Failed PR (`#12`) blocked merge button with required check notification.
3. **Actions Summary:** All feature checks and main branch runs passing green; intentional failure tests correctly flagged red.

