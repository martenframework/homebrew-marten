# Marten Homebrew Tap

This repository hosts the Homebrew tap definition for the Marten framework.

## Release process

When a new Marten version is released, the homebrew tap can be updated by following these steps:

1. Update the `shard.yml` file so that it references the Marten version to release
2. Run `shards install` to install the new Marten version
3. Run `make release` to regenerate the tap definition and the associated tarball
4. Run `git tag vX.Y.Z` to create a new tag for the new version

## License

MIT. See ``LICENSE`` for more details.
