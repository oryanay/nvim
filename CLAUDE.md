# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a Neovim configuration repository using Lua. The configuration follows a modular architecture with lazy.nvim as the plugin manager.

## Key Structure

- **Entry Point**: `init.lua` → `lua/config/init.lua`
- **Core Settings**: `lua/config/set.lua` (leader=space, localleader=comma)
- **Plugin Manager**: lazy.nvim (auto-installs, loads from `lua/plugins/`)
- **Plugin Lock File**: `lazy-lock.json` (tracks exact plugin versions)

## Common Commands

### Neovim Configuration Development

```bash
# Open Neovim in this config directory to test changes
nvim .

# Check Neovim version (requires 0.8+)
nvim --version

# Update all plugins (inside Neovim)
:Lazy update

# Sync plugins to match lazy-lock.json
:Lazy restore

# Profile plugin load times
:Lazy profile
```

### Linting and Formatting

The configuration uses nvim-lint and conform.nvim:
- **Linters**: markdownlint (markdown), clj-kondo (clojure), ruff (python), jsonlint (json), vale (text)
- **Formatters**: Configured in `lua/plugins/conform.lua`

Inside Neovim:
- Format current buffer: `<leader>fm` or `:Format`
- Linting happens automatically on buffer events

## Architecture Overview

### Plugin Organization
Each plugin has its own configuration file in `lua/plugins/`. Plugins are lazy-loaded based on events, commands, or filetypes for optimal startup performance.

### LSP Architecture
- **Mason**: Automatically installs and manages LSP servers
- **nvim-lspconfig**: Configures language servers
- **Completion**: Recently migrated from nvim-cmp to blink.cmp
- Extensive language support including TypeScript, Rust, Python, Java, and more

### Key Plugin Categories
1. **Editor Enhancement**: treesitter (syntax), telescope (fuzzy find), which-key (keybindings)
2. **Git Integration**: fugitive, gitsigns, neogit
3. **File Management**: oil.nvim (file explorer), harpoon (quick navigation)
4. **Development Tools**: nvim-dap (debugging), rest.nvim (HTTP client), avante.nvim (AI assistant)
5. **UI/UX**: lualine (statusline), catppuccin (colorscheme), snacks.nvim (UI utilities)

### Recent Architecture Changes
- Switched completion engine from nvim-cmp to blink.cmp
- Added Harpoon for improved file navigation workflow
- Integrated Neogit as an alternative git interface
- Added debugging support via nvim-dap with language-specific adapters

## Development Tips

1. When modifying plugins, edit the specific file in `lua/plugins/`
2. After adding new plugins, run `:Lazy` to install them
3. Use `:checkhealth` to diagnose configuration issues
4. The configuration uses protected calls (`pcall`) for robustness - check `:messages` for errors