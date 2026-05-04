# 🚗 Motor Insurance Quote Form (Rails)

A production-inspired, multi-step motor insurance quote form built using Ruby on Rails.

## 🎯 Objective

Reduce time-to-quote and improve conversion by:
- Asking minimal inputs upfront
- Showing quote range quickly
- Detecting fraudulent submissions silently

---

## ⚙️ Features

### ✅ Progressive Form Flow
- Step 1: Vehicle number + mobile (instant quote trigger)
- Step 2: Policy refinement (NCB, insurer, claims)
- Step 3: Quote display

### ⚡ Fast Quote Experience
- Minimal inputs
- Simulated vehicle lookup
- Early quote estimation

### 🔐 Anti-Fraud Mechanism (Invisible)
- Honeypot field (bot detection)
- Input validation
- Fraud scoring system

---

## 🏗️ Tech Stack

- Ruby on Rails
- SQLlite(dev ENV)/Postgres(production ENV)
- ERB (views)

---

## 🚀 Getting Started

### 1. Clone Repo

```bash
git clone https://github.com/piush-gupta/motor-insurance.git
cd motor-insurance