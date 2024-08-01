local fb_actions = require("telescope").extensions.file_browser.actions

return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-file-browser.nvim',
    'nvim-telescope/telescope-media-files.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make'
    }
  },
  opts = {
    defaults = {
      mappings = {
        n = {
          ["q"] = require('telescope.actions').close
        },
      },
    },
    extensions = {
      media_files = {
        -- filetypes whitelist
        -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
        filetypes = { "png", "webp", "jpg", "jpeg" },
        -- find command (defaults to `fd`)
        find_cmd = "rg"
      },
      file_browser = {
        theme = "dropdown",
        -- disables netrw and use telescope-file-browser in its place
        hijack_netrw = true,
        mappings = {
          -- your custom insert mode mappings
          ["i"] = {
            ["<C-w>"] = function() vim.cmd('normal vbd') end,
          },
          ["n"] = {
            -- your custom normal mode mappings
            ["a"] = fb_actions.create,
            ["h"] = fb_actions.goto_parent_dir,
            ["/"] = function()
              vim.cmd('startinsert')
            end
          },
        },
      },
      fzf = {
        fuzzy = true,                   -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true,    -- override the file sorter
        case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
        -- the default case_mode is "smart_case"
      },
    },
  },
  config = function(_, opts)
    local telescope = require('telescope')
    telescope.setup(opts)

    telescope.load_extension("file_browser")
    telescope.load_extension("media_files")
    telescope.load_extension("noice")
    telescope.load_extension("fzf")

    vim.telescope_buffer_dir = function()
      return vim.fn.expand('%:p:h')
    end


    keymap.set('n', ';f', function()
      require('telescope.builtin').find_files({
        no_ignore = true,
        hidden = true
      })
    end)

    keymap.set('n', ';r', function() require('telescope.builtin').live_grep() end,
      { desc = "Search a wornd in all files in this project" })
    keymap.set('n', '\\\\', function() require('telescope.builtin').buffers() end, { desc = 'Show all open buffers' })
    keymap.set('n', ';t', function() require('telescope.builtin').help_tags() end, { desc = 'Show help tags' })
    keymap.set('n', ';;', function() require('telescope.builtin').resume() end)
    keymap.set('n', ';e', function() require('telescope.builtin').diagnostics() end, { desc = 'Show diagnostics' })
    keymap.set('n', ';s', function() require('telescope.builtin').current_buffer_fuzzy_find() end)

    keymap.set('n', 'sf', function()
      require('telescope').extensions.file_browser.file_browser({
        path = "%:p:h",
        cwd = vim.telescope_buffer_dir(),
        respect_gitignore = false,
        hidden = true,
        grouped = true,
        previewer = false,
        initial_mode = "normal",
        layout_config = { height = 20 }
      })
    end)
  end,
}
