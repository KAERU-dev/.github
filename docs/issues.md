# Writing and picking up issues

KAERU repositories have two kinds of issue:

- A **report**: a problem or an idea, written by anyone in their own words.
  "I can't use X, here is a screenshot" is a good report. Nobody needs to know
  the code to write one.
- A **task**: a self-contained brief that a coding agent or a new contributor
  can finish without asking for missing context. Maintainers write tasks,
  usually from reports. A task says:
  - what is wrong or missing
  - where it lives in the code
  - how to approach it
  - what is out of scope
  - how to prove it is done

The templates in [`.github/ISSUE_TEMPLATE`](../.github/ISSUE_TEMPLATE) cover
both. A repository without its own templates gets these by default.

## Reporting a problem or an idea

Use **Report a problem** or **Suggest a feature**. Fill in what you can and
leave the rest blank. Screenshots, recordings, the version and the device help
the most. The headers, statuses and sections described below are for tasks;
reports do not need them.

Reports arrive labeled `needs-triage`. A maintainer may ask follow-up
questions in the comments before anything else happens.

Do not report security problems in an issue. Follow the
[security policy](../SECURITY.md) instead.

## Triage: from report to task

A maintainer, or an agent asked to triage, reads each `needs-triage` issue and
does one of these:

1. **Asks for what is missing** in a comment, when the problem cannot be
   understood or reproduced yet.
2. **Closes it**, saying why: a duplicate (link the original), working as
   intended, or out of the product's scope.
3. **Turns it into a task:**
   - For a small report from a maintainer, edit the body: add the header and
     the task sections.
   - Otherwise, open a new issue from the matching **Task** template, with
     `Reported in #N` in its body, so the reporter's words stay as they wrote
     them. Then comment on the report with a link to the task.

Then remove `needs-triage` and set the type, priority and status labels.

Agents never implement an issue labeled `needs-triage`. It is not a task yet.

## Writing a task

Start from the **Task** template that matches the type of work. Each one asks
only for the sections that type needs.

### Header

Every task body starts with the same header, so readers can see its state
without reading the whole issue:

```markdown
**Type:** Feature · **Priority:** P1 · **Size:** M · **Status:** Ready
**Depends on:** #5 · **Conflicts with:** #20 · **Verified against:** `bb5d55aee`
```

| Field            | Values                                                                                                                                                                                                                                             |
| ---------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Type             | `Bug`, `Feature`, `Improvement`, `Cleanup` (refactor or removal), `Performance`, `Infrastructure`, `Documentation`, `Research`, `Decision`, `Tracking`                                                                                             |
| Priority         | `P0`: blocks the next release, or users are hurt now. `P1`: next cycle. `P2`: later. `P3`: nice to have, no committed release. A repository's `AGENTS.md` may say what "release" means for it                                                      |
| Size             | `S`: one area, roughly under 150 changed lines. `M`: one reviewable PR, roughly 150–400 lines. `L`: more than one PR; list the PR sequence in the issue or split it into child issues                                                              |
| Status           | `Ready`: an agent can start now. `Blocked by #N`: start after #N is merged. `Needs decision`: a maintainer must choose between the listed options first. `Human only`: needs accounts, hardware, legal or external actions an agent cannot perform |
| Depends on       | Issues that must be merged first, or `—`                                                                                                                                                                                                           |
| Conflicts with   | Issues or active branches that edit the same files and should not run in parallel, or `—`                                                                                                                                                          |
| Verified against | Short hash of the `main` commit the issue's paths and findings were checked against                                                                                                                                                                |

Mirror the status and priority with labels so work can be filtered:
`agent-ready`, `blocked`, `needs-decision`, `human-only` and `P0`–`P3`. When
the status changes, update the header, the labels and the checklist together.
[`scripts/sync-labels.sh`](../scripts/sync-labels.sh) creates the standard
labels in a repository.

### Body sections

All templates share these rules:

- **Describe the current state from the code, not from memory.** Cite paths
  relative to the repository root (`src/services/alarms.ts`) and name the
  functions, events or components involved. Line numbers drift, so use them
  only as hints next to a function name.
- **Separate facts from hypotheses.** Say whether a defect was reproduced,
  found by reading the code, or only reported by someone else.
- **List the files to change** in a table, separating new files from modified
  ones. An agent should not have to search for the entry point.
- **Give an implementation approach**, not finished code. Explain why each step
  is needed, and name an existing pattern in the codebase to follow.
- **Write acceptance criteria as observable checks** (`- [ ]`). "Works well" is
  not a criterion. "A missed dose shows a Retry action" is.
- **State validation explicitly.** Give the repository's validation command
  (named in its `AGENTS.md`), the focused tests to add or run, and the manual
  checks with the devices or platforms they need. Say which checks need
  hardware or accounts an agent does not have.
- **State what is out of scope**, and link the issue that owns it, so agents do
  not expand the diff.
- **Name decisions an agent must not make alone.** Adding dependencies,
  removing user-visible features, changing stored data shapes, and anything
  legal, commercial or privacy-related need maintainer approval. List the
  options and a recommendation.

Size the work to one PR. If an issue needs more than one PR, make it a
`Tracking` issue and open child issues in this format.

### Before dispatching a task to an agent

A task is `Ready` only when all of these are true:

- [ ] The header is complete, and `Verified against` is a recent `main` commit.
- [ ] Every path in the issue exists at that commit, or is marked as new.
- [ ] No unresolved `Needs decision` question blocks the implementation.
- [ ] Dependencies are merged, and no conflicting work is running in parallel.
- [ ] The agent can check the acceptance criteria and validation, or the checks
      that need a human are listed separately.

Re-verify paths after a large removal or refactor lands.

## Working on a task

Agents and contributors follow the repository's `AGENTS.md` and the
[contributing guide](../CONTRIBUTING.md). In short:

1. Read the whole issue, its comments, and the issues it links, including the
   report it came from. If its
   `Verified against` commit is old, check that the cited files still match
   before coding.
2. Work in your own branch or worktree, named after the issue
   (`fix/50-missed-dose-retry`, `feat/47-weekly-schedule`). Do not edit
   another active worktree.
3. Stay inside the issue's scope. If the code contradicts the issue, or the
   issue lists a decision that is needed, stop and comment on the issue
   instead of guessing.
4. Run the repository's validation command and the focused tests the issue
   names. Do the manual checks you can, and list the ones you could not.
5. Open a PR with the repository template, link the issue with `Closes #N`,
   and report what remains unverified.
