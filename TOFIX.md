# TOFIX

Findings from a code scan on 2026-10-04.

## Medium

- `jncurses.i:34-44` - placeholder junk is injected into the generated public API: the javadoc for `clear()` reads "Calling this method will make you mad ... 0123456789", the `javaimports` typemap inserts the literal text `0123456789`, and `jncurses.i:23` emits `// this is a comment` into the module class. Replace with real javadoc (or remove these experiments).
- `VERSION:1` - says "see first line of configure.ac for the version", but `configure.ac` no longer exists (the autotools build was replaced by `scripts/build_jncurses.py`); put the real version here or delete the file.
- `rsconstruct.toml` - `README.md` is not linted: there is no `[processor.rumdl]` section and no `.rumdl.toml`, unlike the rest of the fleet; add both (the fleet-shared `.rumdl.toml` plus `src_files = ["README.md"]`), and add `.rumdl.toml` to the taplo `src_files` at line 20.
- `rsconstruct.toml` - `tera.templates/.github/dependabot.yml.tera` exists but there is no `[processor.tera]` section, so `.github/dependabot.yml` is never regenerated from it; add the tera analyzer/processor (with `config/personal.lua` and `config/version.lua`) as in the other repos.

## Low

- `AUTHORS`, `ChangeLog`, `NEWS` - empty autotools leftovers; `Changelog` duplicates `ChangeLog` with different case and `AUTHOR` duplicates `AUTHORS`. Delete the empty ones and keep one of each.
- `TODO:9` and `TODO:14` - items about `Makefile.ac`, `Makefile.in` and autoconf refer to the removed autotools build; drop them.
- `config/deps.lua:3-12` - `PACKAGES` (`swig-examples`, `swig-doc`, `gcc-doc`) is not read by anything (no template or build file references `deps.lua`); system deps now live in `rsconstruct.toml:37-38`. Delete the file.
- `rsconstruct.toml:38` - `libncursesw5-dev` is a virtual name with no candidate on Ubuntu 26.04 (apt resolves it to `libncurses-dev`, as the CI log shows); use `libncurses-dev` directly.
- `src/jncursesTest/Test.java:26-38` - `endwin()` is not called if anything throws inside the loop, leaving the terminal in curses mode (the file's own TODO at line 6); wrap the loop in `try { ... } finally { Jncurses.endwin(); }`.
