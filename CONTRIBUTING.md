# Contributing to KAERU projects

This guide applies to every KAERU-dev repository that does not ship its own
`CONTRIBUTING.md`.

Each repository's `AGENTS.md` covers what is specific to that project:

- what the product is, and what it must never become
- the code layout
- the validation command
- the decisions a contributor must not make alone

Read it, and the repository's `README.md`, before changing code. Keep each
contribution scoped to one issue, and discuss major behavior or dependency
changes before implementing them. Report vulnerabilities according to the
[security policy](https://github.com/KAERU-dev/.github/blob/main/SECURITY.md).
Keep sensitive details out of issues and pull requests.

Open issues from the templates and follow
[the issue guide](https://github.com/KAERU-dev/.github/blob/main/docs/issues.md),
so each one can be picked up without extra context. Coding agents also follow
the repository's `AGENTS.md`.

## Branches and coordination

Create a focused branch, optionally in a separate worktree:

```sh
git worktree list
git worktree add ../<repo>-my-change -b fix/<issue>-my-change
```

Check existing branches and worktrees, and coordinate overlapping work. Never
alter, reset or clean someone else's worktree. Each worktree needs its own
dependency installation.

Package scripts, the package manifest and the lockfile are shared integration
points. Coordinate overlapping changes, limit edits to the fields you need, and
avoid incidental lockfile regeneration. Install with the frozen lockfile for
routine setup.

## Changes and validation

Follow the conventions of the surrounding code before introducing new ones.
Add meaningful tests for behavior changes, and manual checks where tests cannot
reach. Before opening a PR, run the validation command named in `AGENTS.md`.
Document failures and platform limitations honestly.

Formatters and linters are run intentionally, on the files you changed. Review
the diff before committing; do not reformat the whole repository as a side
effect.

For UI changes, include screenshots in the PR whenever possible:

- Capture each affected screen, in every theme the product ships, and the
  relevant states, such as empty data, errors or offline behavior.
- Say what each screenshot demonstrates, and whether it comes from the running
  app or a mocked preview.
- If screenshots are unavailable, explain why and list the remaining visual
  checks.

For private repositories, upload screenshots as GitHub attachments. The
[GitHub CLI attachment workflow](https://docs.github.com/en/github-cli/github-cli/attaching-files-with-github-cli)
supports `--attach` on PR commands. Keep the attachment URLs in the PR body,
and check that each image opens for reviewers with repository access.

## Commits

Commit messages use [Conventional Commits](https://www.conventionalcommits.org/):
`<type>: <imperative summary>`, with types `feat`, `fix`, `refactor`, `perf`,
`test`, `docs`, `build`, `ci` or `chore`. Examples: `docs: explain Android
setup`, `fix: keep alarms after a reboot`. In repositories that squash-merge,
the PR title becomes the commit, so the PR title follows the same format.

Make each commit one coherent change. An issue with several steps ships as one
PR, with one commit per step.

Commit messages and PR descriptions describe the resulting change for a
reviewer. Do not attribute work to an AI assistant (no `Co-authored-by` or
"Generated with" trailers), narrate the session, or promise future work. Put
follow-ups in an issue.

## Pull requests

Describe the problem, the resulting behavior and the validation in the
template. Link the issue with `Closes #N`, and state what remains unverified.
Keep unrelated cleanup out of the diff, and explain any dependency or lockfile
change.

Maintainers apply the
[standard labels](https://github.com/KAERU-dev/.github/blob/main/scripts/labels.tsv),
plus any area labels the repository defines. Labels do not trigger releases.
