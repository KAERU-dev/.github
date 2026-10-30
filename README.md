# KAERU-dev/.github

Shared defaults for every KAERU-dev repository: the contribution, issue and
agent standards.

GitHub applies the community health files here to any repository in the
organization that does not ship its own copy:

| File                                                                   | What it covers                                             |
| ---------------------------------------------------------------------- | ---------------------------------------------------------- |
| [`CONTRIBUTING.md`](CONTRIBUTING.md)                                   | Branches, worktrees, validation, commits and pull requests |
| [`SECURITY.md`](SECURITY.md)                                           | How to report a vulnerability without disclosing it        |
| [`.github/ISSUE_TEMPLATE/`](.github/ISSUE_TEMPLATE)                    | Issue templates, one per type of work                      |
| [`.github/pull_request_template.md`](.github/pull_request_template.md) | Pull request template                                      |

These files are not applied automatically:

| File                                               | What it covers                                           |
| -------------------------------------------------- | -------------------------------------------------------- |
| [`docs/issues.md`](docs/issues.md)                 | How to write an issue an agent can finish without asking |
| [`templates/AGENTS.md`](templates/AGENTS.md)       | Starting point for each repository's agent instructions  |
| [`scripts/labels.tsv`](scripts/labels.tsv)         | The standard labels: type, status and priority           |
| [`scripts/sync-labels.sh`](scripts/sync-labels.sh) | Creates or updates the standard labels in a repository   |

## Adopting the standard in a repository

1. Copy [`templates/AGENTS.md`](templates/AGENTS.md) to the repository root and
   fill it in. Add a `CLAUDE.md` that contains only `@AGENTS.md`.
2. Run `scripts/sync-labels.sh KAERU-dev/<repo>`. Area labels (`alarms`,
   `billing`, …) stay project-specific.
3. Delete the repository's own `.github/ISSUE_TEMPLATE/`, `CONTRIBUTING.md`,
   `SECURITY.md` or PR template only if it should use the defaults. A
   repository that keeps its own `ISSUE_TEMPLATE` folder gets none of the
   default templates, so copy the ones it needs into it.

This repository is public because GitHub applies its defaults only from a
public `.github` repository. Keep anything project-specific or private out of
it.
