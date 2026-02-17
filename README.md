# AI Experts Assignment (JS/TS)

This assignment evaluates the ability to:

- set up a small JavaScript/TypeScript project to run reliably (locally and in Docker),
- pin dependencies for reproducible installs,
- write focused tests to reproduce a bug,
- implement a minimal, reviewable fix.

---

## Project Overview

This repository contains a minimal OAuth2 HTTP client implemented in TypeScript and tested using Vitest.

The project demonstrates:

- reproducible dependency installation,
- debugging through failing tests,
- applying a minimal fix,
- running tests consistently both locally and inside a Docker-based CI environment.

---

## What Was Implemented

### ✅ Dockerfile

A Dockerfile was added to allow the test suite to run in a clean, non-interactive CI-style environment.

The container:

- installs dependencies using `npm install`
- runs tests automatically
- executes `npm test` by default

---

### ✅ Pinned Dependencies

All dependencies in `package.json` are pinned to exact versions (`x.y.z`) to ensure reproducible installs across environments.

Lockfiles are intentionally excluded as required.

---

### ✅ Bug Fix

A bug existed in the OAuth2 token handling logic.

When the stored token was a plain JavaScript object instead of an `OAuth2Token` instance, the client failed to refresh the token and did not attach the Authorization header.

The fix ensures the token is refreshed when it is:

- missing,
- not an `OAuth2Token` instance,
- or expired.

The change was intentionally minimal and reviewable.

---

## Running Tests Locally

### 1. Install dependencies

`npm install`

### 2. Run tests

`npm test`

All tests should pass successfully.

#### Running Tests with Docker

1. Build the Docker image

`docker build -t ai-assignment .`

2. Run tests inside Docker

`docker run --rm ai-assignment`

The container automatically runs the test suite using:

`npm test`

No manual steps are required.
