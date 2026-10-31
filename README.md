<div align="center">

# workshop-kit

**Everything needed to run a hands-on workshop: slides skeleton, exercise files, and a facilitator checklist.**

[![license](https://img.shields.io/badge/license-MIT-green?style=flat-square)](LICENSE)

</div>

## About

The part of a workshop that actually needs writing down is the
facilitator checklist: what to install beforehand, how long each segment really
takes, and what to do when half the room's environment is broken. The slides
are mostly there to keep the pacing honest.

## Quick start

```bash
git clone https://github.com/lxcadoza993/workshop-kit
cd workshop-kit
cat README.md
```

## Configuration

| Key | Description |
| --- | --- |
| `slides/` | outline first, slides second |
| `exercises/` | one directory per exercise, each self-contained |
| `facilitator-checklist.md` | timing, prerequisites, and the things that break |
## Roadmap

- [ ] Exercise solutions
- [ ] Timing sheet per segment
- [ ] Remote-delivery notes

## Contributing

Issues and pull requests are welcome. Please keep changes small and focused,
and add a test for any behaviour change — every repository here ships with a
runnable test suite and no third-party dependencies, so CI is just
`python3 -m unittest` / `bash test_*.sh`.

## License

[MIT](LICENSE)
