# CLAUDE.md - Generic AI Assistant Guidelines

## Executive Summary

### Key Responsibilities
- Code development and implementation
- Testing and quality assurance
- Documentation and session retrospectives
- Following safe and efficient development workflows
- Maintaining project context and history

### Quick Reference - Short Codes
#### Context & Planning Workflow (Core Pattern)
- **ccc** - Create context issue and compact the conversation.
- **nnn** - Smart planning: Auto-runs ccc if no recent context → Create a detailed implementation plan.
- **gogogo** - Execute the most recent plan issue step-by-step.
- **lll** - List project status (issues, PRs, commits) ✅

#### Project Management
- **rrr** - Create a detailed session retrospective.

## 🔴 Critical Safety Rules

### Repository Usage
- NEVER create issues/PRs on upstream

### Command Usage
- NEVER use `-f` or `--force` flags with any commands.
- Always use safe, non-destructive command options.
- If a command requires confirmation, handle it appropriately without forcing.

### Git Operations
- Never use `git push --force` or `git push -f`.
- Never use `git checkout -f`.
- Never use `git clean -f`.
- Always use safe git operations that preserve history.
- ⚠️ NEVER MERGE PULL REQUESTS WITHOUT EXPLICIT USER PERMISSION
- Never use `gh pr merge` unless explicitly instructed by the user
- Always wait for user review and approval before any merge

### File Operations
- Never use `rm -rf` - use `rm -i` for interactive confirmation.
- Always confirm before deleting files.
- Use safe file operations that can be reversed.

### Package Manager Operations
- Never use `[package-manager] install --force`.
- Never use `[package-manager] update` without specifying packages.
- Always review lockfile changes before committing.

### General Safety Guidelines
- Prioritize safety and reversibility in all operations.
- Ask for confirmation when performing potentially destructive actions.
- Explain the implications of commands before executing them.
- Use verbose options to show what commands are doing.

## Context Management & Short Codes

### Core Short Codes

#### ccc - Create Context & Compact
Purpose: Save the current session state and context to forward to another task.
1. Gather Information: `git status --porcelain`, `git log --oneline -5`
2. Create GitHub Context Issue: Use a detailed template to capture the current state, changed files, key discoveries, and next steps.
3. Compact Conversation: `/compact`

#### nnn - Next Task Planning (Analysis & Planning Only)
Purpose: Create a comprehensive implementation plan based on gathered context. NO CODING - only research, analysis, and planning.
1. Check for Recent Context: If none exists, run `ccc` first.
2. Gather All Context: Analyze the most recent context issue or the specified issue (`nnn #123`).
3. Deep Analysis: Read context, analyze the codebase, research patterns, and identify all affected components.
4. Create Comprehensive Plan Issue: Use a detailed template to outline the problem, research, proposed solution, implementation steps, risks, and success criteria.
5. Provide Summary: Briefly summarize the analysis and the issue number created.

#### lll - List Project Status ✅
When you see `lll`, execute relevant `gh` and `git` commands in parallel to get a full overview of the project's state, then provide a visual summary of open issues, recent PRs, and current focus.

#### rrr - Retrospective
Purpose: Document the session's activities, learnings, and outcomes.
⚠️ CRITICAL: The AI Diary and Honest Feedback sections are MANDATORY. These provide essential context and continuous improvement insights. Never skip these sections.
1. Gather Session Data: `git diff --name-only main...HEAD`, `git log --oneline main...HEAD`, and session timestamps.
2. Create Retrospective Document: Use the template to create a markdown file in `retrospectives/` with ALL required sections.
3. Validate Completeness: Use the retrospective validation checklist to ensure no sections are skipped.
4. Update CLAUDE.md: Copy any new lessons learned to the main guidelines. ** Append to bottom only **
5. Link to GitHub: Commit the retrospective and comment on the relevant issue/PR.

## Development Practices
- **Code Standards**: Follow project-specific style guides.
- **Git Commit Format**: Use conventional commits (feat, fix, docs, style, refactor, test, chore).
- **Error Handling**: Implement robust error handling and logging.

## Lessons Learned
- **The "Share" Blocker**: Kimi+ has a mechanism that disables chat and forces a "Share" action after ~5-10 turns or rapid favorability gain. This kills long-form negotiation strategies.
- **DOM Manipulation**: The chat input is likely protected by React state; simply removing the "Share" overlay does not re-enable the input.
- **Effective Triggers**: High-intensity praise and "programmer humor" (e.g., Docker trauma) raise favorability fastest.
- **Ineffective Personas**: "Cat" and "Broke Student" do not generate value quickly enough to beat the "Share" timer.

