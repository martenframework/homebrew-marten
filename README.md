# Marten Homebrew Tap


[![CI](https://github.com/martenframework/homebrew-marten/workflows/Specs/badge.svg)](https://github.com/martenframework/homebrew-marten/actions)
[![CI](https://github.com/martenframework/homebrew-marten/workflows/QA/badge.svg)](https://github.com/martenframework/homebrew-marten/actions)

This repository hosts the Homebrew tap definition for the Marten framework.

## Release process

When a new Marten version is released, the homebrew tap can be updated by following these steps:

1. Update the `shard.yml` file so that it references the Marten version to release
2. Run `shards install` to install the new Marten version
3. Run `make release` to regenerate the tap definition and the associated tarball

## License

MIT. See ``LICENSE`` for more details.
