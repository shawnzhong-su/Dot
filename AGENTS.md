# Repository Guidelines

## Project Structure & Module Organization
- Entry point: `init.lua` wires LazyVim and loads settings from `lua/config`.
- Core config: `lua/config/options.lua`, `keymaps.lua`, `autocmds.lua`, and `lazy.lua` (plugin manager bootstrap).
- Plugin specs: place new modules in `lua/plugins/` (one file per feature or stack).
- Shared settings: `lazyvim.json` for LazyVim options; `stylua.toml` for formatting; `.neoconf.json` for Neovim-side config hints.

## Setup, Build, and Development Commands
- Sync plugins: `nvim --headless "+Lazy sync" +qa` (installs/updates defined specs).
- Health check: `nvim --headless "+checkhealth" +qa` to verify runtime, language servers, and providers.
- Format Lua: `stylua .` from repo root (uses `stylua.toml`).
- Daily edit: launch with `nvim` and let LazyVim handle runtime updates via `:Lazy`.

## Coding Style & Naming Conventions
- Lua formatting: 2-space spaces, `column_width = 120` (enforced by `stylua.toml`).
- Module layout: prefer one responsibility per file; expose through `return { ... }` plugin spec tables.
- Naming: snake_case for files and locals; CamelCase for classes/objects when required by APIs; use descriptive plugin keys (e.g., `name = "gitsigns"`).
- Keymaps/autocmds: register in `lua/config/keymaps.lua` and `autocmds.lua`; keep mappings contextual and namespaced.

## Testing & Health Checks
- Smoke tests: `nvim --headless "+Lazy restore" +qa` to ensure lockfile compatibility after edits.
- Run `nvim --headless "+Lazy health" +qa` after adding plugins to catch missing dependencies.
- Prefer adding minimal repro snippets under `lua/plugins/` comments when documenting tricky config.

## Commit & Pull Request Guidelines
- Commits: follow imperative, concise style (e.g., `add treesitter config`), mirroring existing history.
- PRs: describe intent, key changes, and manual checks run (`Lazy sync`, `checkhealth`, `stylua`). Link related issues if any.
- Screenshots or asciicasts are helpful for UX-affecting changes (UI tweaks, keymaps that change defaults).

## Security & Configuration Notes
- Do not commit secrets; external tool tokens (LSPs, formatters) should be read from environment variables or OS keychain.
- Keep `lazy-lock.json` in sync with plugin changes; run `Lazy sync` before pushing to avoid drift.
- Review new plugins for telemetry defaults and disable/opt-out settings where available.
