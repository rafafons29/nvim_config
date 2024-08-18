local telescope = require("telescope")
local actions = require("telescope.actions")
local action_generate = require("telescope.actions.generate")
local builtin = require("telescope.builtin")

local fb_actions = telescope.extensions.file_browser.actions
local M = {}

function M.setup()
  telescope.load_extension("noice")
  telescope.setup {
    defaults = {
      sorting_strategy = "ascending",
      file_ignore_patterns = { "node_modules", "dist", ".git", ".next" },
      path_display = function(opts, path)
        local tail = require("telescope.utils").path_tail(path)
        path = string.format("%s (%s)", tail, path)

        local highlights = {
          {
            {
              0,       -- highlight start position
              #path,   -- highlight end position
            },
            "Comment", -- highlight group name
          },
        }

        return path, highlights
      end,
      layout_config = {
        prompt_position = "top",
        horizontal = {
          width = 0.87,
          height = 0.80,
          preview_width = 0.55,
        },
      },
      mappings = {
        n = {
          ["q"] = actions.close,
          ["?"] = action_generate.which_key {
            name_width = 20,           -- typically leads to smaller floats
            max_height = 0.5,          -- increase potential maximum height
            separator = " > ",         -- change sep between mode, keybind, and name
            close_with_action = false, -- do not close float on action
          }
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
        path_display = { "filename_first" },
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

  keymap_set({
    { 'n', ';r',   function() builtin.live_grep() end,                 { desc = "Open Telescope to live grep" } },
    { 'n', '\\\\', function() builtin.buffers() end,                   { desc = "Open Telescope to view open buffers" } },
    { 'n', ';t',   function() builtin.help_tags() end,                 { desc = "Open Telescope to open help tags" } },
    { 'n', ';;',   function() builtin.resume() end,                    { desc = "Open Telescope with resume" } },
    { 'n', ';e',   function() builtin.diagnostics() end,               { desc = "Open Telescope to view the diagnostics" } },
    { 'n', ';s',   function() builtin.current_buffer_fuzzy_find() end, { desc = "Open Telescope to see current buffers" } },
    { 'n', ';f', function()
      builtin.find_files({
        no_ignore = true,
        hidden = true
      })
    end, { desc = "Open telescope to find files" } },
    { "n", "sf", function()
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
    end, { desc = "Open Telescope file browser" } }
  })
end

return M
