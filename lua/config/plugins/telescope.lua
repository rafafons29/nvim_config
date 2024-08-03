local telescope = require("telescope")
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

local fb_actions = telescope.extensions.file_browser.actions
local M = {}

function M.setup()
  telescope.load_extension("noice")
  telescope.setup {
    defaults = {
      mappings = {
        n = {
          ["q"] = actions.close
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
        previewer = false,
        initial_mode = "normal",
        layout_config = { height = 20, width = 110 },
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
  }

  telescope.load_extension("file_browser")
  telescope.load_extension("media_files")
  telescope.load_extension("fzf")

  vim.telescope_buffer_dir = function()
    return vim.fn.expand('%:p:h')
  end

  keymap.set('n', ';f',
    function()
      builtin.find_files({
        no_ignore = true,
        hidden = true
      })
    end)
  keymap.set('n', ';r', function() builtin.live_grep() end)
  keymap.set('n', '\\\\', function() builtin.buffers() end)
  keymap.set('n', ';t', function() builtin.help_tags() end)
  keymap.set('n', ';;', function() builtin.resume() end)
  keymap.set('n', ';e', function() builtin.diagnostics() end)
  keymap.set('n', ';s', function() builtin.current_buffer_fuzzy_find() end)
  keymap.set("n", "sf", function()
    telescope.extensions.file_browser.file_browser({
      path = "%:p:h",
      cwd = vim.telescope_buffer_dir(),
      respect_gitignore = false,
      hidden = true,
      grouped = true,
      previewer = false,
      initial_mode = "normal",
      layout_config = { height = 20, width = 110 },
    })
  end)
end

return M
