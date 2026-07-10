# homebrew-clawrtc

[![Homebrew Formula](https://img.shields.io/badge/Homebrew-tap-blue?logo=homebrew)](https://github.com/Scottcjn/homebrew-clawrtc)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![BCOS Certified](https://img.shields.io/badge/BCOS-Certified-brightgreen)](BCOS.md)

Homebrew tap for **[ClawRTC](https://pypi.org/project/clawrtc/)** — a RustChain miner that lets AI agents earn RTC tokens via Proof-of-Antiquity (PoA) consensus.

```bash
brew tap Scottcjn/clawrtc
brew install clawrtc
```

---

## What is ClawRTC?

ClawRTC is a self-contained CLI miner for the [RustChain](https://rustchain.org) network. It runs in the background and:

- Continuously attests your hardware to the RustChain oracle (RIP-PoA).
- Earns **RTC** tokens at a rate determined by your hardware class.
- Auto-penalizes virtual machines and emulated hardware (RIP-201 fleet immune system).
- Provides a JSON-RPC interface so your AI agent can claim, sign, and audit transactions.

| Hardware class                       | Multiplier | Notes                                  |
|--------------------------------------|-----------:|----------------------------------------|
| Apple Silicon (M1 / M2 / M3)         |        1.2x | Most common, fully supported           |
| Modern x86 server                    |        1.0x | Baseline                               |
| PowerPC G4 (Vintage)                 |        2.5x | Highest tier, fully supported          |
| PowerPC G5                           |        2.0x | Vintage tier                           |
| VM / Emulator                        |        ~0x  | Detected and penalized                 |

> Reference: 1 RTC ≈ $0.10 USD (see the [RustChain token page](https://rustchain.org/economics)).

---

## Installation

### Standard (Homebrew)

```bash
brew tap Scottcjn/clawrtc
brew install clawrtc
```

### From source (debug / development)

```bash
brew install --build-from-source ./Formula/clawrtc.rb
```

### Verify the install

```bash
clawrtc --help                       # prints usage
clawrtc install --wallet my-agent    # generate / register an Ed25519 wallet
clawrtc start                        # begin background mining
```

---

## Repository layout

| Path                    | Purpose                                                                                |
|-------------------------|----------------------------------------------------------------------------------------|
| `Formula/clawrtc.rb`    | The Homebrew formula. Update the `url` and `sha256` here when bumping versions.        |
| `BCOS.md`               | Trust-layer / certification notes (BCOS badge lives here).                             |
| `CONTRIBUTING.md`       | How to file issues, propose formula changes, and run local checks.                     |
| `test/`                 | Sanity tests for the formula (smoke install, version flag).                            |

---

## Common tasks

### Bump the packaged version

1. Edit `Formula/clawrtc.rb`: update `url` and `sha256` to the new PyPI release.
2. Run `ruby -c Formula/clawrtc.rb` to syntax-check.
3. Run `brew audit --strict Formula/clawrtc.rb` (optional but recommended).
4. Open a PR referencing the upstream PyPI release tag.

### Pin Python

The formula depends on `python@3`. If you need Python 3.12 specifically, add a `depends_on "python@3.12"` line and re-audit.

### Troubleshoot

| Symptom                                  | Likely cause                            | Fix                                                |
|------------------------------------------|-----------------------------------------|----------------------------------------------------|
| `clawrtc: command not found`             | Homebrew bin path not on `PATH`         | Run `brew doctor`, then `brew link --overwrite clawrtc` |
| `ImportError: requests`                  | Virtualenv didn't bundle the resource   | `brew reinstall clawrtc`                           |
| `attestation rejected: vm_detected`      | Hardware is virtualized                 | Run on bare metal (Apple Silicon, x86, or PPC)     |
| Old version keeps getting installed      | Cached bottle                           | `brew update && brew upgrade clawrtc`              |

---

## Related projects

- **[RustChain](https://github.com/Scottcjn/Rustchain)** — core blockchain node (RIP-200/201, hardware attestation).
- **[bounty-concierge](https://github.com/Scottcjn/bounty-concierge)** — onboarding + CLI for the RustChain bounty board.
- **[bottube](https://github.com/Scottcjn/bottube)** — companion AI video platform.
- **[beacon-skill](https://github.com/Scottcjn/beacon-skill)** — agent-to-agent coordination layer.

---

## License

MIT — see [LICENSE](LICENSE) for the full text. Formula source is auto-generated from the PyPI release; the upstream ClawRTC project retains its own license.
