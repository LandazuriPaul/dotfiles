# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Git

- Use conventional format: <type>(<scope>): <subject> where type = feat|fix|docs|style|refactor|test|chore|perf. Subject: 50 chars max, imperative mood ("add" not "added"), no period. 
- For small changes: one-line commit only.
- Use the imperative mood for commit messages.
- Keep commit messages concise (50 characters or less).
- Keep commits atomic (one logical change) and self-explanatory.
- For complex changes: add a description explaining what/why (72-char lines) and reference issues.
- Split into multiple commits if addressing different concerns.
- Reference related issues or pull requests in commit messages.

## CLI Tools

- Use `rg` not `grep`
- Use `fd` instead of `find`

## Language

English only: all code, comments, docs, examples, commits, configs, errors, tests.
