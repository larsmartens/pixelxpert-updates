#!/bin/sh
set -eu

version="$(sed -n 's/.*"version": "\([^"]*\)".*/\1/p' latestCanary.json | head -n 1)"
output="${1:-CanaryChangelog.md}"
json_file="$(mktemp)"
trap 'rm -f "$json_file"' EXIT HUP INT TERM

gh api "repos/larsmartens/PixelXpert-fork/commits?sha=canary&per_page=20" > "$json_file"
python - "$version" "$json_file" "$output" <<'PY2'
import json
import sys
from pathlib import Path

version, json_path, output_path = sys.argv[1:4]
commits = json.loads(Path(json_path).read_text())
lines = [f'# {version}', '', '_Latest commit titles and messages from `larsmartens/PixelXpert-fork@canary`._', '']
for item in commits:
    commit = item['commit']
    subject, *rest = commit['message'].split('\n\n', 1)
    if subject.startswith('Merge ') or subject.strip() == '--':
        continue
    body = rest[0].strip() if rest else ''
    lines.append(f'## {subject}')
    lines.append('')
    if body:
        lines.append(body)
        lines.append('')
    lines.append(f"- Commit: `{item['sha'][:7]}`")
    lines.append(f"- Author: {commit['author']['name']}")
    lines.append(f"- Date: {commit['author']['date'][:10]}")
    lines.append('')
Path(output_path).write_text('\n'.join(lines).rstrip() + '\n')
PY2
