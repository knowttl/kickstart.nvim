# AGENTS.md

## Purpose

This file defines repository-specific instructions for coding agents working in this Neovim Lua configuration.

The primary goals are:

- Keep configuration changes aligned with official documentation.
- Keep startup fast and behavior predictable.
- Verify every change so Neovim launches without errors.

## Repository Context

- Entry point: `init.lua`
- Core modules: `lua/core/*.lua`
- Plugin specs and setup: `lua/plugins/*.lua`
- Plugin manager: `lazy.nvim`

Follow the existing module boundaries and do not move unrelated logic between files.

## Documentation-First Rule (Required)

Before making configuration changes, consult official docs for the feature being edited.

Use these sources first:

1. Neovim official help and docs
   - `:help`
   - https://neovim.io/doc/
2. lazy.nvim official documentation
   - https://lazy.folke.io/
   - https://github.com/folke/lazy.nvim
3. Official plugin documentation for any plugin being changed
   - Prefer the plugin README and `:help` tags installed by the plugin.

If there is a conflict between blog posts/examples and official docs, follow official docs.

## Change Policy

- Make the smallest safe change that solves the request.
- Preserve current coding style and file layout.
- Do not refactor unrelated code.
- Add comments only when logic is not obvious.
- Keep lazy-loading behavior intact unless the task requires changing it.

## Required Validation After Every Change

Agents must run validation commands before finishing.

From repository root:

1. Headless startup check (required)

```sh
nvim --headless "+qa"
```

2. If Lua files were changed, run syntax checks when available

```sh
command -v luac >/dev/null && find lua -name '*.lua' -print0 | xargs -0 -n1 luac -p
```

3. If plugin specs/dependencies changed, ensure lazy state is valid

```sh
nvim --headless "+Lazy! sync" "+qa"
```

If any validation step fails:

- Do not stop at the first draft.
- Fix the issue and rerun validation.
- Report what failed and what was changed to resolve it.

## Completion Checklist

Before declaring work complete, confirm:

- Official docs were consulted for changed features.
- Neovim headless launch passed.
- Relevant syntax/plugin checks passed.
- No unrelated files were modified.
