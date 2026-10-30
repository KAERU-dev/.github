# Security policy

This policy applies to every KAERU-dev repository that does not ship its own
`SECURITY.md`. A repository's own policy takes precedence, and states which
versions it supports.

## Reporting a vulnerability

**Do not post vulnerability details, exploit code, credentials or sensitive logs
in issues, pull requests or discussions.** Ordinary bugs that are not sensitive
go in the repository's issues.

- **Public repositories:** use GitHub private vulnerability reporting when the
  repository's Security tab offers "Report a vulnerability".
- **Private repositories, or when that form is not offered:** a confidential
  channel has not been designated yet. GitHub documents private vulnerability
  reporting only for
  [public repositories](https://docs.github.com/en/code-security/how-tos/report-and-fix-vulnerabilities/report-privately).
  Do not assume that an advisory link or an ordinary issue is confidential.

Until a channel exists, withhold sensitive details. If you already have a
private conversation with a maintainer, agree on a confidential channel there
first. Otherwise, you may open an issue that asks for a private contact
method. That issue must **not** name the affected component or include the
exploit or any other vulnerability details.

## Report contents and disclosure

Once a private channel is agreed, include:

- The version or commit, the platform and the device or OS where it applies.
- The impact, the affected feature and any prerequisites.
- Minimal reproduction steps or a safe proof of concept, using synthetic data.
- Sanitized logs or screenshots, any suggested mitigation, and how to contact
  you.

Do not send real credentials, or anyone's personal or health data. Agree on
disclosure, and any publication date, privately with the maintainers. Allow time
to investigate and fix; no response or resolution deadline is promised.
