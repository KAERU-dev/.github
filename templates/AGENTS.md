# Agent instructions

<!-- Template for KAERU repositories. Replace every comment with the project's
facts, delete sections that do not apply, and keep it short: link to README.md
and docs/ instead of copying them. Add a CLAUDE.md containing only `@AGENTS.md`
next to it. -->

<!-- One paragraph: what the product is, who it is for, and the platforms it
runs on. -->

Read the [contributing guide](https://github.com/KAERU-dev/.github/blob/main/CONTRIBUTING.md)
and [README.md](README.md) before changing code.

## Product guardrails

<!-- The promises the product makes, and what it must never become. Write each
one as a rule an agent can check a diff against, for example:
- "User data never leaves the device. Do not add network calls that carry it."
- "This is not a medical device. Never add diagnosis or treatment advice."
End with the decisions agents never make: license, accounts, hosted services,
pricing, legal and commercial choices. -->

- Do not change the license, add accounts or hosted services, or make
  commercial or legal decisions. Raise them on the issue.

## Working on an issue

Issues follow the [issue guide](https://github.com/KAERU-dev/.github/blob/main/docs/issues.md).
Issues and PRs live in `KAERU-dev/<repo>`.

1. Read the issue body **and its comments** (they carry dependency and conflict
   updates), plus every issue it links. Respect its **Status**: do not implement
   an issue marked `Blocked by`, `Needs decision` or `Human only`. When it names
   a dependency, check whether that issue is already closed before treating it
   as a blocker.
2. Check that the files the issue cites still exist and behave as described on
   your base commit. If they do not, comment on the issue instead of guessing.
3. Run `git worktree list`, then create your own worktree and branch from an
   up-to-date `main`, named after the issue (`feat/47-weekly-schedule`). Never
   make changes in the primary checkout or in another agent's worktree, and
   never reset or clean them.
4. Be critical of the issue. If you find a simpler approach, a wrong
   assumption or a missing edge case, say so in an issue comment before
   building something else.

While coding:

- Stay within the issue's scope and its **Out of scope** list. Report
  unrelated findings in an issue comment or a new issue, not in the diff.
- Ask on the issue before adding or upgrading dependencies, changing package
  scripts, regenerating the lockfile, changing a stored data shape, or
  removing user-visible features the issue does not name.
  <!-- Add the project's own sensitive areas. -->
- Follow existing patterns in the surrounding code before introducing new ones,
  and keep the change as simple as the requirement allows.
- If you learn something non-obvious that the next contributor needs (a
  gotcha, setup requirement or architectural rule), add it to the relevant doc.

## Code layout

<!-- A table of the top-level paths and what lives in each, plus any wiring
that spans several files ("a new X needs A, B and C"). -->

| Path | Contents |
| ---- | -------- |
|      |          |

## Conventions that reviews enforce

<!-- Rules a reviewer will reject a PR for: logging, i18n, accessibility,
theming, typing and testing conventions, each with the file or doc that
defines it. -->

## Validation, commits and PRs

- Run `<validation command>` before opening a PR. <!-- Name what it covers,
  and the checks that need a device or account. --> Format only the files you
  changed.
- Commits and PR titles follow the
  [contributing guide](https://github.com/KAERU-dev/.github/blob/main/CONTRIBUTING.md#commits):
  Conventional Commits, one coherent change per commit, no AI attribution
  trailers, and no narration of the session.
- Open the PR with the repository template, include `Closes #N`, list the
  commands and devices you actually checked, and state what remains
  unverified.
