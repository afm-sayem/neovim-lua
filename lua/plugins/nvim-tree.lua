-----------------------------------------------------------
-- File manager configuration file
-----------------------------------------------------------

-- Plugin: nvim-tree
-- https://github.com/kyazdani42/nvim-tree.lua

-- Keybindings are defined in `keymapping.lua`:
--- https://github.com/kyazdani42/nvim-tree.lua#keybindings

-- Note: options under the g: command should be set BEFORE running the
--- setup function:
--- https://github.com/kyazdani42/nvim-tree.lua#setup
--- See: `help NvimTree`
-- local g = vim.g

-- g.nvim_tree_git_hl = 1
-- g.nvim_tree_highlight_opened_files = 1
-- g.nvim_tree_respect_buf_cwd = 1
-- g.nvim_tree_width_allow_resize  = 1
-- g.nvim_tree_show_icons = {
--   git = 1,
--   folders = 1,
--   files = 1
-- }

-- g.nvim_tree_icons = {
-- }

require('nvim-tree').setup {
  open_on_setup = true,
  update_cwd = true,
  respect_buf_cwd = true,
  renderer = {
    indent_markers = {
      enable = true
    },
    highlight_git = true,
    icons = {
      glyphs = {
        default = "‣ "
      },
      show = {
        git = true,
        folder = true,
        file = true
      }
    }
  },
  actions = {
    open_file = {
      quit_on_open = false,
      resize_window = true,
      window_picker = {
        enable = false
      }
    }
  },
  view = {
    width = 32
  },
  filters = {
    dotfiles = true,
    custom = { '.git', 'node_modules', '.cache', '.bin' },
  },
  git = {
    enable = true,
    ignore = true,
  },
}
