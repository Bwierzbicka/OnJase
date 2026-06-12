---
name: feedback_skip_gh_issue
description: Do not run gh issue view at the start of branch work unless the user asks for it
metadata:
  type: feedback
---

Do not automatically run `gh issue view` when starting work on a branch, even when the branch name contains an issue number.

**Why:** User finds it unnecessary overhead and rejected the tool call.

**How to apply:** Skip the branch-context gh issue check unless the user explicitly asks for it or the issue context seems critical to understanding an ambiguous task.
