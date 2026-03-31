# Contributing to homebrew-clawrtc

Thanks for helping maintain the ClawRTC Homebrew tap.

This repository is intentionally small. Most contributions will touch one of:

- `Formula/clawrtc.rb` for formula updates
- `BCOS.md` for certification or trust-layer documentation

## Before you open a pull request

1. Keep the diff focused. Small tap updates are easier to review and publish.
2. If you change the formula version, update both the source `url` and `sha256`.
3. If behavior or installation instructions change, update the related docs in `BCOS.md`.

## Local checks

Run the fastest relevant checks before opening a PR:

```bash
ruby -c Formula/clawrtc.rb
brew audit --strict Formula/clawrtc.rb
```

If you have Homebrew available locally, an install smoke test is also helpful:

```bash
brew install --build-from-source ./Formula/clawrtc.rb
clawrtc --help
```

## Pull request guidelines

- Explain what changed and why.
- Include the commands you ran to validate the change.
- Mention any follow-up work or caveats if something could not be tested locally.
- Do not mix unrelated cleanup into the same PR.

## Good first contributions

- Bump the packaged ClawRTC version
- Fix formula metadata or caveats
- Improve BCOS-facing documentation
- Tighten install or verification instructions
